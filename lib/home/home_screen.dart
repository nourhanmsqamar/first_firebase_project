import 'package:firebase_project/add_student/add_student_screen.dart';
import 'package:firebase_project/home/home_cubit.dart';
import 'package:firebase_project/home/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class home_screen extends StatelessWidget {
  const home_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getstudentsfromserver(),
      child: Scaffold(
        backgroundColor: Colors.white,
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).push(
               MaterialPageRoute(builder: (context) => add_student_screen(),)
              );
            },
          backgroundColor: Colors.green,
          child: Icon(Icons.add,color: Colors.white,),
        
        ),
        appBar: AppBar(
          title: Text(
            "Home",
            style: TextStyle(fontSize: 24, color: Color(0xffFF5E00)),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            final Cubit =context.read<HomeCubit>();
            ///===========handel states===============
            ///=============loading===================
            if (state is HomeLoading){
              return Center(child: CircularProgressIndicator(),);
            }
            ///=============failure===================
            if(state is HomeFailure){
              return Center(
                child: Text(state.errMsg),
              );
            }
            ///=============success===================
            if(state is HomeSuccess){
              return ListView.builder(
              itemCount:state.students.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.deepOrange)

                  ),
                  child: ListTile(
                    title: Text('Name Is ${state.students[index]['name']}'),
                    subtitle: Text('Degree ${state.students[index]['degree']}'),
                    trailing: Text('Age ${state.students[index]['age']}'),

                  ),
                );
              },);
            }

            return SizedBox();
          },
        ),


      ),
    );
  }
}
