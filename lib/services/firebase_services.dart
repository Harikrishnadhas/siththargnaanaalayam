import 'dart:async';

import 'package:angular2/core.dart';
import 'package:firebase/firebase.dart' as fb;

import '../models/Person.dart';

@Injectable()
class FirebaseService {
  fb.Auth _fbAuth;
  fb.GoogleAuthProvider _fbGoogleAuthProvider;
  fb.Database _fbDatabase;
  //fb.Storage _fbStorage;
  fb.DatabaseReference _fbRefPerson;
  fb.User user;
  List<Person> personList;

  FirebaseService() {
    fb.initializeApp(
        apiKey: "AIzaSyC1xQEPO5zwcHREA-Lf9i02bG7a3cXCYFQ",
        authDomain: "siththar-gnaanaalayam.firebaseapp.com",
        databaseURL: "https://siththar-gnaanaalayam.firebaseio.com",
        storageBucket: "siththar-gnaanaalayam.appspot.com");

    _fbGoogleAuthProvider = new fb.GoogleAuthProvider();
    _fbAuth = fb.auth();
    _fbAuth.onAuthStateChanged.listen(_authChanged);

    _fbDatabase = fb.database();
    _fbRefPerson = _fbDatabase.ref("person");
  }

  void _authChanged(fb.AuthEvent event) {
    user = event.user;

    if (user != null) {
      personList = [];
      _fbRefPerson.onChildAdded.listen(_personAdded);
      _fbRefPerson.onChildChanged.listen(_personUpdated);
      _fbRefPerson.onChildRemoved.listen(_personRemoved);
    }
  }

  void _personAdded(fb.QueryEvent event) {
    Person person = new Person.fromMap(event.snapshot.val());
    person.key = event.snapshot.key;
    personList.add(person);
  }

  void _personUpdated(fb.QueryEvent event) => personList
      .firstWhere((person) => person.key == event.snapshot.key)
      ?.assignMap(event.snapshot.val());

  void _personRemoved(fb.QueryEvent event) {
    Person person = new Person.fromMap(event.snapshot.val());
    personList.remove(person);
  }

  Future signIn() async {
    try {
      await _fbAuth.signInWithPopup(_fbGoogleAuthProvider);
    } catch (error) {
      print("$runtimeType::login() -- $error");
    }
  }

  void signOut() {
    _fbAuth.signOut();
  }

  Future addPerson(Person person) async {
    try {
      await _fbRefPerson.push(person.toMap());
    } catch (error) {
      print(error);
    }
  }

  Future removePerson(Person person) async {
    try {
      await _fbRefPerson.child(person.key).remove();
      personList.remove(person);
    } catch (error) {
      print(error);
    }
  }

  Future updatePerson(Person person) async {
    try {
      await _fbRefPerson.child(person.key).update(person.toMap());
    } catch (error) {
      print(error);
    }
  }
}
