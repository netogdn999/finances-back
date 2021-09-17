import 'package:server/models/category.dart';
import 'package:server/models/entry.dart';
import 'package:server/models/subcategory.dart';
import 'package:server/server.dart';

class CategoryController extends ResourceController {

  final List<Category> categories = List.generate(3, 
    (index) {
      final entries = List.generate(3, 
        (index) => Entry() 
          ..id = index 
          ..value = index.toDouble() 
          ..entryDate = DateTime.now()
      );
      final subcategories = List.generate(3, (index) => Subcategory()
        ..id = index
        ..name = "Subcategory $index"
        ..entries = entries
      );
      return Category()
        ..id = index
        ..name = "Category $index"
        ..subcategories = subcategories
        ..isRevenue = index%2 == 0;
    }
  );

  @Operation.get()
  Future<Response> getAllCategories() async {
    return Response.ok(categories);
  }
}