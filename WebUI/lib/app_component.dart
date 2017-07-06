// Copyright (c) 2017, harikrik. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:angular2/angular2.dart';
import 'package:angular_components/angular_components.dart';
import 'services/firebase_services.dart' as fb;

// AngularDart info: https://webdev.dartlang.org/angular
// Components info: https://webdev.dartlang.org/components

@Component(
  selector: 'my-app',
  styleUrls: const ['app_component.css'],
  templateUrl: 'app_component.html',
  directives: const [materialDirectives],
  providers: const [materialProviders, fb.FirebaseService],
)
class AppComponent {
  final fb.FirebaseService fbService;
  String name;
  num mobile_no;

  AppComponent(fb.FirebaseService this.fbService);

  void addPeople(){
    fbService.addPeople(name: name,mobile_no: mobile_no);
  }
}