import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey();

  String email = '';
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final containerWidth = screenSize.width;
    final containerHeight = screenSize.height;
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: Color.fromARGB(248, 16, 52, 231),
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              height: 900,
              width: containerWidth,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  SvgPicture.asset('assets/profile.svg',
                      height: containerHeight * 0.24),
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    'Welcome Back!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 30),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: containerWidth * 0.9,
                      child: Text(
                        'Please Log into your existing account',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    width: containerWidth * 0.9,
                    child: Form(
                      key: _formKey,
                      child: TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        cursorColor: const Color.fromRGBO(0, 0, 0, 1),
                        decoration: InputDecoration(
                          hintText: 'Your Email',
                          hintStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.w400,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter Email';
                          } else if (!value.endsWith('@gmail.com') ||
                              !value.endsWith('.in')) {
                            return 'Please Enter Valid Email';
                          }
                          return null;
                        },
                        onChanged: (value) => email = value,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: containerWidth * 0.9,
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      cursorColor: const Color.fromRGBO(0, 0, 0, 1),
                      decoration: InputDecoration(
                        hintText: 'Your Password',
                        hintStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w400,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      obscureText: true,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Container(
                    width: containerWidth * 0.9,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: () {
                        _formKey.currentState!.validate();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF2AC88F),
                        elevation: 3,
                        disabledBackgroundColor: const Color(0xFF2AC88F),
                        shape: RoundedRectangleBorder(
                            side: const BorderSide(
                              color: const Color(0xFF2AC88F),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      child: Text(
                        'Log in',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
