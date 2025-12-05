import 'package:flutter/material.dart';

class ListviewPage extends StatelessWidget {
  const ListviewPage({super.key});

  Widget _buildContainers(String text) {
    return Container(
      height: 50,
      width: 200,
      color: Colors.red,
      margin: EdgeInsets.all(16),
      child: Center(child: Text(text)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:

          ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 1000,
            itemBuilder: (BuildContext context, int index) {
              print("MOSTRANDO: $index");
              return _buildContainers(index.toString());
            },
          ),

    );
  }
}