
import 'package:demo/model/product.dart';
import 'package:floor/floor.dart';

@dao
abstract class ProductDao {

  @Query('SELECT * FROM Product')
  Future<List<Product>> getAllProducts();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertProducts(List<Product> products);
}