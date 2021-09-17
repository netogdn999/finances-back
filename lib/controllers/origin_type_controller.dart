import 'package:server/models/category.dart';
import 'package:server/models/entry.dart';
import 'package:server/models/origin.dart';
import 'package:server/models/origin_type.dart';
import 'package:server/models/subcategory.dart';
import 'package:server/server.dart';

class OriginTypeController extends ResourceController {

  final List<OriginType> originTypes = List.generate(3,
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
      final categories = List.generate(3, (index) => Category() 
        ..id = index
        ..name = "Category $index"
        ..isRevenue = index%2 == 0
        ..subcategories = subcategories
      );
      final origins = List.generate(3, (index) => Origin()
        ..id = index
        ..name = "Origin $index"
        ..categories = categories
      );
      return OriginType()
        ..id = index
        ..name = "Origin type $index"
        ..origins = origins;
    }
  );

  @Operation.get()
  Future<Response> getAllOriginTypes() async {
    return Response.ok(originTypes);
  }
}