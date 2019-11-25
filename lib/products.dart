import 'package:flutter/material.dart';

class Products extends StatelessWidget {
  final List<String>
      products; // this tells the value of products will never change here
  Products([this.products = const []]);
  Widget build(BuildContext context) {
    return Column(
      children: products
          .map((element) => Card(
                margin: EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Image.asset('assets/images/03.jpg'),
                    Text(element),
                    ButtonBar(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            deleteProduct(products.indexOf(element), context);
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.favorite),
                          onPressed: () {},
                        )
                      ],
                    )
                  ],
                ),
              ))
          .toList(),
    );
  }

  void deleteProduct(int productIndex, BuildContext context) {
    Scaffold.of(context).showSnackBar(
        SnackBarShow('$productIndex-Product Deleted !').showSnackBar(context));
  }
}

class SnackBarShow {
  final customMessage;
  SnackBarShow(this.customMessage);
  SnackBar showSnackBar(BuildContext context) {
    return SnackBar(
      content: Text(customMessage),
      action: SnackBarAction(
        label: 'Close',
        onPressed: () {
          // Some code to undo the change.
          Scaffold.of(context).hideCurrentSnackBar();
        },
      ),
    );
  }
}
