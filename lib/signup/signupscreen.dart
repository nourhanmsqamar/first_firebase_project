import 'package:firebase_project/signup/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_project/signup/register_cubit.dart';

class signupscreen extends StatelessWidget {
  const signupscreen({super.key});

  @override
  Widget build(BuildContext context) {
    ///=================1-blocprovider on scaffold=======================
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            "Sign Up",
            style: TextStyle(fontSize: 24, color: Color(0xffFF5E00)),
          ),
          centerTitle: true,
          leading: const Icon(Icons.arrow_back_ios, color: Color(0xffFF5E00)),
          backgroundColor: Colors.white,
        ),
        body: BlocConsumer<RegisterCubit, RegisterState>(
          listener: (context, state) {
            if(state is RegisterSuccess){
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    backgroundColor: Colors.green,
                      content: Text("SUCCESS CREATED ACCOUNT",style: TextStyle(
                        color: Colors.white
                      ),))
              );
            }
            if(state is RegisterFailure){
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
            final cubit = context.read<RegisterCubit>();

            ///================loading=============
            if (state is RegisterLoading) {
              return Center(child: CircularProgressIndicator());
            }

            ///========================================

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Image.asset('assets/images/signup.png'),
                    const SizedBox(height: 20),
                    const Text(
                      'Please enter your information to create an account',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xff6D3805),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 20),
                    ///==========================email ===========================
                    TextFormField(
                      controller: cubit.emailControl,
                      decoration: const InputDecoration(
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
                    ///==============================================
                    const SizedBox(height: 20),
                    ///================password==========================
                    TextFormField(
                      controller: cubit.passwordControl,
                      decoration: const InputDecoration(
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
                    ///=============================================================
                    const SizedBox(height: 20),

                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {cubit.signup();},
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size.fromHeight(50),
                        backgroundColor: const Color(0xffFF5E00),
                      ),
                      child: const Text(
                        "Sign up",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
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
