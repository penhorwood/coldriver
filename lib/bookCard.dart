// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// ==================================================
import '/services/tracer.dart';
import '/services/mover.dart';
// ==================================================
import '/database/book.dart';
// ==================================================
import '/details.dart';
// ==================================================


//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
class BookCard extends ConsumerStatefulWidget {
	final Book book;

	const BookCard({
		required this.book
		, super.key
	});

	//===================================================
	@override
	BookCardState createState() => BookCardState();
}

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
class BookCardState extends ConsumerState<BookCard> {

	//===================================================
	void doDetails( BuildContext ctx ) {
		Mover.goPage(ctx, Details.route);
	}

	//===================================================
	@override
	Widget build(BuildContext context) {
		final Book book = widget.book;
		String title = book.title ?? 'unknown';

		Tracer.marker('BookCard', 'build | $title');

		return Card(
			margin: EdgeInsets.all(5)
			, color: Colors.black
			, child: Container(
				padding: EdgeInsets.all(10)
				, child: Text( title, textAlign: TextAlign.center, style: TextStyle( color: Colors.white ) )
			)
		);
	}
}