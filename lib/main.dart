import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar_community/isar.dart';
import 'package:page_route_animator/page_route_animator.dart';
// ==================================================
import '/services/initialization.dart';
import '/services/tracer.dart';
// ==================================================
import '/details.dart';
import '/homepage.dart';
// ==================================================

final isarProvider = Provider<Isar>( (ref){ throw UnimplementedError(); } );

// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
void main() async {
	Tracer.marker('main', 'app started');

	final Initialization initializer = Initialization();
	Map primed = await initializer.primer();
	Isar isar = primed['isar'];

	final ProviderContainer container = ProviderContainer(
		overrides: [
			isarProvider.overrideWith( (ref){return isar;} )
		]
	);

	runApp(
		UncontrolledProviderScope(
			container: container
			, child: App()
		)
	);
}

// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
class App extends StatefulWidget {
	const App({
		super.key
	});

	// ==================================================
	@override
	AppState createState() => AppState();
}

class AppState extends State<App> {

	// ==================================================
	@override
	Widget build(BuildContext context) {
		Tracer.marker('main', 'build');

		return MaterialApp(
			  home: const HomePage()
			, onGenerateRoute: generateRoute
			, theme: ThemeData(
				 colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue.shade800)
			)
		);
	}
}

//===================================================
Route<dynamic> generateRoute( RouteSettings routeSettings ){

	const int speed = 500;
	const RouteAnimation registerAnimation = RouteAnimation.leftToRightWithFade;

	switch( routeSettings.name ){
		case Details.route:
			return PageRouteAnimator(
				  child: const Details()
				, routeAnimation: registerAnimation
				, settings: routeSettings
				, curve: Curves.linear
				, duration: const Duration(milliseconds: speed)
				, reverseDuration: const Duration(milliseconds: speed)
			);

		case HomePage.route:
		default:
			return PageRouteAnimator(
				  child: const HomePage()
				, routeAnimation: registerAnimation
				, settings: routeSettings
				, curve: Curves.linear
				, duration: const Duration(milliseconds: speed)
				, reverseDuration: const Duration(milliseconds: speed)
			);
	}
}
