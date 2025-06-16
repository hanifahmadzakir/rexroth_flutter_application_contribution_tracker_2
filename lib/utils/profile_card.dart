import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Employee Profile",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
          Row(
            children: [
              SizedBox(
                    width: 100,
                    height: 100,
                    child: Icon(Icons.person,size: 100,),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 200,
                    height: 30,
                    child: Text("John Doe"),
                  ),
                  SizedBox(
                    width: 200,
                    height: 30,
                    child: Text("Electrical Engineer"),
                  ),
                  SizedBox(
                    width: 200,
                    height: 30,
                    child: Text("John Doe"),
                  ),
              
              
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}