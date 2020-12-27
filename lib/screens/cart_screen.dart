import 'package:flutter/material.dart';
import 'package:flutter_shop_app/providers/cart_provider.dart'
    show CartProvider;
import 'package:flutter_shop_app/widgets/cart_item.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  static final String routeName = "/cart-screen";

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Shopping Cart"),
      ),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total",
                    style: TextStyle(fontSize: 20),
                  ),
                  Spacer(),
                  SizedBox(width: 10),
                  Chip(
                    label: Text("\$${cart?.totalAmount}"),
                  ),
                  FlatButton(onPressed: () {}, child: Text("Place Order"))
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return CartItem(
                  id: cart.itemList[index].id,
                  title: cart.itemList[index].title,
                  quantity: cart.itemList[index].quantity,
                  price: cart.itemList[index].price,
                  productId: cart.items.keys.toList()[index],
                );
              },
              itemCount: cart.items.length,
            ),
          )
        ],
      ),
    );
  }
}
