import 'dart:async';

import 'package:demo/repository/category_dao.dart';
import 'package:demo/repository/product_dao.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import '../model/category.dart';
import '../model/product.dart';

part 'app_database.g.dart';

@Database(version: 1, entities: [Product, Category])
abstract class AppDatabase extends FloorDatabase {
  ProductDao get productDao;
  CategoryDao get categoryDao;
}