import 'package:appwrite/appwrite.dart';
import 'package:aprovik/constants.dart';
import 'package:aprovik/model/user.model.dart';

class UserController {
  static Future<User> getUser() async {
    Account ac = Account(Constants.cl);
    Response user = await ac.get();
    Constants.usr = User.fromJson(user.data);
    return Constants.usr;
  }
}
