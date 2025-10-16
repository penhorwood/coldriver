// https://stackoverflow.com/questions/50438847/initialize-class-with-asynchronous-variable
import 'dart:io';
import 'package:path_provider/path_provider.dart';
// ==================================================


// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
class Folders {
	String supportFolder;
	String docFolder;
	String dbFolder;

	// ==================================================
	Folders._(
		  this.supportFolder
		, this.docFolder
		, this.dbFolder
	);

	// ==================================================
	static Future<Folders> instance() async {
		String supportFolder = (await getApplicationSupportDirectory()).absolute.path;
		String docFolder     = (await getApplicationDocumentsDirectory()).absolute.path;

		Directory dbDir  = await Directory( '$supportFolder/database' ).create( recursive: true );

		return Folders._(
			  supportFolder
			, docFolder
			, dbDir.absolute.path
		);
	}
}