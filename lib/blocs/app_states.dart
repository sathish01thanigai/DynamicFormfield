import 'package:addboxtask/blocs/app_event.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../UserModel.dart';

@immutable
abstract class UserState {

}
class InitialState extends UserState{
}
class UserLoadingState extends UserState{
  @override
  List<Object> get props=>[];


}
class UserLoadedState extends UserState{

  late final List<UserModel> words;
  @override
  List<Object> get props=>[words];

}
class UserLoadError extends UserState{
  UserLoadError(this.error);
  final String error;
  @override
  List<Object> get props=>[error];


}

