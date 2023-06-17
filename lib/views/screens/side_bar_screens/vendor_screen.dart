import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class VendorScreen extends StatelessWidget {
  static const String routeName = '\VendorScreen';
  Widget _rowHeader(String text, int flex) {
    return Expanded(
        flex: flex,
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black), color: Colors.yellow),
          child: Text(
            text,
            style: TextStyle(color: Colors.black),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.all(10),
            child: const Text(
              'Manage Vendos',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 36,
              ),
            ),
          ),
          Row(
            children: [
              _rowHeader('Logo', 1),
              _rowHeader('BUSINESS NAME', 3),
              _rowHeader('CITY', 1),
              _rowHeader('STATE', 2),
              _rowHeader('ACTION', 2),
              _rowHeader('VIEW MORE', 1),
            ],
          )
        ],
      ),
    );
  }
}
