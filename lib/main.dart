import 'package:flutter/material.dart';
import 'package:horecah/view_models/form1_vm.dart';
import 'package:horecah/view_models/form2_vm.dart';
import 'package:horecah/views/form1.dart';
import 'package:horecah/views/form2.dart';
import 'package:horecah/views/profile.dart';
import 'package:provider/provider.dart';

import 'models/form1_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<FirstPageViewModel>(
          create: (_) => FirstPageViewModel(),
        ),
        ChangeNotifierProvider<SecondPageViewModel>(
          create: (_) => SecondPageViewModel(),
        ),
        Provider.value(
          value: UserModel(), // Providing UserModel without ChangeNotifier
        ),
      ],
      child: MaterialApp(
        title: 'Horecah',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MainPage(), // Main entry point of the app
        routes: {
          '/profile': (context) => ProfilePage(),
          // Add other routes here if needed
        },
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Horecah'),backgroundColor: Colors.indigo,
      ),
      body: Navigator(
        initialRoute: '/', // Start with the FirstPage
        onGenerateRoute: (RouteSettings settings) {
          WidgetBuilder builder;
          switch (settings.name) {
            case '/':
              builder = (_) => Form1();
              break;
            case '/second':
              builder = (_) => Form2();
              break;
            case '/profile':
              builder = (_) => ProfilePage();
              break;
            default:
              throw Exception('Invalid route: ${settings.name}');
          }
          return MaterialPageRoute(builder: builder, settings: settings);
        },
      ),
    );
  }
}
