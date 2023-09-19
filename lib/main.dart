import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:mysellproject/provider/app_provider.dart';
import 'package:mysellproject/screens/auth/welcome/welcome.dart';
import 'package:mysellproject/screens/custom_bottom_bar/custom_bottom_bar.dart';
import 'package:provider/provider.dart';

import 'constants/theme.dart';
import 'firebase_helper/firebase_auth_helper/firebase_auth_helper.dart';
import 'firebase_helper/firebase_options/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey =
  "pk_test_51NBuwqKHlzhy49rJqCixptexcoffgk3lYTA8wblP3zYTDtzF5t1aawRlH5YUA5OaKwdJ1wH0bdaqC4cZbSeeiToM00anI1n11I";
  await Firebase.initializeApp(
    options: DefaultFirebaseConfig.platformOptions,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Rakhman Sells',
        theme: themeData,
        home: StreamBuilder(
          stream: FirebaseAuthHelper.instance.getAuthChange,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const CustomBottomBar();
            }
            return const Welcome();
          },
        ),
      ),
    );
  }
}
