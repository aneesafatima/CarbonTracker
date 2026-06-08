import 'package:carbon_tracker/database/database_helper.dart';
import 'package:carbon_tracker/database/models/user.dart';

class UserRepository {
  final DatabaseHelper _databaseHelper = DatabaseHelper();

  Future<User?> getUser() async {
    return await _databaseHelper.queryUser();
  }

  Future<void> saveUser(User user) async {
    await _databaseHelper.insert('user', user);
  }
}
