import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_project/signin/login_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit <LoginState>{
  LoginCubit(): super(LoginInitial());

  ///==================object firebaseAuth==============

  final fireAuth = FirebaseAuth.instance;
  ///========================

  ///=================controller========
  TextEditingController emailControl =TextEditingController();
  TextEditingController passwordControl =TextEditingController();
  ///===============================
  Future<void> login()async{
    emit(LoginLoading());

    try {
      await fireAuth.signInWithEmailAndPassword(
        email: emailControl.text,
        password: passwordControl.text,
      );
      emit(LoginSuccess());

      ///==========handel error
    } on FirebaseAuthException catch (e) {
      emit(LoginFailure(e.toString()));
    } catch (e) {
      emit(LoginFailure(e.toString()));
    }


  }
}



