import 'package:bytebank/screens/contacts_form.dart';
import 'package:bytebank/screens/contacts_lists.dart';
import 'package:bytebank/screens/dashboard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(BytebankApp());
}

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.green[900],
        accentColor: Colors.blueAccent[700],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blueAccent[700],
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/':(context) => Dashboard(),
        '/contactsList' : (context) => ContactsList(),
        '/contactsForm' : (context) => ContactsForm(),
      },
    );
  }
}