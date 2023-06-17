import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class WithdrawalScreen extends StatelessWidget {
  static const String routeName = '\WithdrawalScreen';
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
              'Withdrawal',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 36,
              ),
            ),
          ),
          Row(
            children: [
              _rowHeader('Name', 1),
              _rowHeader('Amount', 1),
              _rowHeader('Bank Name', 2),
              _rowHeader('Bank ACCOUNT', 2),
              _rowHeader('Email', 1),
              _rowHeader('pHONE', 1),
            ],
          )
        ],
      ),
    );
  }
}
