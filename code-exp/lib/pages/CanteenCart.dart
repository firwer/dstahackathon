import 'package:flutter/material.dart';
import '../Dish_Catergory.dart';

class Cart extends StatefulWidget {
  final List<Dish> _cart;

  Cart(this._cart);

  @override
  _CartState createState() => _CartState(this._cart);
}

class _CartState extends State<Cart> {
  _CartState(this._cart);

  List<Dish> _cart;

  @override
  Widget build(BuildContext context) {
    double cost = 0;
    for (var i = 0; i < _cart.length; i++) {
      cost += _cart[i].price;
      print(cost);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        actions: [
          ElevatedButton(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Colors.orangeAccent)),
            onPressed: (() => {}),
            child: Text(
              'Payment:' + ' \$' + cost.toString(),
              style: TextStyle(
                  color: Color(0XFF4d7753), fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
      body: ListView.builder(
          itemCount: _cart.length,
          itemBuilder: (context, index) {
            var item = _cart[index];

            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
              child: Card(
                elevation: 4.0,
                child: ListTile(
                  leading: Icon(
                    item.icon,
                    color: item.color,
                  ),
                  title: Text(item.name + ' ' + '\$' + item.price.toString()),
                  trailing: GestureDetector(
                      child: Icon(
                        Icons.remove_circle,
                        color: Colors.red,
                      ),
                      onTap: () {
                        setState(() {
                          _cart.remove(item);
                        });
                      }),
                ),
              ),
            );
          }),
    );
  }
}
