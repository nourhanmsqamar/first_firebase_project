import 'package:cloud_firestore/cloud_firestore.dart';

abstract class HomeState {}

///=================Initial state===================
class HomeInitial extends HomeState{}

///=================loading state===================
class HomeLoading extends HomeState{}

///==================success state=====================
class HomeSuccess extends HomeState{
  List<QueryDocumentSnapshot> students;
  HomeSuccess(this.students);
}

///==================failure state=====================
class HomeFailure extends HomeState{
  final String errMsg;
  HomeFailure(this.errMsg);

}