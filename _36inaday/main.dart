import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HEllo ',
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      home: Homepage(),
    );
  }
}

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color.fromARGB(255, 252, 237, 228),
      backgroundColor: Colors.transparent,

      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Text('Hello'),
      ),
      extendBodyBehindAppBar: true, // 👈 This is the KEY
      appBar: AppBar(
        toolbarOpacity: 1,
        foregroundColor: Colors.white,
        toolbarHeight: 42,
        // bottomOpacity: ,
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
        // ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(26)),
        ),

        // toolbarHeight: 50,
        // foregroundColor: Colors.white,//idhi icons color
        elevation: 0,
        backgroundColor: const Color.fromARGB(102, 26, 24, 24),
        // backgroundColor: const Color.fromARGB(203, 255, 255, 255),

        // shadowColor: const Color.fromARGB(29, 255, 86, 34),
        centerTitle: true,
        title: Text(
          'BlackCat',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Colors.deepOrange,
            fontFamily: 'Lexend',
            letterSpacing: 0,
          ),
        ),
        leading: Container(
          height: 35,
          width: 35,
          // margin: EdgeInsets.only(top: 4, left: 12, bottom: 4),
          margin: EdgeInsets.only(left: 14, bottom: 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: const Color.fromARGB(81, 212, 195, 205),
          ),
          child: Icon(Icons.airplay_rounded, size: 30),
        ),
        actions: [
          Container(
            height: 35,
            width: 35,
            margin: EdgeInsets.only(right: 14, bottom: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: const Color.fromARGB(81, 212, 195, 205),
            ),
            child: Icon(Icons.logout_rounded),
          ),
        ],
      ),
      body: Container(
        color: const Color.fromARGB(255, 252, 237, 228),
        padding: EdgeInsets.all(2),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SingleChildScrollView(
                child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 100, bottom: 10),
                      height: 200,
                      width: 400,

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(17),
                        boxShadow: [
                          BoxShadow(
                            // blurStyle: BlurStyle.outer,
                            blurRadius: 6,
                            // spreadRadius: 2,
                            offset: Offset(-2, 12),
                            color: const Color.fromARGB(193, 54, 4, 4),
                          ),
                          BoxShadow(
                            // blurStyle: BlurStyle.outer,
                            blurRadius: 6,
                            offset: Offset(2, 0),
                            color: const Color.fromARGB(193, 54, 4, 4),
                          ),
                          BoxShadow(
                            // blurStyle: BlurStyle.outer,
                            blurRadius: 6,
                            spreadRadius: 2,
                            offset: Offset(0, -2),
                            color: const Color.fromARGB(144, 54, 4, 4),
                          ),
                        ],
                      ),
                      // child:
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),

                            child: Image(
                              height: 200,
                              fit: BoxFit.cover,
                              width: 400,
                              image: AssetImage('images/panda.png'),
                            ),
                          ),
                          SizedBox(
                            child: Container(
                              height: 200,
                              width: 400,
                              // color: const Color.fromARGB(26, 0, 0, 0),
                              // decoration: BoxDecoration(backgroundBlendMode: ),
                              // margin: EdgeInsets.symmetric(vertical: 45),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  textAlign: TextAlign.center,

                                  'Genpanda',
                                  style: TextStyle(
                                    fontSize: 44,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Lexend',
                                    // shadows: [
                                    //   Shadow(
                                    //     blurRadius: 24,

                                    //     offset: Offset(-3, -10),
                                    //     color: Colors.white,
                                    //   ),
                                    // ],
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
              ),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,

                child: Container(
                  margin: EdgeInsets.only(left: 0, bottom: 20, top: 20),

                  decoration: BoxDecoration(
                    // border: Border.all(
                    //   color: Colors.red, // 🔴 Border color
                    //   width: 2.0, // ⬅️ Border thickness
                    // ),
                    borderRadius: BorderRadius.circular(14),
                    color: const Color.fromARGB(255, 252, 237, 228),

                    // boxShadow: [
                    //   BoxShadow(
                    //     // blurStyle: BlurStyle.outer,
                    //     blurRadius: 6,
                    //     // spreadRadius: 2,
                    //     offset: Offset(-2, 12),
                    //     color: const Color.fromARGB(193, 54, 4, 4),
                    //   ),
                    //   BoxShadow(
                    //     // blurStyle: BlurStyle.outer,
                    //     blurRadius: 6,
                    //     offset: Offset(2, 0),
                    //     color: const Color.fromARGB(193, 54, 4, 4),
                    //   ),
                    //   BoxShadow(
                    //     // blurStyle: BlurStyle.outer,
                    //     blurRadius: 6,
                    //     spreadRadius: 2,
                    //     offset: Offset(0, -2),
                    //     color: const Color.fromARGB(144, 54, 4, 4),
                    //   ),
                    // ],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Container(
                        padding: EdgeInsets.all(7),
                        margin: EdgeInsets.only(
                          left: 10,
                          right: 0,
                          top: 5,
                          bottom: 5,
                        ),
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: ElevatedButton.icon(
                            autofocus: true,
                            onPressed: () {
                              print("helllllo");
                            },
                            label: Text(
                              textAlign: TextAlign.center,
                              'Music',
                              style: TextStyle(
                                fontFamily: 'Lexend',
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            // child: Text("click"),
                            icon: Icon(Icons.music_note, color: Colors.brown),

                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.all(5),

                              iconSize: 20,
                              backgroundColor: const Color.fromARGB(
                                36,
                                0,
                                0,
                                0,
                              ),
                              shadowColor: const Color.fromARGB(
                                115,
                                244,
                                67,
                                54,
                              ),
                              elevation: 0,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: EdgeInsets.all(7),
                        margin: EdgeInsets.only(
                          left: 10,
                          right: 0,
                          top: 5,
                          bottom: 5,
                        ),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(14),
                              child: Image.network(
                                'https://picsum.photos/200/200',
                                fit:
                                    BoxFit
                                        .cover, // Fixed: BoxFit should be capitalized
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: EdgeInsets.all(7),
                        margin: EdgeInsets.only(
                          left: 10,
                          right: 0,
                          top: 5,
                          bottom: 5,
                        ),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(14),
                              child: Image.network(
                                'https://picsum.photos/200/200',
                                fit:
                                    BoxFit
                                        .cover, // Fixed: BoxFit should be capitalized
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: EdgeInsets.all(7),
                        margin: EdgeInsets.only(
                          left: 10,
                          right: 0,
                          top: 5,
                          bottom: 5,
                        ),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(14),
                              child: Image.network(
                                'https://picsum.photos/200/200',
                                fit:
                                    BoxFit
                                        .cover, // Fixed: BoxFit should be capitalized
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: EdgeInsets.all(7),
                        margin: EdgeInsets.only(
                          left: 10,
                          right: 0,
                          top: 5,
                          bottom: 5,
                        ),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(14),
                              child: Image.network(
                                'https://picsum.photos/200/200',
                                fit:
                                    BoxFit
                                        .cover, // Fixed: BoxFit should be capitalized
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: EdgeInsets.all(7),
                      margin: EdgeInsets.only(
                        left: 10,
                        right: 0,
                        top: 5,
                        bottom: 5,
                      ),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(14),
                            child: Image.network(
                              'https://picsum.photos/200/200',
                              fit:
                                  BoxFit
                                      .cover, // Fixed: BoxFit should be capitalized
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: EdgeInsets.all(7),
                      margin: EdgeInsets.only(
                        left: 10,
                        right: 0,
                        top: 5,
                        bottom: 5,
                      ),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(14),
                            child: Image.network(
                              'https://picsum.photos/200/200',
                              fit:
                                  BoxFit
                                      .cover, // Fixed: BoxFit should be capitalized
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: EdgeInsets.all(7),
                      margin: EdgeInsets.only(
                        left: 10,
                        right: 0,
                        top: 5,
                        bottom: 5,
                      ),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(14),
                            child: Image.network(
                              'https://picsum.photos/200/200',
                              fit:
                                  BoxFit
                                      .cover, // Fixed: BoxFit should be capitalized
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: EdgeInsets.all(7),
                      margin: EdgeInsets.only(
                        left: 10,
                        right: 0,
                        top: 5,
                        bottom: 5,
                      ),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(14),
                            child: Image.network(
                              'https://picsum.photos/200/200',
                              fit:
                                  BoxFit
                                      .cover, // Fixed: BoxFit should be capitalized
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      height: 200,
                      width: 300,
                      margin: EdgeInsets.all(10),
                      child: Icon(Icons.favorite_border_outlined, size: 33),
                    ),
                    Container(
                      height: 300,
                      width: 400,
                      child: Icon(
                        Icons.favorite,
                        size: 44,
                        color: Colors.pink[400],
                      ),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      child: IconButton(
                        icon: Icon(Icons.pause),
                        onPressed: () {},
                      ),
                    ),
                    Container(
                      height: 200,
                      width: 300,
                      margin: EdgeInsets.all(10),
                      child: Icon(Icons.favorite_border_outlined, size: 33),
                    ),
                    Container(
                      height: 300,
                      width: 400,
                      child: IconButton(
                        icon: Icon(Icons.restaurant_menu),
                        onPressed: () {},
                        color: Colors.pink[400],
                      ),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      height: 200,
                      width: 300,
                      margin: EdgeInsets.all(10),
                      child: Icon(Icons.favorite_border_outlined, size: 33),
                    ),
                    Container(
                      height: 300,
                      width: 400,
                      child: Icon(
                        Icons.favorite,
                        size: 44,
                        color: Colors.pink[400],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ); // Added missing closing parenthesis for Scaffold
  }
}
