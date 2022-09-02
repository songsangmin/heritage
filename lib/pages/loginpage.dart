import 'package:flutter/material.dart';
import 'package:heritage/pages/regitpage.dart';

import 'homepage.dart';

class LoginPage extends StatefulWidget{
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPage createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage>{
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final emailField = SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
        child: TextFormField(
        autofocus: false,
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        onSaved: (value){
          emailController.text = value!;
        },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.email),
        prefixIconColor: Colors.black,
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Email",
        hintStyle: const TextStyle(
          fontFamily: "Ppuri",
              fontWeight: FontWeight.bold,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        )
      ),
    ));

    final passwordField = SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
        child: TextFormField(
      autofocus: false,
      controller: passwordController,
      obscureText: true,
      onSaved: (value){
        passwordController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.vpn_key),
          prefixIconColor: Colors.black,
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Password",
          hintStyle: const TextStyle(
            fontFamily: "Ppuri",
            fontWeight: FontWeight.bold,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )
      ),
    )
    );

    final loginButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.amber,
      child: MaterialButton(
        minWidth: 200,
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
       // minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage())
          );
        },
        child: const Text("Login",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20,
          fontFamily: "Ppuri",
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: 300,
                    height: 300,
                    child: Image.asset("assets/logo.png",
                      fit: BoxFit.contain,),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  emailField,
                  const SizedBox(
                    height: 10,
                  ),
                  passwordField,
                  const SizedBox(
                    height: 20,
                  ),
                  loginButton,
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text("Don't have an account? ",
                        style: TextStyle(
                          fontFamily: "Ppuri",
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                        ),),
                      GestureDetector(onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => RegitPage()));
                      },
                      child: const Text("Sign up",
                        style: TextStyle(
                          color: Colors.amber,
                            fontFamily: "Ppuri",
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}