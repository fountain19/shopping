import 'package:com/userscreen/cart_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:com/userscreen/cart.dart';
import 'package:provider/provider.dart';
import '../userscreen/cart.dart';

class ItemDetails extends StatefulWidget with ChangeNotifier{
  String itemName;
  String itemPrice;
  String itemImage;
  String itemSubName;
  String itemDescription;
  List itemImages;
  double itemRating;
  final String id;
  ItemDetails({this.itemRating, this.itemImage, this.itemImages,this.itemPrice, this.itemName, this.itemSubName,this.itemDescription,this.id});
  @override
  _ItemDetailsState createState() => _ItemDetailsState();

}

class _ItemDetailsState extends State<ItemDetails> {

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;



    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade300,
        title: Text('ItemDetails'),
        centerTitle: false,
        iconTheme: IconThemeData(
          color: Colors.orange,
        ),
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          Container(
            height: 300,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    widget.itemImage,
                  ),
                  fit: BoxFit.fitHeight,
                ),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(120.0),
                  bottomLeft: Radius.circular(120.0),
                )),
          ),
          Container(
            height: 300,
            decoration: BoxDecoration(
                color: Colors.grey.withAlpha(50),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(120.0),
                  bottomLeft: Radius.circular(120.0),
                )),
          ),
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 200.0,
                ),
                Card(
                  child: Container(
                    width: screenSize.width,
                    margin: EdgeInsets.only(left: 20.0, right: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(widget.itemName),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(widget.itemSubName),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Icon(
                                  Icons.star,
                                  color: Colors.blue,
                                  size: 20.0,
                                ),
                                Text("${widget.itemRating}"),
                              ],
                            ),
                            Text(
                              'N${widget.itemPrice}',
                              style: TextStyle(color: Colors.red),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Container(
                    height: 150.0,
                    width: screenSize.width,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.itemImages.length,
                      itemBuilder: (context, index) {
                        return Stack(
                          alignment: Alignment.center,
                          children: <Widget>[
                            Container(
                              height: 140,
                              width: 100,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                image: NetworkImage(widget.itemImage),
                              )),
                            ),
                            Container(
                              height: 140,
                              width: 100,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                image: NetworkImage(widget.itemImage),
                              )),
                            ),
                            Container(
                              height: 140,
                              width: 100,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                image: NetworkImage(widget.itemImage),
                              )),
                            ),
                            Container(
                              height: 140,
                              width: 100,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                image: NetworkImage(widget.itemImage),
                              )),
                            ),
                            Container(
                              height: 140,
                              width: 100,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                image: NetworkImage(widget.itemImages[index]),
                              )),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
                Card(
                  child: Container(
                    width: screenSize.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          'Description',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(widget.itemDescription),
                        SizedBox(
                          height: 10.0,
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Container(
                    width: screenSize.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 10.0),
                        Text(
                          'Colors',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        SizedBox(
                          height: 50.0,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 4,
                              itemBuilder: (context, index) {
                                return Stack(
                                  alignment: Alignment.center,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ChoiceChip(
                                        selected: false,
                                        label: Text('color ${index}'),
                                      ),
                                    ),
                                  ],
                                );
                              }),
                        ),
                        Text(
                          'Size',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        SizedBox(
                          height: 50.0,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 4,
                              itemBuilder: (context, index) {
                                return Stack(
                                  alignment: Alignment.center,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ChoiceChip(
                                        selected: false,
                                        label: Text('size ${index}'),
                                      ),
                                    ),
                                  ],
                                );
                              }),
                        ),
                    Text(
                      'Size',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10.0,),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          CircleAvatar(child: Icon(Icons.remove,),backgroundColor: Colors.orangeAccent,),
                          Text('0'),
                          CircleAvatar(child: Icon(Icons.add),backgroundColor: Colors.deepOrange,),
                        ],),
                        SizedBox(height: 20,),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: Stack(
        alignment: Alignment.topLeft,
        children: <Widget>[
          FloatingActionButton(
            backgroundColor: Colors.brown,
            child: Icon(Icons.shopping_cart),
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.green,
        shape: CircularNotchedRectangle(),
        notchMargin: 5,
        child: Container(
          height: 50.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                width: (screenSize.width - 20) / 2,
                child: Text(
                  "Add To Favorites",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              FlatButton(padding: EdgeInsets.all(8),onPressed: (){

              },
                
                child: Container(
                  width: (screenSize.width - 20) / 2,
                  child: Text(
                    "Order Now",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );

  }

}

