import 'package:aprovik/home.page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';

const users = const {
  'rkarczevski@gmail.com': '12345',
  '1@1.com': '123',
};

class LoginScreen extends StatelessWidget {
  Duration get loginTime => Duration(milliseconds: 2250);

  Future<String> _authUser(LoginData data) {
    print('Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(data.name)) {
        return 'User not exists';
      }
      if (users[data.name] != data.password) {
        return 'Password does not match';
      }
      return null;
    });
  }

  Future<String> _recoverPassword(String name) {
    print('Name: $name');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(name)) {
        return 'User not exists';
      }
      return null;
    });
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
      onSignup: _authUser,
      onRecoverPassword: _recoverPassword,
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => HomePage(),
        ));
      },
    );
  }
}
