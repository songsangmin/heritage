import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:heritage/pages/regitpage.dart';

import 'homepage.dart';

class LoginPage extends StatefulWidget{
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPage createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage>{
  final _formKey = GlobalKey<FormState>();

  //edit controller
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  //firebase
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    //이메일 입력창
    final emailField = SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
        child: TextFormField(
        autofocus: false,
        validator: (value){
          //이메일 빈칸 검사
          if(value!.isEmpty){
            return ("이메일을 입력하세요");
          }

          //이메일 유효성 검사
          if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9,-]+.[a-z]").hasMatch(value)){
            return ("유효한 이메일을 입력하세요");
          }

          return null;
        },
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

    //비밀번호 입력창
    final passwordField = SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
        child: TextFormField(
      autofocus: false,
      controller: passwordController,
      obscureText: true,
      validator: (value){
        RegExp regexp = RegExp(r'^.{6,}$');
        //비밀번호 빈칸 검사
        if(value!.isEmpty){
          return ("비밀번호를 입력하세요");
        }

        //비밀번호 유효성 검사
        if(!regexp.hasMatch(value)){
          return("유효한 비밀번호를 입력하세요. (최소 6글자)");
        }
      },
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

    //로그인버튼
    final loginButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.amber,
      child: MaterialButton(
        minWidth: 200,
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
       // minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          singIn(emailController.text, passwordController.text);
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

  //로그인 함수
  void singIn(String email, String password) async {
    if(_formKey.currentState!.validate()){
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((uid) => {
         Fluttertoast.showToast(msg: "로그인 성공"),
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomePage())),
      }).catchError((e){
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }

}