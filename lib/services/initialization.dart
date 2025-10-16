import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:isar_community/isar.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
// ==================================================
import '/database/person.dart';
// ==================================================
import '/services/folders.dart';
// ==================================================


// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
class Initialization {
	static Initialization? _instance;

	// ==================================================
	Initialization._();

	// ==================================================
	factory Initialization(){
		_instance ??= Initialization._();
		return _instance!;
	}

	// ==================================================
	Future<Folders> initFolders() async {
		return Folders.instance();
	}

	// ==================================================
	void initMaps() {
		MapboxOptions.setAccessToken( 'pk.eyJ1IjoiYXBlbmhvcndvb2QiLCJhIjoiY21ndDJoYXk2MXN3NjJtcTQ1dzA0MWYwNCJ9.GEbK4tRlb_MSd4sbw14a9g' );
	}

	// ==================================================
	Future<Isar> initIsar( String dbFolder ) async {
		Isar isar = await Isar.open(
			[PersonSchema]
			, inspector: kReleaseMode ? false : true
			, directory: dbFolder
			, maxSizeMiB: 1024
		);

		return isar;
	}

	// ==================================================
	Future<Map> primer() async {
		WidgetsFlutterBinding.ensureInitialized();

		final Map primed = {};
		final Folders folders = await initFolders();
		final Isar isar = await initIsar( folders.dbFolder );

		initMaps();

		primed['folders'] = folders;
		primed['isar'] = isar;

		return primed;
	}
}