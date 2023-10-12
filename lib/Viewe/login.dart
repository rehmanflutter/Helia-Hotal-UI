import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: media.width * 0.6,
              height: media.height * 0.07,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.grey,
                  width: 5.0,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: TextField(
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    hintText: 'Email-iD',
                    prefixText: '   ',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: media.height * 0.03,
            ),
            Container(
              width: media.width * 0.5,
              height: media.height * 0.07,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.grey,
                  width: 5.0,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: TextField(
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    hintText: 'Password',
                    prefixText: '  ',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 10.0,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: media.height * 0.05,
            ),
            InkWell(
              onTap: () {
                
              },
              child: Container(
                width: media.width * 0.1,
                height: media.height * 0.06,
                decoration: BoxDecoration(
                  color: Color(0xff29faf5),
                  border: Border.all(
                    color: Color(0xff2bbdc0),
                    width: 5.0,
                  ),
                ),
                child: Center(
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
