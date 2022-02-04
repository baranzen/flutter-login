import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_inputs/screen/home.dart';

class TextFormFieldKullanimi extends StatefulWidget {
  const TextFormFieldKullanimi({Key? key}) : super(key: key);

  @override
  _TextFormFieldKullanimiState createState() => _TextFormFieldKullanimiState();
}

class _TextFormFieldKullanimiState extends State<TextFormFieldKullanimi> {
  String _email = '', _password = '', _userName = '';
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal.shade500,
        title: const Text('Text form field kullanimi'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                TextFormField(
                  //! UserName
                  onSaved: (newValue) {
                    _userName = newValue!;
                  },
                  //initialValue: 'John Kodakd',
                  decoration: const InputDecoration(
                    label: Text('your name'),
                    hintText: 'your name',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                    ),
                  ),
                  validator: (value) {
                    if (value!.length < 4) {
                      return 'şireniz en az 4 karaterli olamalı';
                    } else
                      return null;
                  },
                ),
                const SizedBox(
                  height: 25,
                ),
                //! Email
                TextFormField(
                  onSaved: (newValue) {
                    _email = newValue!;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text(
                      'email validating',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  validator: (value) {
                    if (EmailValidator.validate(value!) == false) {
                      return 'geçerli email giriniz';
                    } else
                      return null;
                  },
                ),
                const SizedBox(
                  height: 25,
                ),
                //! Password
                TextFormField(
                  onSaved: (newValue) {
                    _password = newValue!;
                  },
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'password',
                  ),
                  validator: (value) {
                    if (value!.length < 6) {
                      return 'Şifre en az 6 karakter olmali';
                    } else
                      return null;
                  },
                ),
                const SizedBox(
                  height: 25,
                ),
                ElevatedButton(
                  onPressed: () {
                    bool _validate = _formKey.currentState!.validate();
                    if (_validate) {
                      _valited();
                    }
                  },
                  child: const Text('Onayla'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _valited() {
    _formKey.currentState!.save();
    String result = 'username:$_userName email:$_email password:$_password';
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(result),
      ),
    );
    Future.delayed(Duration(seconds: 4), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (myHomePageContext) => const HomePage(),
        ),
      );
    });

    _formKey.currentState!.reset();
  }
}
