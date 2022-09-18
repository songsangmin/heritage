import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:heritage/pages/homepage.dart';
import '../models/user_model.dart';

class RegitPage extends StatefulWidget{
  const RegitPage({Key? key}) : super (key: key);
  @override
  State<StatefulWidget> createState() {
    return _RegitPage();
  }
}

class _RegitPage extends State<RegitPage>{

  final _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  //controller
  final firstNameEditingController = TextEditingController();
  final secondNameEditingController = TextEditingController();
  final emailEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
  final confirmEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //성 field
    final firstNameField = SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        child: TextFormField(
          autofocus: false,
          controller: firstNameEditingController,
          keyboardType: TextInputType.emailAddress,
          validator: (value){
            RegExp regexp = RegExp(r'^.{2,}$');
            //성 빈칸 검사
            if(value!.isEmpty){
              return ("성은 빈칸이 될 수 없습니다");
            }
            //성 유효성 검사
            if(!regexp.hasMatch(value)){
              return("유효한 성을 입력하세요. (최소 1글자)");
            }
            return null;
          },
          onSaved: (value){
            firstNameEditingController.text = value!;
          },
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
              prefixIcon: const Icon(Icons.account_circle),
              prefixIconColor: Colors.black,
              contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
              hintText: "성",
              hintStyle: const TextStyle(
                fontFamily: "Ppuri",
                fontWeight: FontWeight.bold,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              )
          ),
        ));
    //이름 field
    final secondNameField = SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        child: TextFormField(
          autofocus: false,
          controller: secondNameEditingController,
          keyboardType: TextInputType.emailAddress,
          validator: (value){
            //이름 빈칸 검사
            if(value!.isEmpty){
              return ("이름을 입력하세요");
            }
            return null;
          },
          onSaved: (value){
            secondNameEditingController.text = value!;
          },
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
              prefixIcon: const Icon(Icons.account_circle),
              prefixIconColor: Colors.black,
              contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
              hintText: "이름",
              hintStyle: const TextStyle(
                fontFamily: "Ppuri",
                fontWeight: FontWeight.bold,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              )
          ),
        ));
    //email field
    final emailField = SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        child: TextFormField(
          autofocus: false,
          controller: emailEditingController,
          keyboardType: TextInputType.emailAddress,
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
          onSaved: (value){
            emailEditingController.text = value!;
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
    //password field
    final passwordField = SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        child: TextFormField(
          autofocus: false,
          obscureText: true,
          controller: passwordEditingController,
          keyboardType: TextInputType.emailAddress,
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
            passwordEditingController.text = value!;
          },
          textInputAction: TextInputAction.next,
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
        ));
    //password 확인 field
    final confirmField = SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        child: TextFormField(
          autofocus: false,
          controller: confirmEditingController,
          obscureText: true,
          keyboardType: TextInputType.emailAddress,
          validator: (value){
            if(confirmEditingController.text != passwordEditingController.text){
              return "비밀번호가 일치하지 않습니다";
            }
            return null;
          },
          onSaved: (value){
            confirmEditingController.text = value!;
          },
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
              prefixIcon: const Icon(Icons.vpn_key),
              prefixIconColor: Colors.black,
              contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
              hintText: "Confirm Password",
              hintStyle: const TextStyle(
                fontFamily: "Ppuri",
                fontWeight: FontWeight.bold,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              )
          ),
        ));
    //확인 버튼
    final signButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.amber,
      child: MaterialButton(
        minWidth: 200,
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        // minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          signUp(emailEditingController.text, passwordEditingController.text);
        },
        child: const Text("생성",
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
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(30.0),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.amber,),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
      ),
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
                    width: 250,
                    height: 250,
                    child: Image.asset("assets/logo.png",
                      fit: BoxFit.contain,),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  firstNameField,
                  const SizedBox(
                    height: 10,
                  ),
                  secondNameField,
                  const SizedBox(
                    height: 10,
                  ),
                  emailField,
                  const SizedBox(
                    height: 10,
                  ),
                  passwordField,
                  const SizedBox(
                    height: 10,
                  ),
                  confirmField,
                  const SizedBox(
                    height: 20,
                  ),
                  signButton,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  //회원가입 함수
  void signUp(String email, String password) async{
    if(_formKey.currentState!.validate()){
      await _auth.createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {
            postDetailsToFirestore()
      }).catchError((e){
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }

  postDetailsToFirestore() async {
    //Firestore 부르기
    //UserModel 부르기
    //value 보내기
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;
    
    UserModel userModel = UserModel();
    //User 모델
    userModel.email = user!.email;
    userModel.uid = user!.uid;
    userModel.firstName = firstNameEditingController.text;
    userModel.secondName = secondNameEditingController.text;
    
    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "회원가입이 성공적으로 완료되었습니다.");
    
    // ignore: use_build_context_synchronously
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context) => HomePage()), (route) => false);
  }
}