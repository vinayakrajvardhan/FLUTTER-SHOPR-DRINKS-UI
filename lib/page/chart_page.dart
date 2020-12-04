import 'package:flutter/material.dart';
import '../model/cart_item.dart';
import '../provider/shop_provider.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 30.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Cart',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32.0,
                    color: Colors.white,
                  ),
                ),
                FlatButton(
                  onPressed: () {},
                  child: Text(
                    'Clear Cart',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(
                child: buildCardItems(context),
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
                Text(
                  '\$ 80',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    fontSize: 38.0,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 24.0,
            ),
            Container(
              height: 50,
              width: double.infinity,
              child: RaisedButton(
                color: Theme.of(context).primaryColor,
                shape: StadiumBorder(),
                child: Text(
                  'Next',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCardItems(BuildContext context) {
    final provider = Provider.of<ShopProvider>(context);
    if (provider.items.isEmpty) {
      return Center(
        child: Text(
          'Card is Empty',
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
      );
    } else {
      return ListView(
        children: provider.items.values.map(buildCartItem).toList(),
      );
    }
  }

  Widget buildCartItem(CartItem cardItem) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(cardItem.imgUrl),
      ),
      title: Row(
        children: [
          Text(
            '${cardItem.quantity}x',
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(
            width: 10.0,
          ),
          Expanded(
            child: Text(
              cardItem.title,
              style: TextStyle(color: Colors.white, fontSize: 20.0),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        ],
      ),
      trailing: Text(
        '\$${cardItem.price}',
        style: TextStyle(color: Colors.white, fontSize: 20.0),
      ),
    );
  }
}
