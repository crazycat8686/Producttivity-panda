import 'package:flutter/material.dart';

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
