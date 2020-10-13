import 'package:com/adminScreen/add_products.dart';
import 'package:com/adminScreen/app_messages.dart';
import 'package:com/adminScreen/app_orders.dart';
import 'package:com/adminScreen/app_products.dart';
import 'package:com/adminScreen/app_users.dart';
import 'package:com/adminScreen/order_history.dart';
import 'package:com/adminScreen/privilages.dart';
import 'package:com/adminScreen/search_data.dart';
import 'package:flutter/material.dart';

class adminHome extends StatefulWidget {
  @override
  _adminHomeState createState() => _adminHomeState();
}

class _adminHomeState extends State<adminHome> {
  Size screenSize;
  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text('ADMIN PAGE'),
        centerTitle: true,
        elevation: 0.0,
      ),
      endDrawer: Container(
        width: screenSize.width - 20,
        color: Colors.white,
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(
                'App Admin',
                style: TextStyle(fontSize: 15.0),
              ),
              accountEmail: Text('support@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return SearchData();
                    }));
                  },
                  child: CircleAvatar(backgroundColor: Colors.brown[700],
                    maxRadius: 70.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Search Data'),
                        SizedBox(
                          height: 10.0,
                        ),
                        Icon(Icons.search),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return AppUsers();
                    }));
                  },
                  child: CircleAvatar(backgroundColor: Colors.brown[700],
                    maxRadius: 70.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('App Users'),
                        SizedBox(
                          height: 10.0,
                        ),
                        Icon(Icons.person),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return AppOrders();
                    }));
                  },
                  child: CircleAvatar(backgroundColor: Colors.brown[700],
                    maxRadius: 70.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('App Orders'),
                        SizedBox(
                          height: 10.0,
                        ),
                        Icon(Icons.notifications),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return AppMessages();
                    }));
                  },
                  child: CircleAvatar(backgroundColor: Colors.brown[700],
                    maxRadius: 70.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('App Messages'),
                        SizedBox(
                          height: 10.0,
                        ),
                        Icon(Icons.message),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return AppProducts();
                    }));
                  },
                  child: CircleAvatar(backgroundColor: Colors.brown[700],
                    maxRadius: 70.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('App Products'),
                        SizedBox(
                          height: 10.0,
                        ),
                        Icon(Icons.shop),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return AddProducts();
                    }));
                  },
                  child: CircleAvatar(backgroundColor: Colors.brown[700],
                    maxRadius: 70.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Add Products'),
                        SizedBox(
                          height: 10.0,
                        ),
                        Icon(Icons.add),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return OrderHistory();
                    }));
                  },
                  child: CircleAvatar(backgroundColor: Colors.brown[700],
                    maxRadius: 70.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Order History'),
                        SizedBox(
                          height: 10.0,
                        ),
                        Icon(Icons.history),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Privilages();
                    }));
                  },
                  child: CircleAvatar(backgroundColor: Colors.brown[700],
                    maxRadius: 70.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Privilages'),
                        SizedBox(
                          height: 10.0,
                        ),
                        Icon(Icons.person),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
