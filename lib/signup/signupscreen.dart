import 'package:flutter/material.dart';

class signupscreen extends StatelessWidget {
  const signupscreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Sign Up",
          style: TextStyle(fontSize: 24, color: Color(0xffFF5E00)),
        ),
        centerTitle: true,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios,color:Color(0xffFF5E00) ,)),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset('assets/images/signup.png'),
              SizedBox(height: 20),
              Text(
                'Please enter your information to create an account',
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xff6D3805),
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xffF3F3F3),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffF3F3F3)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffFF5E00)),
                  ),
                  hintText: "Email",
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.visibility_off_outlined,
                    color: Color(0xffFF5E00),),
                  filled: true,
                  fillColor: Color(0xffF3F3F3),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffF3F3F3)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffFF5E00)),
                  ),
                  hintText: "Password",
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.visibility_off_outlined,
                    color: Color(0xffFF5E00),),
                  filled: true,
                  fillColor: Color(0xffF3F3F3),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffF3F3F3)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffFF5E00)),
                  ),
                  hintText: "Confirm Password",
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: Size.fromHeight(50),
                  backgroundColor: Color(0xffFF5E00),
                ),
                child: Text(
                  "Sign up",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
