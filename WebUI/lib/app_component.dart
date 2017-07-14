// Copyright (c) 2017, harikrik. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:angular2/angular2.dart';
import 'package:angular_components/angular_components.dart';
import 'services/firebase_services.dart' as fb;
import 'models/people.dart';

// AngularDart info: https://webdev.dartlang.org/angular
// Components info: https://webdev.dartlang.org/components

@Component(
  selector: 'my-app',
  styleUrls: const ['app_component.css'],
  templateUrl: 'app_component.html',
  directives: const [CORE_DIRECTIVES, materialDirectives, COMMON_DIRECTIVES, materialNumberInputDirectives],
  providers: const [materialProviders, fb.FirebaseService],
)
class AppComponent {
  final fb.FirebaseService fbService;
  People modalPeople = new People('');
  People gettingUpdated;

  bool showAddPeople;

  AppComponent(fb.FirebaseService this.fbService);

  void addOrUpdatePeople(){
    if(modalPeople.key == null)
      fbService.addPeople(modalPeople);
    else
      fbService.updatePeople(modalPeople);

    cancelEditing();
  }

  void updatePeople(People people)
  {
    modalPeople = new People.fromMap(people.toMap());
    modalPeople.key = people.key;
    gettingUpdated = people;
    showAddPeople = true;
  }

  void cancelEditing()
  {
    //Clear the input values after adding
    modalPeople = new People('');
    showAddPeople = false;
  }
}