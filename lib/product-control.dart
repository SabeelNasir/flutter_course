import 'package:flutter/material.dart';

class ProductControl extends StatelessWidget {
  final Function addProduct;
  final int productCount;
  ProductControl(this.addProduct, this.productCount);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: RaisedButton(
              textColor: Colors.white,
              child: Text('Add Product'),
              onPressed: () {
                addProduct('Sweet Function');
              },
              color: Theme.of(context).primaryColor),
        ),
        Expanded(
          child: Text('Total Products : ' + productCount.toString(),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontWeight: FontWeight.bold)),
        )
      ],
    );
  }
}
