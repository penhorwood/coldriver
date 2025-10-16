import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
// ==================================================
import '/database/book.dart';
import '/database/person.dart';
import '/providers/current.dart';
import '/services/tracer.dart';
import '/services/mover.dart';
import '/bookCard.dart';
import '/homepage.dart';
// ==================================================


// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
class Details extends ConsumerStatefulWidget  {
	static const String route = '/Details';

	// ==================================================
	const Details({super.key});

	// ==================================================
	@override
	DetailsState createState() => DetailsState();
}

// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
class DetailsState extends ConsumerState<Details> {
	MapboxMap? mapController;

	//===================================================
	void goHome( BuildContext ctx ) {
		Mover.goPage(ctx, HomePage.route);
	}

	//===================================================
	@override
	void dispose() {
		mapController?.dispose();
		super.dispose();
	}

	//===================================================
	Future<void> mapCreated( MapboxMap controller ) async {
		controller.location.updateSettings(
			LocationComponentSettings(
				enabled: false
				, showAccuracyRing: true
				, puckBearingEnabled: true
			)
		);

		mapController = controller;
	}

	// ==================================================
	@override
	Widget build(BuildContext context) {
		Person person = ref.watch(currentProvider);
		final name = person.name ?? 'unknown';
		final List<Book> books = person.books ?? [];

		Tracer.marker( 'Details', 'build | $name' );

		return Scaffold(
			appBar: AppBar(
				backgroundColor: Theme.of(context).colorScheme.inversePrimary
				, title: Text('Demo - Person Details')
			)
			, backgroundColor: Colors.amber.shade100
			, body: Center(
				child: Column(
					mainAxisAlignment: MainAxisAlignment.center
					, crossAxisAlignment: CrossAxisAlignment.center
					, spacing: 20
					, children: <Widget>[
						ElevatedButton(
							onPressed: () => goHome( context )
							, style: ElevatedButton.styleFrom( backgroundColor: Colors.blue, foregroundColor: Colors.white)
							, child: const Text('return')
						)
						, Expanded(
							child: MapWidget(
								cameraOptions: CameraOptions(
									center: Point( coordinates: Position(-98.008444, 32.743258) )
									, zoom: 8
								)
								, onMapCreated: mapCreated
							)
						)
						, Text(name)
						, SizedBox(
							height: 300
							, child: ListView.builder(
								itemCount: books.length
								, itemBuilder: (context, index){
									return BookCard( book: books[index] );
								}
							)
						)
					]
				)
			)
		);
	}
}