import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_project/home/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  ///================== Objects ==============
  final cloud = FirebaseFirestore.instance;

  ///========================================

  Future<void> getstudentsfromserver() async {
    emit(HomeLoading());

    try {
      final data = await cloud.collection("students").get();
      emit(HomeSuccess(data.docs));
    } catch (e) {
      emit(HomeFailure(e.toString()));
    }
  }
}
