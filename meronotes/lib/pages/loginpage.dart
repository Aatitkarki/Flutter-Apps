import 'package:flutter/material.dart';
import 'package:meronotes/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool signInForm = true;
  @override
  void initState() {
    signInForm = true;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
        if(!signInForm){
          setState(() {
            signInForm=true;
          });
          return false;
        }else{
          return true;
        }
      },
          child: Scaffold(
        backgroundColor: Colors.green,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: kToolbarHeight,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white, shape: BoxShape.circle),
                    height: 80,
                    width: 80,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  RaisedButton(
                    textColor: Colors.white,
                    child: Text("Continue with Google"),
                    color: Colors.red,
                    onPressed: ()async{
                      bool res =  await AuthProvider().loginWithGoogle();
                      if(!res){
                        print("Error in login with google.");
                      }
                    },
                  ),
                  SizedBox(height: 30),
                  AnimatedSwitcher(duration: Duration(milliseconds: 200),
                  child: signInForm ? LoginForm():SingUpForm(),
                  ),
                  SizedBox(height: 30),
                  OutlineButton(
                      textColor: Colors.black,
                      child:signInForm ? Text(
                        "Sign Up",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ):Icon(Icons.arrow_back),
                      borderSide: BorderSide(color: Colors.white),
                      highlightColor: Colors.white,
                      onPressed: () {
                        setState(() {
                          signInForm=!signInForm;
                        });
                      })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController _emailController;
  TextEditingController _passwordController;
  @override
  void initState() {
    _emailController = TextEditingController(text: "");
    _passwordController= TextEditingController(text: "");
    super.initState();
  }
  final FocusNode passwordField = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(30)),
      child: Column(
        children: <Widget>[
          Text(
            "LOGIN",
            style: Theme.of(context).textTheme.display1,
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: _emailController,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              labelText: "Email Address",
            ),
            onEditingComplete: () {
              FocusScope.of(context).requestFocus(passwordField);
            },
          ),
          SizedBox(height: 30),
          TextField(
            controller: _passwordController,
            obscureText: true,
              focusNode: passwordField,
              decoration: InputDecoration(

                labelText: "Password",
              )),
          SizedBox(
            height: 30,
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: RaisedButton(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text("Login"),
                color: Colors.redAccent,
                onPressed: () async{
                  if(_emailController.text.isEmpty||_passwordController.text.isEmpty){
                    print("Email and Text Cannot be empty");
                    return;
                  }
                  bool res=await AuthProvider().signInWithEmail(_emailController.text, _passwordController.text);
                  if(!res){
                    print("Login Failed");
                  }else{
                    print("Login Successful");
                  }
                }),
          )
        ],
      ),
    );
  }
}

class SingUpForm extends StatelessWidget {
  final FocusNode passwordField = FocusNode();
  final FocusNode confirmPasswordField = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(30)),
      child: Column(
        children: <Widget>[
          Text(
            "Sign Up",
            style: Theme.of(context).textTheme.display1,
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              labelText: "Email Address",
            ),
            onEditingComplete: () {
              FocusScope.of(context).requestFocus(passwordField);
            },
          ),
          SizedBox(height: 30),
          TextField(
            obscureText: true,
              focusNode: passwordField,
              onEditingComplete: () {
                FocusScope.of(context).requestFocus(confirmPasswordField);
              },
              decoration: InputDecoration(
                labelText: "Password",
              )),
          SizedBox(
            height: 30,
          ),
          TextField(
            obscureText: true,
              focusNode: confirmPasswordField,
              decoration: InputDecoration(
                labelText: "Confirm Password",
              )),
          SizedBox(
            height: 30,
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: RaisedButton(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text("Create Account"),
                color: Colors.redAccent,
                onPressed: () {}),
          )
        ],
      ),
    );
  }
}
