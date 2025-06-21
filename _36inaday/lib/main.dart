import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
                image: AssetImage('images/images.jpg'),
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

class utube extends StatefulWidget {
  final String email;
  final String name;
  utube({required this.name, required this.email, super.key});

  @override
  State<utube> createState() => _utubeState();
}

class _utubeState extends State<utube> {
  void cv() {
    if (list.isEmpty) {
      setState(() {
        cvis = false;
      });
    } else {
      setState(() {
        cvis = true;
      });
    }
  }

  void initState() {
    super.initState();
    loa();
    cv();
  }

  Future<void> loa() async {
    final pr = await SharedPreferences.getInstance();
    setState(() {
      list = pr.getStringList('myl') ?? [];
    });
    cv();
  }

  Future<void> sav(List<String> list) async {
    final pr = await SharedPreferences.getInstance();
    pr.setStringList('myl', list);
    loa();
    print("saved");
  }

  Color cb = Colors.white;
  Color c1 = Colors.black;
  Color c2 = Colors.brown;
  Color c3 = Colors.red;

  final TextEditingController _controller = TextEditingController();
  List<String> list = [];
  var err = '';
  bool invis = false;
  bool viser = false;
  bool lvis = true;
  bool cvis = true;

  void nav2() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => wall()));
  }

  del() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('Name');
    prefs.remove('Email');
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, top: 0, left: 0, right: 0),
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 247, 237, 248),

        body: Padding(
          padding: EdgeInsets.fromLTRB(30, 20, 30, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                      'https://picsum.photos/seed/picsum/200/300',
                    ),
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              // Text(
              //   textAlign: TextAlign.center,
              //   'Welcome back ${widget.name} \n let\'s plan your day',
              //   style: TextStyle(
              //     fontFamily: 'Lexend',
              //     fontSize: 22,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
              AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    'Hello ${widget.name}',
                    speed: Duration(milliseconds: 200),
                    textStyle: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Lexend',
                      color: Colors.deepPurple,
                    ),
                  ),
                  ColorizeAnimatedText(
                    'To-dos  ',
                    colors: [
                      Colors.black,
                      Colors.deepPurple,
                      Colors.deepOrange,
                      Colors.redAccent,
                    ],
                    textStyle: TextStyle(
                      // color: Colors.black,
                      fontSize: 29,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Lexend',
                    ),
                  ),
                ],
                totalRepeatCount: 1,
                pause: Duration(milliseconds: 500),
              ),
              // ass.map((cheeks) {
              //   return Text(
              //     cheeks,
              //     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 33),
              //   );
              // }).toList(),
              Visibility(
                visible: invis,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                    Flexible(
                      flex: 2,
                      child: TextField(
                        onSubmitted: (value) {
                          setState(() {
                            viser = false;

                            if (list.contains(_controller.text)) {
                              viser = true;
                              err = 'ufcked upp bro thats already there..';
                            } else {
                              list.add(_controller.text);
                              _controller.clear();
                              sav(list);
                              cv();
                            }
                          });
                        },
                        controller: _controller,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          labelText: 'Task',
                        ),
                      ),
                    ),
                    FittedBox(
                      child: ElevatedButton(
                        child: Icon(Icons.menu),
                        onPressed: () {
                          setState(() {
                            viser = false;

                            if (list.contains(_controller.text)) {
                              viser = true;
                              err = 'ufcked upp bro thats already there..';
                            } else if (_controller.text.trim() == '') {
                              viser = true;
                              err =
                                  'Emi ra baala raaju??...\n waste ra reyy, \n yakk thu ';
                            }
                            if (list.contains(_controller.text)) {
                              viser = true;
                              err = 'ufcked upp bro thats already there..';
                            } else {
                              list.add(_controller.text);
                              _controller.clear();
                              sav(list);
                              cv();
                            }
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),

              Visibility(
                visible: viser,
                child: Text(err, style: TextStyle(color: c3)),
              ),

              Visibility(
                visible: cvis,
                child: Container(
                  margin: EdgeInsets.all(4),
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                    border: Border.all(color: Colors.purple.shade50, width: 1),
                  ),
                  child: Column(
                    children: [
                      for (int i = 0; i < list.length; i++)
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,

                              children: [
                                Text('${i + 1} . ${list[i]}'),
                                ElevatedButton(
                                  child: Icon(Icons.delete),

                                  onPressed: () {
                                    setState(() {
                                      list.removeAt(i);
                                      cv();
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30),
              Visibility(
                visible: !cvis,
                child: Column(
                  children: [
                    Center(
                      child: ClipRRect(
                        child: Image(image: AssetImage('images/image.png')),
                      ),
                    ),
                    Text(
                      textAlign: TextAlign.center,
                      'No tasks for now, \nclicl "+" to add a new task',
                      style: TextStyle(
                        fontSize: 19.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Lexend',
                      ),
                    ),
                  ],
                ),
              ),
            ],
            //ass,map((cheeks)=> Text(cheeks).toList()),
          ),
        ),

        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            setState(() {
              invis = true;
            });
          },
        ),
      ),
    );
  }
}

class wall extends StatefulWidget {
  const wall({super.key});

  @override
  State<wall> createState() => _wallState();
}

class _wallState extends State<wall> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('pandapicssss'), centerTitle: true),
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      'https://picsum.photos/seed/picsum/200/300',
                    ),
                  ),
                  SizedBox(width: 12),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),

                    child: Image.network(
                      'https://picsum.photos/seed/picsum/200/300',
                    ),
                  ),
                  SizedBox(width: 12),

                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),

                    child: Image.network(
                      'https://picsum.photos/seed/picsum/200/300',
                    ),
                  ),
                  SizedBox(width: 12),

                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),

                    child: Image.network(
                      'https://picsum.photos/seed/picsum/200/300',
                    ),
                  ),
                  SizedBox(width: 12),

                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),

                    child: Image.network(
                      'https://picsum.photos/seed/picsum/200/300',
                    ),
                  ),
                  SizedBox(width: 12),

                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),

                    child: Image.network(
                      'https://picsum.photos/seed/picsum/200/300',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
