import 'package:flutter/material.dart';
import 'package:food_app/Authentication/EmailAuth/emailAuth.dart';
import 'package:food_app/Authentication/EmailAuth/google_login_auth/google_button.dart';
import 'package:food_app/loggedinscreen.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  // FormType _formType = FormType.login;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 250),
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Form(
                        key: _formKey,
                        child: Column(children: [
                          buildEmailField(),
                          SizedBox(height: 10),
                          buildPasswordField(),
                          buildSubmitButtons(context)
                        ])),
                  ),
                  SizedBox(height: 30),
                  GoogleButton()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildEmailField() {
    final provider = Provider.of<EmailSignInProvider>(context);
    return TextFormField(
        key: ValueKey('Email'),
        autocorrect: false,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            // errorText: provider.errorText,
            border: OutlineInputBorder(),
            labelText: 'Email',
            isDense: true),
        onSaved: (email) => provider.userEmail = email,
        onChanged: (value) {
          // _formKey.currentState.reset();
        },
        validator: (value) {
          final pattern = r'(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)';
          final regExp = RegExp(pattern);
          if (!regExp.hasMatch(value)) {
            return 'Enter a valid email';
          } else if (value.isEmpty) {
            // provider.errorValidation();
            return 'Enter an email address';
          } else {
            return null;
          }
          // val.isEmpty ? 'Enter an email address' : null
        });
  }

  Widget buildPasswordField() {
    final provider = Provider.of<EmailSignInProvider>(context);
    return TextFormField(
        key: ValueKey('Password'),
        decoration: InputDecoration(
            border: OutlineInputBorder(), labelText: 'Password', isDense: true),
        obscureText: true,
        onSaved: (password) => provider.userPassword = password,
        // onChanged: (value) {

        // },
        validator: (value) {
          if (value.length < 7) {
            return 'Password must be at least 7 characters long';
          } else {
            return null;
          }
        });
  }

  Widget buildSubmitButtons(BuildContext context) {
    final provider = Provider.of<EmailSignInProvider>(context);

    if (provider.isLoading) {
      return CircularProgressIndicator();
    } else {
      return Column(
        children: [buildSignInButton(), buildSignUpButton()],
      );
    }
  }

  Widget buildSignInButton() {
    final provider = Provider.of<EmailSignInProvider>(context);
    return ElevatedButton(
        child: Text(provider.isLogin ? 'Sign In' : 'Signup'),
        onPressed: () => submit());
  }

  Widget buildSignUpButton() {
    final provider = Provider.of<EmailSignInProvider>(context);
    return ElevatedButton(
      child: Text(
          provider.isLogin ? 'Create an account?' : 'Already have an account'),
      onPressed: () {
        _formKey.currentState.reset();
        provider.isLogin = !provider.isLogin;
      },
    );
  }

  Future submit() async {
    final provider = Provider.of<EmailSignInProvider>(context, listen: false);
    final isValid = _formKey.currentState.validate();
    FocusScope.of(context).unfocus();

    if (isValid) {
      _formKey.currentState.save();

      final isSuccessful = await provider.login();

      if (isSuccessful) {
        print('is successful');
        //  show successful dialog box
      } else {
        // final message = 'An error occurred please check your internet';
        // print(message);
        // scaffoldMessengerKey.currentState.showSnackBar(SnackBar(
        //   content: Text(message),
        //   backgroundColor: Theme.of(context).errorColor,
        // ));

        // ScaffoldMessenger.of(context)
        //     .showSnackBar(SnackBar(content: Text(message)));
      }
    } else {
      // provider.errorValidation();
    }
  }
}
