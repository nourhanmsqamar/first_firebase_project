import 'package:firebase_project/add_student/add_student_cubit.dart';
import 'package:firebase_project/add_student/add_student_state.dart';
import 'package:firebase_project/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class add_student_screen extends StatelessWidget {
  const add_student_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddStudentCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Student Data",
            style: TextStyle(fontSize: 24, color: Color(0xffFF5E00)),
          ),
          centerTitle: true,
          leading: SizedBox(),
          backgroundColor: Colors.white,
        ),
        body: BlocConsumer<AddStudentCubit, AddStudentState>(
          listener: (context, state) {
            if (state is AddStudentSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  backgroundColor: Colors.green,
                  content: Text(
                    " SUCCESS ",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              );
            }

            if (state is AddStudentFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.green,
                  content: Text(
                    state.errMsg,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              );
            }
          },
          builder: (context, state) {
            final cubit = context.read<AddStudentCubit>();
            if (state is AddStudentLoading) {
              return Center(child: CircularProgressIndicator());
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: cubit.nameControl,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xffF3F3F3),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffF3F3F3)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffFF5E00)),
                    ),
                    hintText: "Enter Your Name",
                  ),
                ),

                ///===============================================
                SizedBox(height: 20),

                ///===================age===================
                TextFormField(
                  controller: cubit.ageControl,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xffF3F3F3),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffF3F3F3)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffFF5E00)),
                    ),
                    hintText: "Enter Your age",
                  ),
                ),
                SizedBox(height: 20),

                ///===================degree===================
                TextFormField(
                  controller: cubit.degreeControl,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xffF3F3F3),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffF3F3F3)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffFF5E00)),
                    ),
                    hintText: "Enter Your degree",
                  ),
                ),
                SizedBox(height: 20),
                ///=================button=================
                ElevatedButton(
                  onPressed: () {
                    cubit.addstudentToServer();
                    Future.delayed(Duration(seconds: 3));
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => home_screen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xffFF5E00),
                    fixedSize: Size.fromHeight(50),
                  ),
                  child: Text(
                    "ADD",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
