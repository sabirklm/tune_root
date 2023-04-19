import 'package:tuneroot_application/models/model.dart';

abstract class MusicDAO {
  getMusic();
  Future<List<Category>> getCategories();
}
