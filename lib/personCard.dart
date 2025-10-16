// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// ==================================================
import '/database/person.dart';
import '/providers/current.dart';
import '/services/tracer.dart';
import '/services/mover.dart';
import '/details.dart';
// ==================================================


//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
class PersonCard extends ConsumerStatefulWidget {
	final Person person;

	const PersonCard({
		required this.person
		, super.key
	});

	//===================================================
	@override
	PersonCardState createState() => PersonCardState();
}

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
class PersonCardState extends ConsumerState<PersonCard> {

	//===================================================
	void doDetails( BuildContext ctx, String name ) {
		ref.read(currentProvider.notifier).setCurrent( name );
		Mover.goPage(ctx, Details.route);
	}

	//===================================================
	@override
	Widget build(BuildContext context) {
		final Person person = widget.person;
		String name = person.name ?? 'unknown';

		Tracer.marker('PersonCard', 'build | $name');

		return Card(
			margin: EdgeInsets.all(5)
			, child: GestureDetector (
				onTap: () => doDetails( context, name )
				, child: Container(
					padding: EdgeInsets.all(10)
					, child: Text( name, textAlign: TextAlign.center )
				)
			)
		);
	}
}