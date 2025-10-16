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
						, title: Text('Demo - Riverpod List Builder')
					)
					, backgroundColor: Colors.blueGrey.shade100
					, body: Center(
						child: Column(
							mainAxisAlignment: MainAxisAlignment.center
							, crossAxisAlignment: CrossAxisAlignment.center
							, spacing: 20
							, children: <Widget>[
								ElevatedButton(
									onPressed: () => createPeople()
									, child: Text('Setup People')
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