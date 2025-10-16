// https://stackoverflow.com/questions/50037710/flutter-move-to-a-new-screen-without-providing-navigate-back-to-previous-screen

import 'package:flutter/material.dart';
// ==================================================


//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
class Mover {
	//===================================================
	static void goPage( BuildContext ctx, String route ){
		Navigator.of(ctx, rootNavigator: true).pushNamedAndRemoveUntil( route, (Route<dynamic> r) => false );
	}
}