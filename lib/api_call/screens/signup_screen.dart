import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:form_field_validator/form_field_validator.dart';
import 'package:flutter/foundation.dart';

class SignupScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign Up')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Confirm Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                try {
                  UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                    email: emailController.text,
                    password: passwordController.text,
                  );
                  Navigator.of(context).pushReplacementNamed('/dashboard');
                } catch (e) {
                  print(e);
                }
              },
              child: Text('Sign Up'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/login');
              },
              child: Text('Already have an account? Login'),
            ),
          ],
        ),
      ),
    );
  }
}



class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  Map userData = {};
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('register'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Form(
                key: _formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Center(
                        child: Container(
                          width: 200,
                          height: 150,
                          //decoration: BoxDecoration(
                          //borderRadius: BorderRadius.circular(40),
                          //border: Border.all(color: Colors.blueGrey)),
                          child: Image.asset('assets/image/login-logo.jpg'),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: TextFormField(
                        // validator: ((value) {
                        // if (value == null || value.isEmpty) {
                        //	 return 'please enter some text';
                        // } else if (value.length < 5) {
                        //	 return 'Enter atleast 5 Charecter';
                        // }

                        // return null;
                        // }),
                        validator: MultiValidator([
                          RequiredValidator(errorText: 'Enter first named'),
                          MinLengthValidator(3,
                              errorText: 'Minimum 3 charecter filled name'),
                        ]),

                        decoration: InputDecoration(
                            hintText: 'Enter first Name',
                            labelText: 'first named',
                            prefixIcon: Icon(
                              Icons.person,
                              color: Colors.green,
                            ),
                            errorStyle: TextStyle(fontSize: 18.0),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                                borderRadius:
                                BorderRadius.all(Radius.circular(9.0)))),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        validator: MultiValidator([
                          RequiredValidator(errorText: 'Enter last named'),
                          MinLengthValidator(3,
                              errorText:
                              'Last name should be atleast 3 charater'),
                        ]),
                        decoration: InputDecoration(
                            hintText: 'Enter last Name',
                            labelText: 'Last named',
                            prefixIcon: Icon(
                              Icons.person,
                              color: Colors.grey,
                            ),
                            errorStyle: TextStyle(fontSize: 18.0),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                                borderRadius:
                                BorderRadius.all(Radius.circular(9.0)))),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        validator: MultiValidator([
                          RequiredValidator(errorText: 'Enter email address'),
                          EmailValidator(
                              errorText: 'Please correct email filled'),
                        ]),
                        decoration: InputDecoration(
                            hintText: 'Email',
                            labelText: 'Email',
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.lightBlue,
                            ),
                            errorStyle: TextStyle(fontSize: 18.0),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                                borderRadius:
                                BorderRadius.all(Radius.circular(9.0)))),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        validator: MultiValidator([
                          RequiredValidator(errorText: 'Enter mobile number'),
                          PatternValidator(r'(^[0,9]{10}$)',
                              errorText: 'enter vaid mobile number'),
                        ]),
                        decoration: InputDecoration(
                            hintText: 'Mobile',
                            labelText: 'Mobile',
                            prefixIcon: Icon(
                              Icons.phone,
                              color: Colors.grey,
                            ),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                                borderRadius:
                                BorderRadius.all(Radius.circular(9)))),
                      ),
                    ),
                    Center(
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Container(
                            // margin: EdgeInsets.fromLTRB(200, 20, 50, 0),
                            child: TextButton(
                              child: Text(
                                'Register',
                                style: TextStyle(color: Colors.white, fontSize: 22),
                              ),
                              onPressed: () {
                                if (_formkey.currentState!.validate()) {
                                  print('form submiitted');
                                }
                              },
                            ),

                            width: MediaQuery.of(context).size.width,

                            height: 50,
                          ),
                        )),
                    Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Center(
                          child: Text(
                            'Or Sign Up Using',
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                          'SIGN IN',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
                )),
          ),
        ));
  }
}
