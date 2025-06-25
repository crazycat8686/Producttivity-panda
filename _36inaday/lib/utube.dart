import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:shared_preferences/shared_preferences.dart';

class utube extends StatefulWidget {
  final String email;
  final String name;
  utube({required this.name, required this.email, super.key});

  @override
  State<utube> createState() => _utubeState();
}

class _utubeState extends State<utube> {
  int ind = 0;
  bool detertodo = true;
  List<Map> lil = [];

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
      list = pr.getStringList('l') ?? [];
      tlist = pr.getStringList('t') ?? [];
    });
    cv();
  }

  Future<void> sav(List<String> list, List<String> tlist) async {
    final pr = await SharedPreferences.getInstance();
    pr.setStringList('l', list);
    pr.setStringList('t', tlist);

    loa();
  }

  final TextEditingController _controller = TextEditingController();
  List<String> list = [];
  var err = '';
  bool invis = false;
  bool viser = false;
  bool lvis = true;
  bool cvis = true;
  bool schedulevis = false;
  var ti = Icons.circle_outlined;
  // List<TimeOfDay?> sd = [];
  List<String> tlist = [];
  var count;

  del() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('Name');
    prefs.remove('Email');
    prefs.remove('l');
    prefs.remove('t');
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, top: 0, left: 0, right: 0),
      child: Scaffold(
        backgroundColor: Colors.white,

        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      onLongPress: () {
                        del();
                      },
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                          'https://picsum.photos/seed/picsum/200/300',
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                Visibility(
                  visible: detertodo,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                          child: Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.fromLTRB(0, 3, 0, 0),
                            decoration: BoxDecoration(
                              // color: const Color.fromARGB(43, 249, 232, 252),
                              borderRadius: BorderRadius.circular(40),
                              border: Border.all(
                                width: 1,
                                color: const Color.fromARGB(74, 247, 232, 250),
                              ),
                            ),
                            child: Column(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  // height: MediaQuery.of(context).size.height * 0.1,
                                  height: 30,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.white,
                                  ),
                                  child: TextField(
                                    onSubmitted: (value) {
                                      setState(() {
                                        viser = false;

                                        if (list.contains(_controller.text)) {
                                          viser = true;
                                          err =
                                              'ufcked upp bro thats already there..';
                                        } else {
                                          list.add(_controller.text);
                                          tlist.add('');
                                          _controller.clear();
                                          sav(list, tlist);
                                          cv();
                                        }
                                      });
                                    },
                                    controller: _controller,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        // borderSide: BorderSide(color: Colors.white),
                                        borderSide: BorderSide(
                                          color: Colors.purple.shade50,
                                          width: 2,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: BorderSide(
                                          color: Colors.purple.shade50,
                                          width: 2,
                                        ),
                                      ),
                                      labelText: 'Add a new task',
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20),
                                Row(
                                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    ElevatedButton.icon(
                                      icon: Icon(Icons.check_circle),
                                      label: Text('save'),

                                      onPressed: () {
                                        setState(() {
                                          viser = false;

                                          if (list.contains(_controller.text)) {
                                            viser = true;
                                            err =
                                                'ufcked upp bro thats already there..';
                                          } else if (_controller.text.trim() ==
                                              '') {
                                            viser = true;
                                            err =
                                                'Emi ra baala raaju??...\n waste ra reyy, \n yakk thu ';
                                          } else {
                                            list.add(_controller.text);
                                            tlist.add('');
                                            _controller.clear();
                                            sav(list, tlist);
                                            cv();
                                            invis = false;
                                          }
                                        });
                                      },
                                    ),
                                    SizedBox(width: 10),

                                    ElevatedButton.icon(
                                      label: Text('schedule'),
                                      icon: Icon(Icons.access_time),
                                      onPressed: () async {
                                        final DateTime? dt =
                                            await showDatePicker(
                                              context: context,
                                              firstDate: DateTime.now(),
                                              lastDate: DateTime.now().add(
                                                Duration(days: 365),
                                              ),
                                            );
                                        final TimeOfDay? t =
                                            await showTimePicker(
                                              initialTime: TimeOfDay.now(),
                                              context: context,
                                            );
                                        setState(() {
                                          if (t != '' &&
                                              t != null &&
                                              dt != '' &&
                                              dt != null) {
                                            print(dt);
                                            String ft = t.format(context);

                                            String fdt = dt.toString();
                                            String rdr = fdt.replaceAll(
                                              RegExp('( 00:00:00.000)'),
                                              '',
                                            );
                                            rdr = rdr.replaceAll(
                                              RegExp('2025-'),
                                              '',
                                            );
                                            rdr = rdr.replaceAll(
                                              RegExp('\-'),
                                              '\\',
                                            );
                                            rdr = rdr
                                                .split('\\')
                                                .reversed
                                                .join('\\');
                                            print(fdt);
                                            print(rdr);
                                            print(ft);

                                            tlist.add('${rdr},${ft}');
                                            print(tlist);
                                            list.add(_controller.text);
                                            _controller.clear();
                                            sav(list, tlist);
                                            cv();
                                            invis = false;
                                          }
                                        });
                                      },
                                    ),
                                  ],
                                ),
                                // Visibility(
                                //   visible: schedulevis,
                                //   child:
                                // ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20),

                        Visibility(
                          visible: viser,
                          child: Text(err, style: TextStyle(color: Colors.red)),
                        ),

                        Visibility(
                          visible: cvis,
                          child: Container(
                            margin: EdgeInsets.only(
                              top: 6,
                              bottom: 10,
                              left: 6,
                              right: 6,
                            ),
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.white,
                              // border: Border.all(
                              //   color: const Color.fromARGB(107, 243, 229, 245),
                              //   width: 1.4,
                              // ),
                            ),
                            child: Column(
                              children: [
                                for (int i = 0; i < list.length; i++)
                                  // for (int j = 0; i < tlist.length; j++)
                                  Center(
                                    child: Container(
                                      alignment: Alignment.center,

                                      margin: EdgeInsets.only(bottom: 3),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,

                                            children: [
                                              Flexible(
                                                child: Container(
                                                  padding: EdgeInsets.all(4),
                                                  width:
                                                      MediaQuery.of(
                                                        context,
                                                      ).size.width *
                                                      0.88,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          22,
                                                        ),
                                                    color: Colors.white,
                                                    border: Border.all(
                                                      color:
                                                          const Color.fromARGB(
                                                            107,
                                                            241,
                                                            220,
                                                            244,
                                                          ),
                                                      width: 1.8,
                                                    ),
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      IconButton(
                                                        icon: Icon(
                                                          ti,
                                                          color: Colors.purple,
                                                        ),
                                                        onPressed: () {
                                                          setState(() {
                                                            list.removeAt(i);
                                                            tlist.removeAt(i);
                                                            sav(list, tlist);
                                                            cv();
                                                          });
                                                        },
                                                      ),

                                                      Text(
                                                        '${list[i]}',
                                                        style: TextStyle(
                                                          fontFamily: 'Lexend',
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                      Spacer(),
                                                      ElevatedButton.icon(
                                                        onPressed: () {},
                                                        label: Text(
                                                          '${tlist[i]}',
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Lexend',
                                                            fontSize: 11,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 5),
                                        ],
                                      ),
                                    ),
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
                                  child: Image(
                                    image: AssetImage('images/notasks.webp'),
                                  ),
                                ),
                              ),
                              Text(
                                textAlign: TextAlign.center,
                                'No tasks for now, \nclicl "+" to add a new task',
                                style: TextStyle(
                                  fontFamily: 'Lexend',
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                      //ass,map((cheeks)=> Text(cheeks).toList()),
                    ),
                  ),
                ),
                Visibility(
                  visible: !detertodo,
                  child: Padding(
                    padding: EdgeInsetsGeometry.all(4),
                    child: Column(children: [

                      ],
                    ),
                  ),
                ),
              ],
            ),
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
        // bottomNavigationBar: Container(
        //   child: Padding(
        //     padding: EdgeInsetsGeometry.all(4),
        //     child: Row(
        //       children: [
        //         Column(
        //           children: [
        //             IconButton(
        //               onPressed: () {},
        //               icon: Icon(Icons.checklist_rounded),
        //             ),
        //             Text('To-do'),
        //           ],
        //         ),
        //         Column(
        //           children: [
        //             IconButton(
        //               onPressed: () {
        //                 Navigator.push(
        //                   context,
        //                   MaterialPageRoute(builder: (context) => note()),
        //                 );
        //               },
        //               icon: Icon(Icons.checklist_rounded),
        //             ),
        //             Text('To-do'),
        //           ],
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: ind,
          onTap: (ind) {
            setState(() {
              print(ind);
              if (ind == 1) {
                detertodo = false;
              } else {
                detertodo = true;
              }
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.list_alt), label: 'todo'),
            BottomNavigationBarItem(
              icon: Icon(Icons.note_add_outlined),
              label: 'notes',
            ),
          ],
        ),
      ),
    );
  }
}
