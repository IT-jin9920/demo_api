import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
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
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                try {
                  // Simulate user authentication
                  // In a real app, you would validate credentials with a server
                  // and then proceed accordingly
                  String email = emailController.text;
                  String password = passwordController.text;

                  // Save user data to SharedPreferences
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  await prefs.setString('email', email);
                  if (kDebugMode) {
                    print('Stored email: $email');
                  } // Print stored email

                  // Navigate to dashboard and pass email as argument
                  Navigator.of(context).pushReplacementNamed('/dashboard', arguments: {'email': email});

                } catch (e) {
                  if (kDebugMode) {
                    print(e);
                  }
                }
              },
              child: Text('Login'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/forgot-password');
              },
              child: Text('Forgot Password?'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/signup');
              },
              child: Text('Don\'t have an account? Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}


class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Map userData = {};
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Center(
                child: Container(
                  width: 130,
                  height: 130,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                     // border: Border.all(color: Colors.blueGrey)
                    ),
                  child: Image.asset('assets/image/login-logo.jpg'),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Form(
                    key: _formkey,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:[
                          Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: TextFormField(
                                  validator: MultiValidator([
                                    RequiredValidator(
                                        errorText: 'Enter email address'),
                                    EmailValidator(
                                        errorText:
                                        'Please correct email filled'),
                                  ]),
                                  decoration: InputDecoration(
                                      hintText: 'Email',
                                      labelText: 'Email',
                                      prefixIcon: Icon(
                                        Icons.email,
                                        //color: Colors.green,
                                      ),
                                      errorStyle: TextStyle(fontSize: 18.0),
                                      border: OutlineInputBorder(
                                          borderSide:
                                          BorderSide(color: Colors.red),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(9.0)))))),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: TextFormField(
                              validator: MultiValidator([
                                RequiredValidator(
                                    errorText: 'Please enter Password'),
                                MinLengthValidator(8,
                                    errorText:
                                    'Password must be atlist 8 digit'),
                                PatternValidator(r'(?=.*?[#!@$%^&*-])',
                                    errorText:
                                    'Password must be atlist one special character')
                              ]),
                              decoration: InputDecoration(
                                hintText: 'Password',
                                labelText: 'Password',
                                prefixIcon: Icon(
                                  Icons.key,
                                  color: Colors.green,
                                ),
                                errorStyle: TextStyle(fontSize: 18.0),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.red),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(9.0))),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(180, 0, 0, 0),
                            child: Text('Forget Password!'),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(28.0),
                            child: Container(
                              child: TextButton(
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                      color: Colors.blue, fontSize: 22),
                                ),
                                onPressed: () {
                                  if (_formkey.currentState!.validate()) {
                                    print('form submiitted');

                                  }
                                  // Navigate to dashboard and pass email as argument
                                  Navigator.of(context).pushReplacementNamed('/dashboard', arguments: {'email': ''});
                                  //Navigator.of(context).pushReplacementNamed('/dashboard', arguments: {'email': email});
                                },
                              ),
                              width: MediaQuery.of(context).size.width,
                              height: 50,
                            ),
                          ),
                          Center(
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                              child: Center(
                                child: Text(
                                  'Or Sign In Using!',
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                          Center(
                            child: GestureDetector(
                              onTap: (){
                                Navigator.of(context).pushNamed('/Register');

                              },
                              child: Container(
                                padding: EdgeInsets.only(top: 10),
                                child: Text(
                                  'SIGN UP!',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.lightBlue,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ]),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
