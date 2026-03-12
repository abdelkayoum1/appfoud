import 'package:appfoud/core/approute.dart';
import 'package:appfoud/core/supabase.dart';
import 'package:appfoud/feature/my_favorate/home/models/favorate_model.dart';
import 'package:appfoud/feature/presentation/screnn/foud_home.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(FavorateModelAdapter());
  await Hive.openBox<FavorateModel>('favoraties');
  await Supabasee.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      // home: FoudHome(),
      routerConfig: Approute.router,
    );
  }
}
