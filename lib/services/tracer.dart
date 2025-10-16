// ignore_for_file: avoid_print

class Tracer {
	//===================================================
	static void marker( String className, String message ){
		String name = '$className '.padRight(20,'═');
		print( '═══ ${DateTime.now()} ═══ $name - $message '.padRight(120,'═') );
	}
}

