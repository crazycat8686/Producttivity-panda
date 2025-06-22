import 'dart:ui'; //imagefilter ki avasaram
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:_36inaday/utube.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // WidgetsFlutterBinding().in
  final pr = await SharedPreferences.getInstance();
  String? name = pr.getString('Name');
  String? email = pr.getString('Email');
  if (name != null &&
      name != '' &&
      name != 'user' &&
      email != null &&
      email != '' &&
      email != '@') {
    runApp(
      MaterialApp(
        home: utube(name: name, email: email),
        debugShowCheckedModeBanner: false,
      ),
    );
  } else {
    runApp(MaterialApp(home: Lander(), debugShowCheckedModeBanner: false));
  }
}

del() async {}

class Lander extends StatefulWidget {
  const Lander({super.key});

  @override
  State<Lander> createState() => _LanderState();
}

class _LanderState extends State<Lander> {
  final TextEditingController _cc = TextEditingController();
  String Email = '';
  String status = '';

  final TextEditingController _cd = TextEditingController();
  String Name = '';
  void sn() {
    sav();
    _cd.clear();
    // print(Name);
  }

  void nav() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => utube(name: Name, email: Email)),
    );
  }

  void initState() {
    super.initState();
    loa();
  }

  loa() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      Name = prefs.getString('Name') ?? 'User';
      Email = prefs.getString('Email') ?? '@';
    });
  }

  sav() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('Name', _cd.text);
    await prefs.setString('Email', _cc.text);
    nav();
    loa();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   title: Text(
      //     'Welcome',
      //     style: TextStyle(fontFamily: 'Lexend', fontWeight: FontWeight.bold),
      //   ),
      //   centerTitle: true,
      //   backgroundColor: Colors.transparent,
      // ),
      body: Stack(
        children: [
          // Translucent background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/awe.webp'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.4),
                  BlendMode.darken,
                ),
              ),
            ),
          ),

          // Frosted Glass UI on top
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.3),
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.3),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 10,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            TextField(
                              controller: _cc,
                              keyboardType: TextInputType.emailAddress,
                              style: TextStyle(
                                fontFamily: 'Lexend',
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                              decoration: InputDecoration(
                                hintText: 'BruceBudaraju@gmail.com',
                                hintStyle: TextStyle(color: Colors.white70),
                                labelText: 'Email',
                                labelStyle: TextStyle(
                                  fontFamily: 'Lexend',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                                filled: true,
                                fillColor: Colors.white.withOpacity(0.1),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(color: Colors.white70),
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            TextField(
                              controller: _cd,
                              keyboardType: TextInputType.name,
                              style: TextStyle(
                                fontFamily: 'Lexend',
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                              decoration: InputDecoration(
                                hintText: 'BruceBudaraju',
                                hintStyle: TextStyle(color: Colors.white70),
                                labelText: 'Name',
                                labelStyle: TextStyle(
                                  fontFamily: 'Lexend',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                                filled: true,
                                fillColor: Colors.white.withOpacity(0.1),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(color: Colors.white70),
                                ),
                              ),
                            ),
                            SizedBox(height: 30),
                            IconButton(
                              onPressed: () {
                                sav();
                                status = 'Details saved';
                              },
                              icon: Icon(
                                Icons.navigate_next,
                                size: 35,
                                color: Colors.deepOrange,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: FractionallySizedBox(
                      widthFactor: 0.75,
                      child: Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.deepPurple,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(40),
                            topLeft: Radius.circular(40),
                            bottomRight: Radius.circular(0),
                            topRight: Radius.circular(0),
                          ),
                        ),
                        child: AnimatedTextKit(
                          totalRepeatCount: 1,
                          pause: Duration(milliseconds: 500),
                          displayFullTextOnTap: true,
                          animatedTexts: [
                            TypewriterAnimatedText(
                              'Manage your tasks efficiently',
                              textAlign: TextAlign.center,
                              textStyle: TextStyle(
                                fontFamily: 'Lexend',
                                fontSize: 24,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                              speed: Duration(milliseconds: 70),
                            ),
                            TypewriterAnimatedText(
                              'Let\'s Begin',
                              textAlign: TextAlign.center,
                              textStyle: TextStyle(
                                fontFamily: 'Lexend',
                                fontSize: 24,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                              speed: Duration(milliseconds: 90),
                            ),
                            TypewriterAnimatedText(
                              'Enter your info..\nDon\'t worry, I won\'t steal your data',
                              textAlign: TextAlign.center,
                              textStyle: TextStyle(
                                fontFamily: 'Lexend',
                                fontSize: 22,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                              speed: Duration(milliseconds: 90),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
