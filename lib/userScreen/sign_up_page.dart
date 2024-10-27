import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class SingUpScreen extends StatefulWidget {
  const SingUpScreen({super.key, required this.controller,required this.onSubmitData});
  final PageController controller;
  final Function(String) onSubmitData;
  @override
  State<SingUpScreen> createState() => _SingUpScreenState();
}

class _SingUpScreenState extends State<SingUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _repassController = TextEditingController();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 0),
            child: Image.asset(
              "assets/images/vector-2.png",
              width: 428.w,
              height: 457.h,
            ),
          ),
          SizedBox(
            height: 18.h,
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 50.w),
            child: Column(
              textDirection: TextDirection.ltr,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Text(
                  'Sign up',
                  style: TextStyle(
                    color: Color(0xFF755DC1),
                    fontSize: 27.sp,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                 SizedBox(
                  height: 40.h,
                ),
                SizedBox(
                  height: 56.h,
                  child: TextField(
                    controller: _emailController,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF393939),
                      fontSize: 13.sp,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(
                        color: Color(0xFF755DC1),
                        fontSize: 15.sp,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                          width: 1.w,
                          color: Color(0xFF837E93),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                          width: 1.w,
                          color: Color(0xFF9F7BFF),
                        ),
                      ),
                    ),
                  ),
                ),
                 SizedBox(
                  height: 17.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 147.w,
                      height: 56.h,
                      child: TextField(
                        controller: _passController,
                        obscureText: true, // 隐藏输入的内容
                        textAlign: TextAlign.center,
                        style:  TextStyle(
                          color: Color(0xFF393939),
                          fontSize: 13.sp,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),
                        decoration:  InputDecoration(
                          labelText: 'Password',
                          hintText: 'Create Password',
                          hintStyle: TextStyle(
                            color: Color(0xFF837E93),
                            fontSize: 10.sp,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                          ),
                          labelStyle: TextStyle(
                            color: Color(0xFF755DC1),
                            fontSize: 15.sp,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                              width: 1.w,
                              color: Color(0xFF837E93),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                              width: 1.w,
                              color: Color(0xFF9F7BFF),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 147.w,
                      height: 56.h,
                      child: TextField(
                        controller: _repassController,
                        obscureText: true, // 隐藏输入的内容
                        textAlign: TextAlign.center,
                        style:  TextStyle(
                          color: Color(0xFF393939),
                          fontSize: 13.sp,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),
                        decoration: InputDecoration(
                          labelText: 'Password',
                          hintText: 'Confirm Password',
                          hintStyle: TextStyle(
                            color: Color(0xFF837E93),
                            fontSize: 10.sp,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                          ),
                          labelStyle: TextStyle(
                            color: Color(0xFF755DC1),
                            fontSize: 15.sp,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                              width: 1.w,
                              color: Color(0xFF837E93),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                              width: 1.w,
                              color: Color(0xFF9F7BFF),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 3.h,
                ),
                 Text(
                      ' Password must be at least 8 characters long',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF837E93),
                        fontSize: 13.sp,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                SizedBox(
                  height: 18.h,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10.r)),
                  child: SizedBox(
                    width: 329.w,
                    height: 56.h,
                    child: ElevatedButton(
                      onPressed: () {
                        //先检查邮箱是否符合规范
                        if(isEmailValid()){
                          //再判断两遍输入的密码相不相同
                          if(_passController.text==_repassController.text){
                            //再判断密码格式规不规范
                            if(isPasswordValid(_passController.text))
                            {
                               widget.onSubmitData(_emailController.text);
                               widget.controller.animateToPage(4,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.ease);
                            }
                            else{
                               ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Please input valid password')),
                            );
                            }
                          }
                          else{
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Please comfirm your password!')),
                            );
                          }
                        }
                        else{
                           ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Please input valid E-mail')),
                            );
                        }

                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF9F7BFF),
                      ),
                      child:  Text(
                        'Create account',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.sp,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Row(
                  children: [
                    Text(
                      ' have an account?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF837E93),
                        fontSize: 13.sp,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                     SizedBox(
                      width: 2.5.w,
                    ),
                    InkWell(
                      onTap: () {
                        widget.controller.animateToPage(2,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.ease);
                      },
                      child: Text(
                        'Log In ',
                        style: TextStyle(
                          color: Color(0xFF755DC1),
                          fontSize: 13.sp,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  bool isEmailValid() {
  String email = _emailController.text; // 获取用户输入，不去除空格
  String emailPattern =
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'; // 正则表达式不允许空格
  RegExp regex = RegExp(emailPattern);

  return regex.hasMatch(email); // 如果匹配则返回 true，表示邮箱格式有效
}
bool isPasswordValid(String password) {
  // 检查密码是否包含空格，长度是否大于等于8
  if (password.contains(' ') || password.length < 8) {
    return false; // 格式不合理
  }
  return true; // 格式合理
}
}
