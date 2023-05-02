import 'package:addboxtask/blocs/app_event.dart';
import 'package:addboxtask/blocs/app_states.dart';
import 'package:addboxtask/repos/repository.dart';
import 'package:addboxtask/secondscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/app_blocs.dart';
void main()=>runApp(MyApp());
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<TextEditingController> listController=[TextEditingController()];
  final _formKey=GlobalKey<FormState>();
  List<String> words=[];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context)=>UserBloc(

        )..add(InitialEvent()),
        child:Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.deepPurple,
            title: Text('My Demo App'),
          ),
          body: Container(
            color: Colors.yellowAccent,
            child: BlocBuilder<UserBloc,UserState>(
              builder: (BuildContext context, state) {
                if(state is UserLoadingState){
                  return Form(
                    key: _formKey,
                    child:Container(
                      child: SafeArea(
                        child: SingleChildScrollView(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10),),
                                const SizedBox(height: 15),
                                ListView.builder(
                                    padding: EdgeInsets.symmetric(horizontal: 10),
                                    shrinkWrap: true,
                                    itemCount: listController.length,
                                    itemBuilder:(context,index){
                                      return Padding(
                                        padding:EdgeInsets.only(top: 10) ,
                                        child: Row(
                                          children: [
                                            Expanded(child: Container(
                                                padding: EdgeInsets.symmetric(horizontal:10),
                                                height: 60,
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                  color: Colors.amber,
                                                  borderRadius: BorderRadius.circular(10),
                                                ),
                                                child: TextFormField(
                                                  controller: listController[index],
                                                  autofocus: false,
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    hintText:'Input Text here',
                                                  ),
                                                  validator: (value){
                                                    if(value==null||value.trim().isEmpty){
                                                      return 'please fill the field';
                                                    }
                                                    return null;
                                                  },
                                                  onSaved: (value){
                                                    //words[index]=value!;
                                                   // words.add(value!);
                                                    // words.removeAt(index);
                                                  },

                                                ))),
                                          ],
                                        ),
                                      );
                                    }),
                                GestureDetector(
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 50),
                                      child: ElevatedButton(
                                        style: ButtonStyle(
                                          backgroundColor:  MaterialStateProperty.all(Colors.red),
                                        ),
                                        child: Text('Add More'),

                                        onPressed: () {
                                          if(_formKey.currentState!.validate()){
                                            _formKey.currentState?.save();
                                            setState(() {
                                              if(listController.length<5){
                                                listController.add(TextEditingController());
                                              }

                                            }
                                            );

                                          }
                                          if(listController.length==5){
                                            Navigator.push(context, MaterialPageRoute(builder: (context)=>SecondScreen(listController)));
                                          }



                                        },

                                      ),
                                    ),
                                  ),
                                )
                              ]
                          ),
                        ),

                      ),

                    ),

                  );

                }
                if(state is UserLoadedState){
                  BlocBuilder<UserBloc,UserState>(
                      builder: (context, snapshot) {
                        return ElevatedButton(
                          onPressed: (){
                            if(_formKey.currentState!.validate()){

                              setState(() {
                                listController.add(TextEditingController());
                              });

                            }
                          }, child: null,
                        );
                      }
                  );
                }
                if(state is UserLoadError){
                  return Center(child: Text('Error'));
                }
                return  Container();
              },
            ),

          ),
        )

    );
  }
}
