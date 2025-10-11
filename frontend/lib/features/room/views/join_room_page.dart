import 'package:flutter/material.dart';
import 'package:frontend/core/di/dependency_injection.dart';
import 'package:frontend/core/theme/app_theme.dart';
import 'package:frontend/features/home/views/home_widget.dart';
import 'package:frontend/features/room/controllers/room_controller.dart';

class JoinRoomScreen extends StatefulWidget{
  @override
  State<JoinRoomScreen> createState() => _StateJoinRoomScreen();
}

class _StateJoinRoomScreen extends State<JoinRoomScreen>{

  final TextEditingController _controller = TextEditingController();
  final RoomController _roomController = getIt<RoomController>();

  @override
  void dispose(){
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Join Room",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25
          ),
        ),
        leadingWidth: 80,
        leading: Padding(
          padding: EdgeInsets.only(left: 30,bottom: 5),
          child: IconButton(
            style: IconButton.styleFrom(
              elevation: 20,
              foregroundColor: AppTheme.backgroundColor,
              backgroundColor: AppTheme.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30)
              )
            ),
            onPressed: (){
              Navigator.pop(context);
            }, 
            icon: Icon(Icons.arrow_back)
          ),
        )
      ),
      backgroundColor: AppTheme.backgroundColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(left: 35, right: 35, bottom: 60),
            child: Container(
              height: 650,
              width: 300,
              decoration: BoxDecoration(
                border: BoxBorder.all(
                  color: Colors.black,
                  width: 4
                ),
                color: AppTheme.primaryColor,
              ),
              child: Column(
                spacing: 20,
                children: [
                  SizedBox(height: 60,),
                  Text(
                    "Enter team code",
                    style: TextStyle(
                      color: AppTheme.backgroundColor,
                      fontSize: 25
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            blurRadius: 5,
                            offset: Offset(3, 4),
                            spreadRadius: 2
                          )
                        ]
                      ),
                      child: TextFormField(
                        controller: _controller,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20
                        ),
                        cursorColor: AppTheme.primaryColor,
                        decoration: InputDecoration(
                          hintStyle: TextStyle(color: Colors.white38),
                          hintText: "Enter Room Code",
                          filled: true,
                          fillColor: AppTheme.backgroundColor,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none
                          )
                        ),
                      ),
                    )
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black,
                                blurRadius: 8,
                                offset: Offset(1, 3),
                                spreadRadius: 1
                              )
                            ],
                            color: AppTheme.backgroundColor,
                            borderRadius: BorderRadius.circular(30)
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 60,),
                  HomeWidget.textButton(name: "Join Room", onPress: (){
                    _roomController.joinRoom(_controller.text.trim(), context);
                  })

                ],
              ),
            ),
          ), 
        ),
      )
    );
  }
}