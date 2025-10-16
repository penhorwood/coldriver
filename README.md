# Coldriver

Through testing it was discovered that Riverpod and Mapbox have issues co-existing under some configurations.  This demo app will highlight that configuration.

Run the app and press the "Setup People" button to create the needed database records.  Once that process completes press one of the names in the now displayed name card buttons.

The details page for that person will be displayed.  On the page will be a mapbox map and a list of book cards.  Press the "return" button to go back to the home page.

The "mapbox disposed" message will be displayed in the in the console or debug output.  Here is an example of that message.

══╡ EXCEPTION CAUGHT BY WIDGETS LIBRARY ╞═══════════════════════════════════════════════════════════
The following assertion was thrown while finalizing the widget tree:
A MapboxMap was used after being disposed.
Once you have called dispose() on a MapboxMap, it can no longer be used.
