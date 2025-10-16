import 'package:isar_community/isar.dart';
// ==================================================

// command:  dart run build_runner build --delete-conflicting-outputs

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
part 'book.g.dart';


//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
@embedded
class Book {
	String? title;

	// ==================================================
	Book();

	// ==================================================
	Book.set({
		required this.title
	});

	// ==================================================
	Book copyWith({
		String? title
	}){
		return Book.set(
			title: title ?? this.title
		);
	}
}