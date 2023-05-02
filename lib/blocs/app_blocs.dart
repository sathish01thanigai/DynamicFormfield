import 'package:addboxtask/blocs/app_states.dart';
import 'package:addboxtask/repos/repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_event.dart';

class UserBloc extends Bloc<UserEvent,UserState>{
  UserBloc():super(InitialState()){
    on<InitialEvent>((event, emit) async {

      emit(UserLoadingState());
      try{
        ElevatedButton(onPressed: () {
          emit(UserLoadedState());

        }, child: null,

        );


      }catch (e){
        emit(UserLoadError(e.toString()));

      }

    });

  }


}
