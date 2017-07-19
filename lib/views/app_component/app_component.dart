// Copyright (c) 2017, harikrik. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:angular2/angular2.dart';
import 'package:angular_components/angular_components.dart';
import 'package:WebUI/services/firebase_services.dart' as fb;

import 'package:WebUI/views/person_list/person_list_component.dart';

// AngularDart info: https://webdev.dartlang.org/angular
// Components info: https://webdev.dartlang.org/components

@Component(
  selector: 'my-app',
  styleUrls: const ['app_component.css'],
  templateUrl: 'app_component.html',
  directives: const [CORE_DIRECTIVES, COMMON_DIRECTIVES, PersonList],
  providers: const [materialProviders, fb.FirebaseService],
)
class AppComponent {
  final fb.FirebaseService fbService;

  AppComponent(fb.FirebaseService this.fbService);
}
