import 'package:flutter/material.dart';

class RegitPage extends StatefulWidget{
  const RegitPage({Key? key}) : super (key: key);

  @override
  State<StatefulWidget> createState() {
    return _RegitPage();
  }
}

class _RegitPage extends State<RegitPage>{

  final _formKey = GlobalKey<FormState>();

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
          Navigator.of(context).pop();
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

}