import 'package:firebase_project/signin/login_cuibit.dart';
import 'package:firebase_project/signin/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class signinscreen extends StatelessWidget {
  const signinscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Scaffold(
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
        body: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if(state is LoginSuccess){
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      backgroundColor: Colors.green,
                      content: Text("LOGIN SUCCESS ",style: TextStyle(
                          color: Colors.white
                      ),))
              );
            }
            if(state is LoginFailure){
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      backgroundColor: Colors.green,
                      content: Text(state.errMsg,style: const TextStyle(
                          color: Colors.white
                      ),))
              );
            }
          },
          builder: (context, state) {
            ///================instance=============
            final cubit = context.read<LoginCubit>();

            ///================loading=============
            if (state is LoginLoading) {
              return Center(child: CircularProgressIndicator());
            }

            ///========================================
            return Padding(
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
                    ///===============EMAIL======================
                    TextFormField(
                      controller: cubit.emailControl,
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
                    ///===============================================
                    SizedBox(height: 20),
                    ///===================password===================
                    TextFormField(
                      controller: cubit.passwordControl,
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
                    ///=========================================================
                    SizedBox(height: 10),
                    Text(
                      "Forget Password",
                      textAlign: TextAlign.right,
                      style: TextStyle(color: Color(0xffFF5E00)),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {cubit.login();},
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
            );
          },
        ),
      ),
    );
  }
}
