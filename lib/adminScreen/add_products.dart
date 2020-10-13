import 'dart:async';
import 'dart:io';

import 'package:com/tools/app_data.dart';
import 'package:com/tools/app_method.dart';
import 'package:com/tools/firebase_method.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:com/tools/app_tools.dart';
import 'package:image_picker/image_picker.dart';

class AddProducts extends StatefulWidget {
  @override
  _AddProductsState createState() => _AddProductsState();
}

class _AddProductsState extends State<AddProducts> {


  List<File> imageList;
  List<DropdownMenuItem<String>> dropDownColor;
  String _selectedColor;
  List<String> colorList = List();

  List<DropdownMenuItem<String>> dropDownSizes;
  String _selectedSize;
  List<String> sizeList = List();

  List<DropdownMenuItem<String>> dropDownCategory;
  String _selectedCategory;
  List<String> categoryList = List();




  TextEditingController productTitleController = TextEditingController();
  TextEditingController productPriceController = TextEditingController();
  TextEditingController productDescController = TextEditingController();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  BuildContext context;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    colorList = List.from(localColors);
    sizeList = List.from(localSizes);
    categoryList = List.from(localCategory);
    dropDownColor = buildAndGetDropDownItems(colorList);
    dropDownSizes = buildAndGetDropDownItems(sizeList);
    dropDownCategory = buildAndGetDropDownItems(categoryList);

    _selectedColor = dropDownColor[0].value;
    _selectedCategory = dropDownCategory[0].value;

    _selectedSize = dropDownSizes[0].value;

  }

  @override
  Widget build(BuildContext context) {this.context=context;
    return Scaffold(key: scaffoldKey,
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        centerTitle: false,
        title: Text('AddProducts'),
        elevation: 0.0,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RaisedButton.icon(
              onPressed: () {
                pickImage();
              },
              icon: Icon(
                Icons.add,
                color: Colors.white,
              ),
              label: Text(
                'Add Image',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.orange,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(15.0),
                ),
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 10.0,
            ),
            MultiImagePickerList(
                imageList: imageList,
                removeNewImage: (index) {return
                  removeImage(index);
                }),
            SizedBox(
              height: 10.0,
            ),
            productTextField(
                textTitle: 'Product Title',
                textHint: 'Enter Product Title',
                controller: productTitleController),
            SizedBox(
              height: 10.0,
            ),
            productTextField(
                textTitle: 'Product Price',textType: TextInputType.number,
                textHint: 'EnterProduct Price ',
                controller: productPriceController),
            SizedBox(
              height: 10.0,
            ),
            productTextField(
                textTitle: 'Product Description',
                textHint: 'Enter Description',
                maxLine: 4,
                controller: productDescController,
                height: 100),
            SizedBox(
              height: 10.0,
            ),
            productDropDown(
                textTitle: 'Product Category',
                selectedItem: _selectedCategory,
                dropDownItems: dropDownCategory,
                changedDropDownItems: changedDropDownCategory),
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                productDropDown(
                    textTitle: 'Color',
                    selectedItem: _selectedColor,
                    dropDownItems: dropDownColor,
                    changedDropDownItems: changedDropDownColor),
                productDropDown(
                    textTitle: 'Size',
                    selectedItem: _selectedSize,
                    dropDownItems: dropDownSizes,
                    changedDropDownItems: changedDropDownSize),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            appButton(
                onbtnLicked: (){addNewProducts();},
                btnText: 'ADD PRODUCT',
                btnColor: Colors.white,
                btnPadding: 18),
          ],
        ),
      ),
    );
  }

  void changedDropDownColor(String selectedColor) {
    setState(() {
      _selectedColor = selectedColor;
      print(selectedColor);
    });
  }

  void changedDropDownSize(String selectedSize) {
    setState(() {
      _selectedSize = selectedSize;
      print(selectedSize);
    });
  }

  void changedDropDownCategory(String selecteCategory) {
    setState(() {
      _selectedCategory = selecteCategory;
      print(_selectedCategory);
    });
  }

 void pickImage() async {
    var file = await ImagePicker.pickImage(source: ImageSource.gallery);

    if (file != null) {
      List<File> imageFile = List();
      imageFile.add(file);
      if (imageList == null) {
        imageList = List.from(imageFile, growable: true);
      } else {
        for (int s = 0; s < imageFile.length; s++) {
          imageList.add(file);
        }
      }
      setState(() {

      });
    }
  }

  removeImage(int index) async {
    imageList.removeAt(index);
    setState(() {});
  }
  AppMethods appMethod = FirebaseMethods();


  addNewProducts()async{
    if(imageList==null||imageList.isEmpty){
      showSnackBar('Product Image can\t be empty', scaffoldKey);
      return;
    }
    if(productTitleController.text==''){
      showSnackBar('Product Title can\'t be empty', scaffoldKey);
      return;
    }
    if(productPriceController.text==''){
      showSnackBar('product Price can\'t be empty', scaffoldKey);
      return;
    }
    if(productDescController.text==''){
      showSnackBar('product Description can\'t be empty', scaffoldKey);
      return;
    }
    if(_selectedCategory=='Select a Category'){
      showSnackBar('Please Select a category ', scaffoldKey);
      return;
    }
    if(_selectedColor=='Select a color'){
      showSnackBar('Please Select a Color ', scaffoldKey);
      return;
    }
    if(_selectedSize=='Select a size'){
      showSnackBar('Please Select a Size ', scaffoldKey);
      return;
    }
    //show the progress dialog
    displayProgressDialog(context);

    Map<String,dynamic> newProduct={
      productTitle:productTitleController.text,
      productPrice:productPriceController.text,
      productDesc:productDescController.text,
      productCat:_selectedCategory,
      productColor:_selectedColor,
      productSize:_selectedSize,
    };

    //adding the information to firebase
    String productID= await appMethod.addNewProduct(newProduct:newProduct);
     //now time to upload images to firebase storage
    List<String>imageURL=await appMethod.uploadProductImages(docID: productID,imageList: imageList);
    //check if an error occurred while adding image to firebase storage if error occurs terminate!
    if (imageURL.contains(error)){
      closeProgressDialog(context);
      showSnackBar('Images Upload Error ,contact developer', scaffoldKey);
      return;
    }
    //update the information after uploading image file to the storage
    bool result=await appMethod.updateProductImages(docID: productID,data: imageURL);
    if (result!=null||result==true){
      closeProgressDialog(context);
      resetEverything();
      showSnackBar('Product added successfully', scaffoldKey);
    }else{
      closeProgressDialog(context);
      showSnackBar('An error occurred contact developer', scaffoldKey);
    }
  }

  void resetEverything() {
    imageList.clear();
    productTitleController.text ='';
    productPriceController.text='';
    productDescController.text='';
    _selectedSize='Select a size';
    _selectedColor='Select a color';
    _selectedCategory='Select a Category';
setState(() {
});
  }

}

