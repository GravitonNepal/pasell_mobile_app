import 'package:flutter/material.dart';

import '../../Widgets/CustomButton.dart';

class HomeScreenPageee extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 4,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            child: Image.asset(
                              'Assets/logoo.png',
                              height: 100,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  child: ListView(
                    physics: BouncingScrollPhysics(),
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        height: 50,
                        width: 130,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              // foregroundColor:
                              //     Color.fromARGB(255, 25, 175, 202),
                              backgroundColor: Colors.white,
                              side: const BorderSide(
                                  color: Color.fromARGB(255, 111, 221, 252),
                                  width: 2),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8))),
                          onPressed: () =>
                              Navigator.of(context).pushNamed('signInPage'),
                          child: const Text(
                            'Sign In',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                      // CustomButton(
                      //   // borderRadius: BorderRadius),
                      //     text: 'Sign Up',
                      //     fontWeight: FontWeight.bold,
                      //     color: Color.fromARGB(255, 233, 239, 245),
                      //     textColor: Color.fromARGB(255, 244, 239, 239),

                      //     onPressed: () =>
                      //         Navigator.of(context).pushNamed('signUpPage')),
                      SizedBox(height: 30.0),
                      Container(
                        height: 50,
                        width: 130,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              // foregroundColor:
                              //     Color.fromARGB(255, 25, 175, 202),
                              backgroundColor: Colors.white,
                              side: const BorderSide(
                                  color: Color.fromARGB(255, 150, 227, 248),
                                  width: 2),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8))),
                          onPressed: () =>
                              Navigator.of(context).pushNamed('signUpPage'),
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),

                      SizedBox(height: 10.0),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
