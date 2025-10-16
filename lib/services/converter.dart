import 'dart:convert';
// ==================================================


//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
class Converter {

	// ==================================================
	static String parseUnicode( String? source ){
		const Utf8Decoder decoder = Utf8Decoder( allowMalformed: true);

		if( source != null ){
			return decoder.convert( source.codeUnits );
		}

		return '';
	}

	// ==================================================
	static double parseDouble( dynamic source ) {
		// from String
		if( source.runtimeType == String ){
			return double.parse( source );
		}

		// from Integer
		if( source.runtimeType == int ){
			int temp = source as int;
			return temp.toDouble();
		}

		// from Boolean
		if( source.runtimeType == bool ){
			return source ? 1 : 0;
		}

		return source.runtimeType == double ? source : throw const FormatException();
	}

	// ==================================================
	static int parseInt( dynamic source ) {
		// from String
		if( source.runtimeType == String ){
			return int.parse( source );
		}

		// from Double
		if( source.runtimeType == double ){
			double temp = source as double;
			return temp.toInt();
		}

		// from Boolean
		if( source.runtimeType == bool ){
			return source ? 1 : 0;
		}

		return source.runtimeType == int ? source : throw const FormatException();
	}

	// ==================================================
	static DateTime? convertDateTime( String? source ){
		return source != null ? DateTime.tryParse( source ) : null;
	}

	// ==================================================
	static DateTime? convertPastEpoch( String? source ){
		if( source == null ){
			return null;
		}
		int msPastEpoch = parseInt( source );
		return DateTime.fromMillisecondsSinceEpoch( msPastEpoch );
	}
}