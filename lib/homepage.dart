import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// ==================================================
import '/services/tracer.dart';
// ==================================================
import '/providers/service.dart';
// ==================================================
import '/personCard.dart';
// ==================================================


// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
class HomePage extends ConsumerStatefulWidget  {
	static const String route = '/HomePage';

	// ==================================================
	const HomePage({super.key});

	// ==================================================
	@override
	HomePageState createState() => HomePageState();
}

// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
class HomePageState extends ConsumerState<HomePage> {

	// ==================================================
	Future<void> createPeople() async {
		await ref.read(serviceProvider.notifier).loader();
		ref.invalidate(serviceProvider);
	}

	// ==================================================
	@override
	Widget build(BuildContext context) {
		final AsyncValue people = ref.watch(serviceProvider);

		return people.when(
			loading: () => const Center(child: CircularProgressIndicator())
			, error: (err, stack) => Center(child: Text('Error: $err'))
			, data: ( people ){

				Tracer.marker( 'homepage', 'builder | ${people.length}' );

				return Scaffold(
					appBar: AppBar(
						backgroundColor: Theme.of(context).colorScheme.inversePrimary
						, title: Text('Demo - Riverpod Mapbox issue')
					)
					, backgroundColor: Colors.blueGrey.shade100
					, body: Center(
						child: Column(
							mainAxisAlignment: MainAxisAlignment.center
							, crossAxisAlignment: CrossAxisAlignment.center
							, spacing: 20
							, children: <Widget>[
								SizedBox(height: 5)
								, ElevatedButton(
									onPressed: () => createPeople()
									, style: ElevatedButton.styleFrom( backgroundColor: Colors.blue, foregroundColor: Colors.white)
									, child: Text('Setup People')
								)
								, Text(
									'On a fresh install press the "Setup People" button to create the needed data records'
									'To demo the issue press one of the people names to go to the details page.  That page will display a map and a list of books'
									'Once the details page loads press the return button at the top.  The error will be triggered.'
								)
								, Expanded(
									child: ListView.builder(
										itemCount: people.length
										, itemBuilder: (context, index){
											return PersonCard( person: people[index] );
										}
									)
								)
							]
						)
					)
				);
			}
		);
	}
}