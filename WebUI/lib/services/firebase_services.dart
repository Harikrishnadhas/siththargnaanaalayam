import 'dart:async';

import 'package:angular2/core.dart';
import 'package:firebase/firebase.dart' as fb;

import '../models/people.dart';

@Injectable()
class FirebaseService {
  fb.Auth _fbAuth;
  fb.GoogleAuthProvider _fbGoogleAuthProvider;
  fb.Database _fbDatabase;
  //fb.Storage _fbStorage;
  fb.DatabaseReference _fbRefPeoples;
  fb.User user;
  List<People> peoples;

  FirebaseService() {
    fb.initializeApp(
        apiKey: "AIzaSyC1xQEPO5zwcHREA-Lf9i02bG7a3cXCYFQ",
        authDomain: "siththar-gnaanaalayam.firebaseapp.com",
        databaseURL: "https://siththar-gnaanaalayam.firebaseio.com",
        storageBucket: "siththar-gnaanaalayam.appspot.com"
    );

    _fbGoogleAuthProvider = new fb.GoogleAuthProvider();
    _fbAuth = fb.auth();
    _fbAuth.onAuthStateChanged.listen(_authChanged);

    _fbDatabase = fb.database();
    _fbRefPeoples = _fbDatabase.ref("peoples");
  }

  void _authChanged(fb.AuthEvent event)
  {
    user = event.user;

    if(user != null){
      peoples = [];
      _fbRefPeoples.onChildAdded.listen(_newPeople);
      _fbRefPeoples.onChildChanged.listen(_updatePeople);
      _fbRefPeoples.onChildRemoved.listen(_peopleRemoved);
    }
  }

  void _newPeople(fb.QueryEvent event){
    People ppl = new People.fromMap(event.snapshot.val());
    ppl.key = event.snapshot.key;
    peoples.add(ppl);
  }

  void _updatePeople(fb.QueryEvent event) =>
    peoples.firstWhere((people) => people.key == event.snapshot.key)?.assignMap(event.snapshot.val());
  
  void _peopleRemoved(fb.QueryEvent event){
    People ppl = new People.fromMap(event.snapshot.val());
    peoples.remove(ppl);
  }

  Future signIn() async
  {
    try
    {
      await _fbAuth.signInWithPopup(_fbGoogleAuthProvider);
    }
    catch(error)
    {
      print("$runtimeType::login() -- $error");
    }
  }

  void signOut() {
    _fbAuth.signOut();
  }

  Future addPeople(People ppl) async{
    try{
      await _fbRefPeoples.push(ppl.toMap());
    }
    catch(error){
      print(error);
    }
  }

  Future removePeople(People ppl) async{
    try{
      await _fbRefPeoples.child(ppl.key).remove();
      peoples.remove(ppl);
    }
    catch(error){
      print(error);
    }
  }

  Future updatePeople(People ppl) async{
    try{
      await _fbRefPeoples.child(ppl.key).update(ppl.toMap());
    }
    catch(error){
      print(error);
    }
  }
}