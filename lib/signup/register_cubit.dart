import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_project/signin/login_cuibit.dart';
import 'package:firebase_project/signup/register_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(): super(RegisterInitial());

  ///=============object firebaseAuth===============
  final firebaseAuth= FirebaseAuth.instance;
  ///========================================

  ///=================controller========
  TextEditingController emailControl =TextEditingController();
  TextEditingController passwordControl =TextEditingController();
  ///===============================

  Future<void> signup() async {
    emit(RegisterLoading());

    try {
      await firebaseAuth.createUserWithEmailAndPassword(
        email: emailControl.text,
        password: passwordControl.text,
      );
      emit(RegisterSuccess());

      ///==========handel error
    } on FirebaseAuthException catch (e) {
      emit(RegisterFailure(e.toString()));
    } catch (e) {
      emit(RegisterFailure(e.toString()));
    }
  }

}



