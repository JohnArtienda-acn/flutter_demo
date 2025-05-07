import 'package:demo/bloc/homescreenbloc.dart';
import 'package:demo/dependency/depencency.dart';
import 'package:demo/router/router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'firebase_options.dart';
import 'theme.dart';

Future<void> main() async {
  setupDependency();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const Demo());
}

class Demo extends StatelessWidget {
  const Demo({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeScreenBloc>(create: (context) => dependency<HomeScreenBloc>()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(colorScheme: lightScheme, useMaterial3: true),
        darkTheme: ThemeData(colorScheme: darkScheme, useMaterial3: true),
        routerConfig: router,
      ),
    );
  }
}
