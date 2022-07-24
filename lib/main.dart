import 'package:bit_initial/ui/screens/firebase/auth-page.dart';
import 'package:bit_initial/ui/screens/rick-morty/splashscreen.dart';
import 'package:bit_initial/utils/data/graphql-client.dart';
import 'package:bit_initial/utils/injector.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    new FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await EasyLocalization.ensureInitialized();

  configureDependencies();
  await initHiveForFlutter();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(
      EasyLocalization(
          supportedLocales: [Locale('en', 'US'), Locale('am', 'ET')],
          path: 'assets/lang',
          fallbackLocale: Locale('en', 'US'),
          child: ProviderScope(
              child: GraphQLProvider(client: graphqlClient, child: MyApp()))),
    );
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: 'Flutter Demo',
      theme: ThemeData(
          fontFamily: 'Nunito',
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Colors.white),
      home: SplashScreen(),
    );
  }
}
