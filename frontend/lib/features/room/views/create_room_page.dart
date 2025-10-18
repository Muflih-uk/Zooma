import 'package:flutter/material.dart';
import 'package:frontend/core/di/dependency_injection.dart';
import 'package:frontend/core/theme/app_theme.dart';
import 'package:frontend/features/home/views/home_widget.dart';
import 'package:frontend/features/room/controllers/room_controller.dart';
import 'package:provider/provider.dart';

class CreateRoomScreen extends StatelessWidget{

  final RoomController controller = getIt<RoomController>();

  @override
  Widget build(BuildContext context) {
    final counter = context.watch<RoomController>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Create Room",
          style: TextStyle(
            color: AppTheme.primaryColor,
            fontSize: 30
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
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 35, right: 35, bottom: 60),
          child: Container(
            width: 300,
            decoration: BoxDecoration(
              border: BoxBorder.all(
                color: Colors.black,
                width: 4
              ),
              color: AppTheme.primaryColor,
            ),
            child: Column(
              spacing: 30,
              children: [
                SizedBox(height: 40,),
                Text(
                  "Room Size",
                  style: TextStyle(
                    color: AppTheme.backgroundColor,
                    fontSize: 25
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: (){
                        counter.roomSizeDecrement();
                      }, 
                      icon: Padding(
                        padding: EdgeInsets.only(bottom: 16),
                        child: Icon(
                          Icons.minimize, 
                          color: AppTheme.backgroundColor,
                          size: 30,
                        ),
                      )
                    ),
                    Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        color: AppTheme.backgroundColor
                      ),
                      child: Center(
                        child: Text(
                          "${counter.roomSize}",
                          style: TextStyle(
                            color: AppTheme.primaryColor,
                            fontSize: 30
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: (){
                        counter.roomSizeIncrement();
                      }, 
                      icon: Center(
                        child: Icon(
                          Icons.add,
                          color: AppTheme.backgroundColor,
                          size: 30,
                        ),
                      )
                    ),
                  ],
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
                SizedBox(height: 20,),
                Text(
                  "Number of Questions",
                  style: TextStyle(
                    color: AppTheme.backgroundColor,
                    fontSize: 25
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: (){
                        counter.numberOfQuestionDecrement();
                      }, 
                      icon: Padding(
                        padding: EdgeInsets.only(bottom: 16),
                        child: Icon(
                          Icons.minimize, 
                          color: AppTheme.backgroundColor,
                          size: 30,
                        ),
                      )
                    ),
                    Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        color: AppTheme.backgroundColor
                      ),
                      child: Center(
                        child: Text(
                          "${counter.numberOfQuestion}",
                          style: TextStyle(
                            color: AppTheme.primaryColor,
                            fontSize: 30
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: (){
                        counter.numberOfQuestionIncrement();
                      }, 
                      icon: Center(
                        child: Icon(
                          Icons.add,
                          color: AppTheme.backgroundColor,
                          size: 30,
                        ),
                      )
                    ),
                  ],
                ),
                HomeWidget.textButton(name: "Generate code", onPress: (){
                  controller.createRoom(
                    counter.numberOfQuestion, 
                    counter.roomSize,
                    context
                  );
                })

              ],
            ),
          ),
        ), 
      ),
    );
  }
}