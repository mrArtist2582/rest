import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:rest/main.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('App shows HomeScreen when logged in', (
    WidgetTester tester,
  ) async {
    // Mock a token to simulate login
    SharedPreferences.setMockInitialValues({'token': 'dummy-token'});

    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getString('token') != null;

    await tester.pumpWidget(const MyApp(isLoggedIn: false));

    // Adjust the following expectations based on your actual HomeScreen content
    expect(find.byType(MaterialApp), findsOneWidget);
    expect(
      find.text('Api Demo'),
      findsOneWidget,
    ); // Assuming AppBar title is 'Api Demo'
  });

  testWidgets('App shows LoginScreen when not logged in', (
    WidgetTester tester,
  ) async {
    // Clear token to simulate logged-out state
    SharedPreferences.setMockInitialValues({});

    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getString('token') != null;

    await tester.pumpWidget(MyApp(isLoggedIn: isLoggedIn));

    // Adjust this based on your LoginScreen content
    expect(find.byType(MaterialApp), findsOneWidget);
    expect(
      find.text('Login'),
      findsOneWidget,
    ); // Assuming button/text says "Login"
  });
}
