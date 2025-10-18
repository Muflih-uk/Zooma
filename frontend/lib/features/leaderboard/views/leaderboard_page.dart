import 'package:flutter/material.dart';
import 'package:frontend/core/theme/app_theme.dart';

class LeaderboardPage extends StatefulWidget{
  @override
  State<LeaderboardPage> createState() => _StateLeaderboard();
}

class _StateLeaderboard extends State<LeaderboardPage>{

  List data = [
    {
      "id": "0e99cee1-f776-4609-8bcd-2f160e30db46",
      "username": "Arun",
      "validated_answers_count": 0
    },
    {
      "id": "ce63d664-0c1c-45e8-b752-6f3bd6217252",
      "username": "Muflih",
      "validated_answers_count": 0
    },
    {
      "id": "0e99cee1-f776-4609-8bcd-2f160e30db46",
      "username": "Arun",
      "validated_answers_count": 0
    },
    {
      "id": "ce63d664-0c1c-45e8-b752-6f3bd6217252",
      "username": "Muflih",
      "validated_answers_count": 0
    }
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Leaderboard",
          style: TextStyle(
            color: AppTheme.primaryColor,
            fontSize: 30
          ),
        ),
        centerTitle: true,
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
      body: Container(
        width: double.maxFinite,
        height: MediaQuery.of(context).size.height/2.5,
        color: Colors.black,
        child: Column(
          children: [
            Container(
              child: Column(
                children: [
                  Text(
                    "1",
                    style: TextStyle(
                      color: Colors.white
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}