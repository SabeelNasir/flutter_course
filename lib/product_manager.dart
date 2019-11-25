import 'package:flutter/material.dart';
import './products.dart';
import './product-control.dart';
import './users/get-users.dart';

class ProductManager extends StatefulWidget {
  String startingProduct;
  ProductManager({this.startingProduct = 'Sweets Tester'});
  @override
  State<StatefulWidget> createState() {
    return _ProductManagerState();
  }
}

class _ProductManagerState extends State<ProductManager> {
  List<String> _products = [];
  @override
  //lifecycle hook
  void initState() {
    _products.add(widget.startingProduct);
    super.initState();
  }

  @override
  void didUpdateWidget(ProductManager oldWidget) {
    print('[ProductManager State] didUpdateWidget()');
    super.didUpdateWidget(oldWidget);
  }

  void _addProduct(product) {
    setState(() {
      _products.add(product);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(8),
      children: <Widget>[
        // Container(
        //   margin: EdgeInsets.all(10.0), //margin in all directions
        //   child: ProductControl(_addProduct),
        // ),
        Container(
          width: double.infinity,
          child: RaisedButton(
            child: Text('Users'),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => GetUsers()));
            },
          ),
        ),
        ProductControl(_addProduct, _products.length),
        Products(_products),
      ],
    );
  }
}
