
import 'package:demo/bloc/homescreenbloc.dart';
import 'package:demo/firebase_service/firestore_helper.dart';
import 'package:demo/firebase_service/firestore_helper_impl.dart';
import 'package:demo/repository/category_dao.dart';
import 'package:demo/repository/product_dao.dart';
import 'package:get_it/get_it.dart';
import 'package:floor/floor.dart';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'package:async/async.dart';

import '../repository/app_database.dart';

final dependency = GetIt.instance;

Future<void> setupDependency() async {
  await deleteDb();
  final db = await $FloorAppDatabase.databaseBuilder("app_database.db").build();

  dependency.registerSingleton<AppDatabase>(db);
  dependency.registerSingleton<ProductDao>(db.productDao);
  dependency.registerSingleton<CategoryDao>(db.categoryDao);

  dependency.registerLazySingleton<FireStoreHelper>(() => FireStoreHelperImpl(dependency(), dependency()));

  dependency.registerFactory<HomeScreenBloc>(() => HomeScreenBloc(dependency()));
}

Future<void> deleteDb() async {
  final dbPath = await getDatabasesPath();
  final path = join(dbPath, 'app_database.db');
  await deleteDatabase(path);
}
