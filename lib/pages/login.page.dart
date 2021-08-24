import 'package:appwrite/appwrite.dart';
import 'package:aprovik/constants.dart';
import 'package:aprovik/controller/user.controller.dart';
import 'package:aprovik/model/user.model.dart';
import 'package:aprovik/pages/home.page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';

class LoginScreen extends StatelessWidget {
  Duration get loginTime => Duration(milliseconds: 2250);

  Future<String> _authUser(LoginData data) async {
    Account account = Account(Constants.cl);

    try {
      await account.deleteSessions();
    } catch (e) {}
    try {
      await account.createSession(email: data.name, password: data.password);

      Response user = await account.get();
      Constants.usr = User.fromJson(user.data);
      return null;
    } catch (e) {
      return e.message;
    }
  }

  Future<String> registerUser(LoginData data) async {
    Account account = Account(Constants.cl);
    try {
      Response user = await account.create(
          email: data.name, password: data.password, name: data.name);
      Account ac = Account(Constants.cl);
      await ac.createSession(email: data.name, password: data.password);
      Map<dynamic, dynamic> prefs = {
        "empresa": "Empresa",
        "endPoint": "",
        "auth": "none",
        "bearer": "",
        "basicUser": "",
        "basicPass": ""
      };
      await ac.updatePrefs(prefs: prefs);
      await ac.createVerification(url: "https://132.145.96.217/");
      await UserController.getUser();
      return null;
    } catch (e) {
      return e.message;
    }
  }

  Future<String> _recoverPassword(String name) async {
    Account account = Account(Constants.cl);
    try {
      Response recovery = await account.createRecovery(email: name, url: "url");
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'AproviK',
      logo: 'assets/verified.png',
      messages: LoginMessages(
          goBackButton: "Voltar",
          flushbarTitleError: "Erro",
          flushbarTitleSuccess: "Sucesso",
          signupButton: "Registrar",
          loginButton: "Entrar",
          passwordHint: "Senha",
          forgotPasswordButton: "Esqueceu a senha?",
          confirmPasswordHint: "Confirme sua senha",
          confirmPasswordError: "As senhas devem ser iguais!",
          recoverPasswordIntro: "Recuperação de senha",
          recoverPasswordButton: "Enviar",
          recoverPasswordDescription:
              "Vamos enviar um email com instruções para recuperação",
          recoverPasswordSuccess: "Enviamos o email de recureção"),
      theme: LoginTheme(
          primaryColor: Color(0xFF247BA0),
          accentColor: Color(0xFF006494),
          titleStyle: TextStyle(color: Colors.white),
          cardTheme: CardTheme(margin: EdgeInsets.fromLTRB(0, 50, 0, 0))
          //buttonTheme: LoginButtonTheme(backgroundColor: Colors.red)
          ),
      onLogin: _authUser,
      onSignup: registerUser,
      onRecoverPassword: _recoverPassword,
      hideForgotPasswordButton: true,
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => HomePage(),
        ));
      },
    );
  }
}
