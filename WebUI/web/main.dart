// Copyright (c) 2017, harikrik. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:angular2/platform/browser.dart';

import 'package:WebUI/app_component.dart';
import 'package:firebase/firebase.dart' as fb;

void main() {
  bootstrap(AppComponent);

  fb.initializeApp(
      apiKey: "AIzaSyC1xQEPO5zwcHREA-Lf9i02bG7a3cXCYFQ",
      authDomain: "siththar-gnaanaalayam.firebaseapp.com",
      databaseURL: "https://siththar-gnaanaalayam.firebaseio.com",
      storageBucket: "siththar-gnaanaalayam.appspot.com"
  );

  fb.Database database = fb.database();
  fb.DatabaseReference ref = database.ref("people");

  ref.onValue.listen((e) {
    //fb.DataSnapshot datasnapshot = e.snapshot;
    // Do something with datasnapshot
  });
}
