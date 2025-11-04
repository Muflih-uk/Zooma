import 'package:flutter/material.dart';
import 'package:frontend/core/theme/app_theme.dart';
import 'package:frontend/features/leaderboard/controllers/leaderboard_controller.dart';
import 'package:provider/provider.dart';

class LeaderboardPage extends StatefulWidget {
  @override
  State<LeaderboardPage> createState() => _LeaderboardPageState();
}

class _LeaderboardPageState extends State<LeaderboardPage> {

  @override
  Widget build(BuildContext context) {
    LeaderboardController provider = Provider.of<LeaderboardController>(context);
    List<Map<String, dynamic>> data = provider.leaderboard;
    data.sort((a, b) => b["validated_answers_count"].compareTo(a["validated_answers_count"]));

    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppTheme.backgroundColor,
        elevation: 0,
        title: Text(
          "Leaderboard",
          style: TextStyle(
            fontSize: 28,
            color: AppTheme.primaryColor,
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
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(top: 20, bottom: 30),
            child: Column(
              children: [
                Column(
                  children: [
                    Text(
                      "1",
                      style: TextStyle(
                          fontSize: 56,
                          color: Colors.white,
                      )
                    ),
                    Text(
                      data[0]["username"],
                      style: TextStyle(fontSize: 22, color: Colors.white)
                    ),
                    Text(
                      "${data[0]["validated_answers_count"]} pts",
                      style: TextStyle(fontSize: 18, color: Colors.white)
                    ),
                  ],
                ),
                SizedBox(height: 20),
                // 2nd and 3rd place row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // 2nd
                    Column(
                      children: [
                        Text("2",
                            style: TextStyle(
                                fontSize: 48,
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                        Text(data[1]["username"],
                            style: TextStyle(fontSize: 20, color: Colors.white)),
                        Text("${data[1]["validated_answers_count"]} pts",
                            style: TextStyle(fontSize: 16, color: Colors.white)),
                      ],
                    ),
                    // 3rd
                    Column(
                      children: [
                        Text("3",
                            style: TextStyle(
                                fontSize: 48,
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                        Text(data[2]["username"],
                            style: TextStyle(fontSize: 20, color: Colors.white)),
                        Text("${data[2]["validated_answers_count"]} pts",
                            style: TextStyle(fontSize: 16, color: Colors.white)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Remaining players list
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppTheme.primaryColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 10),
                itemCount: data.length - 3,
                itemBuilder: (context, index) {
                  final player = data[index + 3];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              "${index + 4}.",
                              style: TextStyle(
                                  color: AppTheme.backgroundColor,
                                  fontSize: 18),
                            ),
                            SizedBox(width: 10),
                            Text(
                              player["username"],
                              style: TextStyle(
                                  color: AppTheme.backgroundColor,
                                  fontSize: 18),
                            ),
                          ],
                        ),
                        Text(
                          "${player["validated_answers_count"]} pts",
                          style: TextStyle(
                              color: AppTheme.backgroundColor,
                              fontSize: 18),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
