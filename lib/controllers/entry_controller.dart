import 'package:server/models/entry.dart';
import 'package:server/server.dart';

class EntryController extends ResourceController {

  final List<Entry> entries = [
    Entry()..id = 1 ..value = 1.0 ..entryDate = DateTime.now(),
    Entry()..id = 2 ..value = 2.0 ..entryDate = DateTime.now(),
    Entry()..id = 3 ..value = 3.0 ..entryDate = DateTime.now()
  ];

  @Operation.get()
  Future<Response> getAllEntry() async {
    return Response.ok(entries);
  }
}