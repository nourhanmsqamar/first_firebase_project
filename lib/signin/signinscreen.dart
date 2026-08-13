import 'package:flutter/material.dart';

class signinscreen extends StatelessWidget {
  const signinscreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Sign in",
          style: TextStyle(fontSize: 24, color: Color(0xffFF5E00)),
        ),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios, color: Color(0xffFF5E00)),
        ),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset('assets/images/signin.png'),
              SizedBox(height: 40),
              Text(
                'Enter your Email and password to access your accoun',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff7F4E1D),
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
                  suffixIcon: Icon(
                    Icons.visibility_off_outlined,
                    color: Color(0xffFF5E00),
                  ),
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
              SizedBox(height: 10),
              Text(
                "Forget Password",
                textAlign: TextAlign.right,
                style: TextStyle(color: Color(0xffFF5E00)),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xffFF5E00),
                  fixedSize: Size.fromHeight(50),
                ),
                child: Text(
                  "Sign in",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account? ",
                    style: TextStyle(
                      color: Color(0xff6D3805),
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Color(0xffFF5E00),
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
