import 'package:tuneroot_application/models/model.dart';

abstract class MusicDAO {
  Future<Map<String, dynamic>> getMusics();
  Future<List<Category>> getCategories();
}
