import 'package:angular2/angular2.dart';
import 'package:angular_components/angular_components.dart';
import 'package:WebUI/models/Person.dart';

@Component(
  selector: 'person-edit',
  styleUrls: const ['person_edit_component.css'],
  templateUrl: 'person_edit_component.html',
  directives: const [
    CORE_DIRECTIVES,
    materialDirectives,
    COMMON_DIRECTIVES,
    materialNumberInputDirectives
  ],
)
class PersonEdit {
  @Input()
  Person modalPerson;
}
