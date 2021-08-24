import 'package:appwrite/appwrite.dart';
import 'package:aprovik/model/user.model.dart';

class Constants {
  static Client cl = Client()
      .setEndpoint('https://132.145.96.217:3001/v1') // Your Appwrite Endpoint
      .setProject('61205e65dfc7c') // Your project ID
      .setSelfSigned();

  static User usr;
}
