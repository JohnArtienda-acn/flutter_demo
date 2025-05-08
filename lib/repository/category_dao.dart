

import 'package:floor/floor.dart';

import '../model/category.dart';

@dao
abstract class CategoryDao {

  @Query('SELECT * FROM Category')
  Future<List<Category>> getCategories();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertCategories(List<Category> category);
}