import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

class ProductListWidget extends StatefulWidget {
  @override
  _ProductListWidgetState createState() => _ProductListWidgetState();
}

class _ProductListWidgetState extends State<ProductListWidget> {
  final Stream<QuerySnapshot<Map<String, dynamic>>> _orderStream =
      FirebaseFirestore.instance.collection('products').snapshots();

  Widget vendorData(Widget widget, int? flex) {
    return Expanded(
      flex: flex!,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: widget,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: _orderStream,
      builder: (BuildContext context,
          AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text('Something went wrong'));
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        return Container(
          height: 500,
          child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: snapshot.data!.docs.length,
            itemBuilder: ((context, index) {
              final order = snapshot.data!.docs[index].data();
              final imageUrl = order['imageUrl'] ?? '';
              final productName = order['productName'] ?? '';
              final productPrice = order['productPrice'] ?? '';
              final quantity = order['quantity'] ?? '';

              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  vendorData(
                    Container(
                      height: 50,
                      width: 50,
                      child: imageUrl.isNotEmpty
                          ? Image.network(
                              imageUrl[0],
                              width: 50,
                              height: 50,
                            )
                          : Container(), // Show an empty container if imageUrl is empty
                    ),
                    1,
                  ),
                  vendorData(
                    Text(
                      productName,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    3,
                  ),
                  vendorData(
                    Text(
                      "\$" + ' ' + productPrice.toString(),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    2,
                  ),
                  vendorData(
                    Text(
                      order['quantity'].toString(),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    2,
                  ),
                  vendorData(
                    ElevatedButton(
                      onPressed: () async {},
                      child: Text(
                        'Reject',
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.bold),
                      ),
                    ),
                    1,
                  ),
                  vendorData(
                    ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'View More',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    1,
                  ),
                ],
              );
            }),
          ),
        );
      },
    );
  }
}
