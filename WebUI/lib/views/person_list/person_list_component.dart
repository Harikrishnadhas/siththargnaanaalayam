import 'package:angular2/angular2.dart';
import 'package:angular_components/angular_components.dart';
import 'package:WebUI/services/firebase_services.dart' as fb;
import 'package:WebUI/models/Person.dart';
import 'package:WebUI/views/person_edit/person_edit_component.dart';

@Component(
  selector: 'person-list',
  styleUrls: const ['person_list_component.css'],
  templateUrl: 'person_list_component.html',
  directives: const [CORE_DIRECTIVES, materialDirectives, COMMON_DIRECTIVES, PersonEdit],
)

class PersonList{
  final fb.FirebaseService fbService;
  Person modalPerson = new Person('');
  Person gettingUpdated;

  bool showAddPerson;

  PersonList(fb.FirebaseService this.fbService);

  void addOrUpdatePerson(){
    if(modalPerson.key == null)
      fbService.addPerson(modalPerson);
    else
      fbService.updatePerson(modalPerson);

    cancelEditing();
  }

  void updatePerson(Person person)
  {
    modalPerson = new Person.fromMap(person.toMap());
    modalPerson.key = person.key;
    gettingUpdated = person;
    showAddPerson = true;
  }

  void cancelEditing()
  {
    //Clear the input values after adding
    modalPerson = new Person('');
    showAddPerson = false;
  }
}