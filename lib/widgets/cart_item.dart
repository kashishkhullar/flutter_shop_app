import 'package:flutter/material.dart';
import 'package:flutter_shop_app/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class CartItem extends StatelessWidget {
  final String id;
  final String productId;
  final double price;
  final int quantity;
  final String title;

  CartItem({this.id, this.title, this.price, this.quantity, this.productId});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context, listen: false);
    return Dismissible(
      key: ValueKey(id),
      background: Container(
        color: Colors.red,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        cart.removeItem(productId);
      },
      child: Card(
        child: Container(
          child: ListTile(
            leading: CircleAvatar(
              child: Padding(
                child: FittedBox(child: Text("\$${price}")),
                padding: EdgeInsets.all(5),
              ),
            ),
            title: Text("$title"),
            subtitle: Text("Total \$${price * quantity}"),
            trailing: Text("$quantity"),
          ),
        ),
      ),
    );
  }
}
