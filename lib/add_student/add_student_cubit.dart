import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_project/add_student/add_student_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddStudentCubit extends Cubit<AddStudentState> {
  AddStudentCubit() : super(AddStudentInitial());

  ///================== Objects ==============
  final fireAuth = FirebaseAuth.instance;
  final cloud = FirebaseFirestore.instance;
  ///========================================

  ///================= Controllers ========
  TextEditingController nameControl = TextEditingController();
  TextEditingController ageControl = TextEditingController();
  TextEditingController degreeControl = TextEditingController();
  ///======================================

  Future<void> addstudentToServer() async {
    emit(AddStudentLoading());

    try {
      await cloud.collection("students").add({
        "name": nameControl.text,
        "age": ageControl.text,
        "degree": degreeControl.text,
      });
      emit(AddStudentSuccess());
    } catch (e) {
      emit(AddStudentFailure(e.toString()));
    }
  }
}