import 'package:floor/floor.dart';

@entity
class Category {
  @primaryKey
  final String category;

  Category(this.category);
}