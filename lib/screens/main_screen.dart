import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../config/palette.dart';

class LoginSignUpScreen extends StatefulWidget {
  const LoginSignUpScreen({Key? key}) : super(key: key);

  @override
  State<LoginSignUpScreen> createState() => _LoginSignUpScreenState();
}

class _LoginSignUpScreenState extends State<LoginSignUpScreen>{
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
                        image: AssetImage('assets/background.png'),
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
                                text:'welcome ',
                                style: TextStyle(letterSpacing:  1.0, fontSize: 25, color: Colors.white),
                                children: [
                                  TextSpan(
// TODO : letter spacing 1.0, font size 25, color white, bold
                                    text:'to EOS chat',
                                    style: TextStyle(letterSpacing:  1.0, fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold  ),

                                  )
                                ]
                            )
                        ),


                        SizedBox(
// TODO : height 5.0으로 글 사이 간격 주기
                          height: 5.0,
                        ),
                        Text('signup to continue',
                          style: TextStyle(letterSpacing: 1.0, color: Colors.white,),
// TODO : spacing 1.0, color white
                        )],),),)),



            Positioned(
                top: 150,
// TODO : top 150
                child: Container(
                  height: 280.0,
                  padding: EdgeInsets.all(20),
                  width: MediaQuery.of(context).size.width -40,
                  margin: EdgeInsets.only(left: 20, right: 20),
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



                  child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
// TODO : mainAxisAlignment.spaceAround
                          children: [
                            GestureDetector(
                              child: Column(
                                children: [
                                  Text('LOGIN', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
// TODO : font size 16, bold
// TODO : isSignupScreen이 false면 palette의 activeColor, true면 palette의 textColor1
                                  ),
// TODO : isSigunupScreen이 false일 때만 밑줄이 생기도록
                                  Container(
                                    margin: EdgeInsets.only(top: 3),
                                    height: 2, width: 55, color: Colors.green,
// TODO : margin top만 3, height 2, width 55, color green
                                  )],),),


                            GestureDetector(
                                child: Column(
                                  children: [
                                    Text('LOGIN', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
// TODO : font size 16, bold
// TODO : isSignupScreen이 true면 palette의 activeColor, false면 palette의 textColor1
                                    ),
// TODO : isSigunupScreen이 true일 때만 밑줄이 생기도록
                                    Container(
                                      margin: EdgeInsets.only(top: 3),
                                      height: 2, width: 55, color: Colors.green,

// TODO : margin top만 3, height 2, width 55, color green
                                    )],))],),


                        Container(
                            child: Form(
                              child: Column(
                                  children: [
                                    TextFormField(
                                      decoration: InputDecoration(
// TODO : prefix icon 원하는 icon 입력, color는 palette의 iconColor
                                        enabledBorder: OutlineInputBorder(
// TODO : borderside 색은 palette의 textColot1
// TODO : border radius는 모두 35
                                        ),
                                        focusedBorder: OutlineInputBorder(
// TODO : borderside 색은 palette의 textColot1
// TODO : border radius는 모두 35
                                        ),),)]),))]),))],));}}
