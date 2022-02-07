import 'package:flutter/material.dart';

class MasjidlarPage extends StatelessWidget {
  const MasjidlarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Masjidlar",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: const Center(
        child: Text(
          "Bu sahifa dasturlash jarayonida!",
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
