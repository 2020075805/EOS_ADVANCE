import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../config/palette.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';


class LoginSignUpScreen extends StatefulWidget {
  const LoginSignUpScreen({Key? key}) : super(key: key);

  @override
  State<LoginSignUpScreen> createState() => _LoginSignUpScreenState();
}

class _LoginSignUpScreenState extends State<LoginSignUpScreen>{
  bool isSignUpScreen = true;
// TODO : isSignupScreen 변수 선언
  @override
  Widget build(BuildContext context) {
    return Scaffold (
// TODO : background color로 palette의 backgroundColor 설정
        backgroundColor: Palette.backgroundColor,
        body: Stack(
          children: [
            Positioned(
// TODO : top, left, right 모두 0으로 설정
                top:0, left: 0, right: 0,
                child: Container(
// TODO : height 300으로 설정
                  height: 300,
                  decoration: BoxDecoration(
                    image: DecorationImage(
// TODO : background.png 넣기
                        image: AssetImage('assets/images/background.png'),
                        fit: BoxFit.fill
                    ),
                  ),


                  child: Container(
                    padding: EdgeInsets.only(top:90, left:20) ,
                    child: Column(
// TODO : 왼쪽 정렬,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                            text: TextSpan(
// TODO : letter spacing 1.0, font size 25, color white
                                text:'Welcome ',
                                style: TextStyle(letterSpacing:  1.0, fontSize: 25, color: Colors.white),
                                children: [
                                  TextSpan(
// TODO : letter spacing 1.0, font size 25, color white, bold
                                    text: isSignUpScreen? 'to EOS chat!': 'back',
                                    style: TextStyle(letterSpacing:  1.0, fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold  ),
                                  )
                                ]
                            )
                        ),


                        SizedBox(
// TODO : height 5.0으로 글 사이 간격 주기
                          height: 5.0,
                        ),
                        Text( isSignUpScreen? 'Signup to continue' :'Signin to continue',
                          style: TextStyle(letterSpacing: 1.0, color: Colors.white,),
// TODO : spacing 1.0, color white
                        )
                      ],),),)),



            Positioned(
                top: 150,
// TODO : top 150
                child: AnimatedContainer(
                  height: isSignUpScreen? 280.0 : 250.0,
                  padding: EdgeInsets.all(20),
                  width: MediaQuery.of(context).size.width -40,
                  margin: EdgeInsets.symmetric(horizontal: 20.0),
// TODO : height 280.0, padding 모두 20, width 핸드폰 가로 길이 – 40
// TODO : margin 가로로 양쪽 20
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(15)),

// TODO : color white, border radius 15
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 15, spreadRadius: 5,
// TODO : color black, 투명도 0.3, blur radius 15, spread radius 5
                        )
                      ]
                  ),

                  curve: Curves.easeIn,
                  duration: Duration(milliseconds: 500),
                  child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
// TODO : mainAxisAlignment.spaceAround
                          children: [
                            GestureDetector(
                              onTap: (){
                                setState(() {
                                  isSignUpScreen = false;
                                });
                              },
                              child: Column(
                                children: [
                                  Text('LOGIN',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: !isSignUpScreen
                                            ? Palette.activeColor
                                            :Palette.textColor1),

// TODO : font size 16, bold
// TODO : isSignupScreen이 false면 palette의 activeColor, true면 palette의 textColor1
                                  ),
// TODO : isSigunupScreen이 false일 때만 밑줄이 생기도록
                                  if( !isSignUpScreen)
                                    Container(
                                        margin: EdgeInsets.only(top: 3),
                                        height: 2, width: 55, color: Colors.green
                                    ),
// TODO : margin top만 3, height 2, width 55, color green
                                ],),),


                            GestureDetector(
                                onTap: (){
                                  setState(() {
                                    isSignUpScreen = true;
                                  });
                                },
                                child: Column(
                                  children: [
                                    Text('SIGNUP',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: isSignUpScreen
                                              ? Palette.activeColor
                                              : Palette.textColor1
                                      ),
// TODO : font size 16, bold
// TODO : isSignupScreen이 true면 palette의 activeColor, false면 palette의 textColor1
                                    ),
                                    if(isSignUpScreen)
// TODO : isSigunupScreen이 true일 때만 밑줄이 생기도록
                                      Container(
                                        margin: EdgeInsets.only(top: 3),
                                        height: 2, width: 55, color: Colors.green,
// TODO : margin top만 3, height 2, width 55, color green
                                      )],))],),


                        Container(
                            margin: EdgeInsets.only(top: 20),
                            child: Form(
                              child: Column(
                                  children: [
                                    if(isSignUpScreen)
                                      TextFormField(
                                        decoration: InputDecoration(
                                          labelText: "User name",
// TODO : prefix icon 원하는 icon 입력, color는 palette의 iconColor
                                          prefixIcon: Icon(Icons.account_circle, color: Palette.iconColor),
                                          enabledBorder: OutlineInputBorder(
                                              borderSide:
                                              BorderSide(color: Palette.textColor1),
                                              borderRadius:
                                              BorderRadius.all(Radius.circular(35.0))
// TODO : borderside 색은 palette의 textColot1
// TODO : border radius는 모두 35
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide:
                                              BorderSide(color: Palette.textColor1),
                                              borderRadius:
                                              BorderRadius.all(Radius.circular(35.0))
// TODO : borderside 색은 palette의 textColot1
// TODO : border radius는 모두 35
                                          ),),),
                                    SizedBox(
                                        height: 8.0
                                    ),
                                    TextFormField(
                                      decoration: InputDecoration(
                                        labelText: "email",
// TODO : prefix icon 원하는 icon 입력, color는 palette의 iconColor
                                        prefixIcon: Icon(Icons.account_circle, color: Palette.iconColor),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide:
                                            BorderSide(color: Palette.textColor1),
                                            borderRadius:
                                            BorderRadius.all(Radius.circular(35.0))
// TODO : borderside 색은 palette의 textColot1
// TODO : border radius는 모두 35
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide:
                                            BorderSide(color: Palette.textColor1),
                                            borderRadius:
                                            BorderRadius.all(Radius.circular(35.0))
// TODO : borderside 색은 palette의 textColot1
// TODO : border radius는 모두 35
                                        ),),),
                                    SizedBox(
                                        height:8.0
                                    ),
                                    TextFormField(
                                      decoration: InputDecoration(
                                        labelText: "password",
// TODO : prefix icon 원하는 icon 입력, color는 palette의 iconColor
                                        prefixIcon: Icon(Icons.account_circle, color: Palette.iconColor),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide:
                                            BorderSide(color: Palette.textColor1),
                                            borderRadius:
                                            BorderRadius.all(Radius.circular(35.0))
// TODO : borderside 색은 palette의 textColot1
// TODO : border radius는 모두 35
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide:
                                            BorderSide(color: Palette.textColor1),
                                            borderRadius:
                                            BorderRadius.all(Radius.circular(35.0))
// TODO : borderside 색은 palette의 textColot1
// TODO : border radius는 모두 35
                                        ),),)]),))]),)),
            AnimatedPositioned(
                top: isSignUpScreen? 430: 390,
                right: 0,
                left: 0,
                curve: Curves.easeIn,
                duration: Duration(milliseconds: 500),
                child: Center(
                    child:Container(
                        padding: EdgeInsets.all(15),
                        height: 90,
                        width: 90,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50)
                        ),
                        child: Container(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [Colors.lightGreen, Colors.green],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight
                                ),
                                borderRadius: BorderRadius.circular(30),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.3),
                                      spreadRadius: 1,
                                      blurRadius: 1,
                                      offset: Offset(0,1)
                                  )
                                ]
                            ),
                            child: Icon(
                                Icons.arrow_right_alt,
                                color: Colors.white
                            )
                        )
                    )
                )
            ),
            Positioned(
                top: MediaQuery.of(context).size.height-125,
                right: 0,
                left: 0,
                child: Column(
                    children: [
                      if(!isSignUpScreen)
                        Text("or Signin with")
                      else
                        Text("or SignUp With"),

                      TextButton.icon(
                        onPressed: (){},
                        style: TextButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Palette.googleColor,
                            minimumSize: Size(155,40),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)
                            )
                        ), icon: Icon(Icons.add), label: Text("Google"),



                      )
                    ]
                )
            )
          ],
        )
    );
  }
}