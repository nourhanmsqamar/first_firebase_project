abstract class LoginState {}

///=================Initial state===================
class LoginInitial extends LoginState{}

///=================loading state===================
class LoginLoading extends LoginState{}

///==================success state=====================
class LoginSuccess extends LoginState{}

///==================failure state=====================
class LoginFailure extends LoginState{
  final String errMsg;
  LoginFailure(this.errMsg);

}