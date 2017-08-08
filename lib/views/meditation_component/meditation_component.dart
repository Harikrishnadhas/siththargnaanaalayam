// Copyright (c) 2017, harikrik. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:angular2/angular2.dart';
import 'package:WebUI/services/firebase_services.dart' as fb;
import 'package:WebUI/models/Meditation.dart';

@Component(
  selector: 'siththar-meditation',
  styleUrls: const ['meditation_component.css'],
  templateUrl: 'meditation_component.html',
  directives: const [CORE_DIRECTIVES, COMMON_DIRECTIVES],
)
class MeditationComponent {
  final fb.FirebaseService fbService;

  @Input()
  bool edit = false;

  @Input()
  Meditation meditation;

  MeditationComponent(fb.FirebaseService this.fbService);
}