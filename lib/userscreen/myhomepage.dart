import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:com/adminScreen/admin_home.dart';
import 'package:com/tools/app_data.dart';
import 'package:com/tools/app_method.dart';
import 'package:com/tools/app_tools.dart';
import 'package:com/tools/firebase_method.dart';
import 'package:com/tools/store.dart';
import 'package:com/userscreen/aboutus.dart';

import 'package:com/userscreen/cart_screen.dart';
import 'package:com/userscreen/history.dart';
import 'package:com/userscreen/itemdetials.dart';
import 'package:com/userscreen/notifications.dart';
import 'package:com/userscreen/profile.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'favorites.dart';
import 'messages.dart';
import 'delivery.dart';
import 'history.dart';
import 'login.dart';


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  BuildContext context;
  String acctName = '';
  String acctEmail = '';
  String acctPhotoUrl = '';
  bool isLoggedIn;
  AppMethods appMethods = FirebaseMethods();
  Firestore firestore = Firestore.instance;




  @override
  void initState() {
    // TODO: implement initState
    getCurrentUser();
    super.initState();
  }

  Future getCurrentUser() async {
    await clearDataLocally();
    acctName = await getStringDataLocally(key: acctFullName);
    acctEmail = await getStringDataLocally(key: userEmail);
    acctPhotoUrl = await getStringDataLocally(key: photoUrl);
    isLoggedIn = await getBoolDataLocally(key: loggedIn);
    acctName == null ? acctName = 'Guest User' : acctName;
    acctEmail == null ? acctEmail = 'guestUser@gmail.com' : acctEmail;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: GestureDetector(
          onLongPress: openAdmin,
          child: Text(
            'gallery',
            style: TextStyle(color: Colors.white),
          ),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.favorite,
              color: Colors.white,
            ),
            onPressed:() {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return GalleryFavorits();
              }));
            }
          ),
          Stack(
            alignment: Alignment.topLeft,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.message,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return GalleryMessages();
                  }));
                },
              ),
              CircleAvatar(
                backgroundColor: Colors.red,
                radius: 10.0,
                child: Text(
                  '0',
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          )
        ],
      ),
      body:
      StreamBuilder<QuerySnapshot>(
        stream: firestore.collection(appProducts).snapshots(),
        builder: (context, snapshot) {


          if (!snapshot.hasData) {
            return Center(
                child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                Theme.of(context).primaryColor,
              ),
            ));

          }else {
            final int dataCount = snapshot.data.documents.length;
            print('data count $dataCount');
            if (dataCount == 0) {
             return  noDataFound();
            } else {
              return
                GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),

                  itemCount: dataCount,
                  itemBuilder: (context, index) {
                    final DocumentSnapshot document =
                    snapshot.data.documents[index];
                    return buildProducts(context, index, document);
                  });
            }
          }
        },
      ),
      floatingActionButton: Stack(
        alignment: Alignment.topLeft,
        children: <Widget>[
          FloatingActionButton(
            backgroundColor: Colors.brown,
            child: Icon(
              Icons.shopping_cart,
            ),
            onPressed: () {

            },
          ),
          CircleAvatar(
            child: Text('0'),
            backgroundColor: Colors.red,
            radius: 10.0,
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                UserAccountsDrawerHeader(
                  accountName: Text(
                    acctName,
                    style: TextStyle(fontSize: 15.0),
                  ),
                  accountEmail: Text(acctEmail),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.person,
                      color: Colors.brown,
                    ),
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return GalleryNotifications();
                    }));
                  },
                  leading: CircleAvatar(
                    backgroundColor: Colors.brown[700],
                    child: Icon(Icons.notifications),
                  ),
                  title: Text("Order Notifications"),
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return GalleryHistory();
                    }));
                  },
                  leading: CircleAvatar(
                    backgroundColor: Colors.brown[700],
                    child: Icon(Icons.history),
                  ),
                  title: Text("Order History "),
                ),
                Divider(
                  color: Colors.black,
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return GalleryProfile();
                    }));
                  },
                  leading: CircleAvatar(
                    backgroundColor: Colors.brown[700],
                    child: Icon(Icons.person),
                  ),
                  title: Text("Profile Notifications"),
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return GalleryDelivery();
                    }));
                  },
                  leading: CircleAvatar(
                    backgroundColor: Colors.brown[700],
                    child: Icon(Icons.home),
                  ),
                  title: Text("Delivery Home"),
                ),
                Divider(
                  color: Colors.black,
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return GalleryAboutUs();
                    }));
                  },
                  trailing: CircleAvatar(
                    backgroundColor: Colors.brown[700],
                    child: Icon(Icons.help),
                  ),
                  title: Text("About Us"),
                ),
                ListTile(
                  trailing: CircleAvatar(
                    backgroundColor: Colors.brown[700],
                    child: Icon(Icons.exit_to_app),
                  ),
                  title: Text(isLoggedIn == true ? 'Logout' : 'Login'),
                  onTap: checkIfLoggin,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  checkIfLoggin() async {
    if (isLoggedIn == false) {
      bool response =
          await Navigator.push(context, MaterialPageRoute(builder: (context) {
        return GalleryLogin();
      }));
      if (response == true) getCurrentUser();
      return;
    }
    bool response = await appMethods.logOutUser();
    if (response == true) getCurrentUser();
  }

  openAdmin() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return adminHome();
    }));
  }

  Widget noDataFound() {
    return Container(
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.find_in_page,
            color: Colors.black45,
            size: 80.0,
          ),
          Text(
            'Not Product avaliable yet',
            style: TextStyle(
              color: Colors.black45,
              fontSize: 20.0,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            'Please check back later',
            style: TextStyle(color: Colors.red, fontSize: 14.0),
          ),
        ],
      )),
    );
  }

  Widget buildProducts(
      BuildContext context, int index, DocumentSnapshot document) {
    List productImage = document[productImages] as List;


    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return ItemDetails(
            itemImage: productImage[0],
            itemImages: productImage,
            itemName: document[productTitle],
            itemSubName: document[productCat],
            itemRating: StoreItems[index].itemRating,
            itemPrice: document[productPrice],
            itemDescription: document[productDesc],
          );
        }));
      },
      child: Card(
        child: Stack(
          children: <Widget>[
            Stack(
              alignment: FractionalOffset.bottomCenter,
              children: <Widget>[
                Container(
                 decoration: BoxDecoration(
                    image:
                        DecorationImage(image: NetworkImage(productImage[0]),fit: BoxFit.cover),
                ),
                ),
                Container(
                  color: Colors.black.withAlpha(100),
                  height: 30.0,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "${document[productTitle]}....",
                          style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "N${StoreItems[index].itemPrice}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.redAccent,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Stack(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.star,
                              size: 20.0,
                            ),
                            Text('${StoreItems[index].itemRating}'),
                          ],
                        ),
                        height: 20.0,
                        width: 50.0,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(5.0),
                            bottomRight: Radius.circular(5.0),
                          ),
                        )),
                    Container(
                      child: IconButton(
                        icon: Icon(
                          Icons.favorite,
                          color: Colors.orange,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

}
