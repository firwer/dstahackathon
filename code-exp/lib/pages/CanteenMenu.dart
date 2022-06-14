import 'package:flutter/material.dart';
import '../Dish_Catergory.dart';
import 'CanteenCart.dart';

class Menu extends StatefulWidget {
  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  List<Dish> _dishes = [];

  List<Dish> _cartList = [];

  @override
  void initState() {
    super.initState();
    _populateDishes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
        backgroundColor: Color(0XFF4d7753),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 16.0, top: 8.0),
            child: GestureDetector(
              child: Stack(
                alignment: Alignment.topCenter,
                children: <Widget>[
                  Icon(
                    Icons.shopping_cart,
                    size: 36.0,
                  ),
                  if (_cartList.length > 0)
                    Padding(
                      padding: const EdgeInsets.only(left: 2.0),
                      child: CircleAvatar(
                        radius: 8.0,
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        child: Text(
                          _cartList.length.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12.0,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              onTap: () {
                if (_cartList.isNotEmpty)
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Cart(_cartList),
                    ),
                  );
              },
            ),
          )
        ],
      ),
      body: _buildGridView(),
    );
  }

  ListView _buildListView() {
    return ListView.builder(
      itemCount: _dishes.length,
      itemBuilder: (context, index) {
        var item = _dishes[index];
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8.0,
            vertical: 2.0,
          ),
          child: Card(
            elevation: 4.0,
            child: ListTile(
              leading: Icon(
                item.icon,
                color: item.color,
              ),
              title: Text(item.name),
              trailing: GestureDetector(
                child: (!_cartList.contains(item))
                    ? Icon(
                        Icons.add_circle,
                        color: Colors.green,
                      )
                    : Icon(
                        Icons.remove_circle,
                        color: Colors.red,
                      ),
                onTap: () {
                  setState(() {
                    if (!_cartList.contains(item))
                      _cartList.add(item);
                    else
                      _cartList.remove(item);
                  });
                },
              ),
            ),
          ),
        );
      },
    );
  }

  GridView _buildGridView() {
    return GridView.builder(
        padding: const EdgeInsets.all(4.0),
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: _dishes.length,
        itemBuilder: (context, index) {
          var item = _dishes[index];
          return Card(
              elevation: 4.0,
              child: Stack(
                fit: StackFit.loose,
                alignment: Alignment.center,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        item.icon,
                        color: (_cartList.contains(item))
                            ? Colors.grey
                            : item.color,
                        size: 100.0,
                      ),
                      Text(
                        item.name,
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        '\$' + item.price.toString(),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 8.0,
                      bottom: 8.0,
                    ),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: GestureDetector(
                        child: (!_cartList.contains(item))
                            ? Icon(
                                Icons.add_circle,
                                color: Colors.green,
                              )
                            : Icon(
                                Icons.remove_circle,
                                color: Colors.red,
                              ),
                        onTap: () {
                          setState(() {
                            if (!_cartList.contains(item))
                              _cartList.add(item);
                            else
                              _cartList.remove(item);
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ));
        });
  }

  void _populateDishes() {
    var list = <Dish>[
      Dish(
        name: 'Chicken Burger ',
        price: 2.50,
        icon: Icons.fastfood,
        color: Colors.amber,
      ),
      Dish(
        name: 'Mango Slushie',
        price: 2.00,
        icon: Icons.local_drink,
        color: Colors.deepOrange,
      ),
      Dish(
        name: 'Mix Vegetable Rice',
        price: 3.50,
        icon: Icons.rice_bowl,
        color: Colors.brown,
      ),
      Dish(
        name: 'Western Cuisine',
        price: 4.00,
        icon: Icons.restaurant,
        color: Colors.green,
      ),
    ];

    setState(() {
      _dishes = list;
    });
  }
}
