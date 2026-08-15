abstract class AddStudentState {}

///=================Initial state===================
class AddStudentInitial extends AddStudentState{}

///=================loading state===================
class AddStudentLoading extends AddStudentState{}

///==================success state=====================
class AddStudentSuccess extends AddStudentState{}

///==================failure state=====================
class AddStudentFailure extends AddStudentState{
  final String errMsg;
  AddStudentFailure(this.errMsg);

}