abstract class RegisterState{}

///=====================Initial=========
class RegisterInitial extends RegisterState{}

///=====================Loading=============
class RegisterLoading extends RegisterState{}

///=====================success===========
class RegisterSuccess extends RegisterState{}

///=====================Failure==============
class RegisterFailure extends RegisterState{
  final String errMsg;
  RegisterFailure(this.errMsg);
}