import 'package:animate_do/animate_do.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:path/path.dart';
import 'dart:io';
import 'dart:math';

import 'package:razza_app/View/Desgin/cards.dart';
import 'package:razza_app/View/Desgin/secShimmer.dart';
import 'package:razza_app/View/Desgin/shimerScreen.dart';
import 'package:razza_app/View/Screens/User_Screens/orders.dart';

import '../View/Desgin/cateLoading.dart';
import '../View/Desgin/emptyCart.dart';
import '../View/Desgin/loding.dart';
import '../View/Desgin/lottie.dart';
import '../View/Screens/User_Screens/cart.dart';

class DB {
  addUsers(email, userName, uid) async {
    FirebaseFirestore.instance
        .collection('users')
        .add({'name': userName, 'email': email, 'UID': uid, 'Role': 'User'});
  }

  late File file;
  var imageURL;
  var imagePicker = ImagePicker();
  var imageName;
  var selectedImage;

  Future uploadeImage(type) async {
    selectedImage = await imagePicker.pickImage(
        source: type == false ? ImageSource.camera : ImageSource.gallery);

    if (selectedImage != null) {
      file = File(selectedImage.path);
      imageName = basename(selectedImage.path);
    } else {
      print('Not Selected Image');
    }
  }

  // ADD PRODUCTS
  addProducts(productname, price, cate, color, desc) async {
    var random = Random().nextInt(100000);
    var refImage = FirebaseStorage.instance
        .ref('ProductImgs/Product_' + random.toString() + DateTime.now().toString());
    await refImage.putFile(file);
    imageURL = await refImage.getDownloadURL();
    String id = '1' + Random().nextInt(999).toString();

    FirebaseFirestore.instance.collection('Products').add({
      'itemID': id,
      'name': productname,
      'price': int.parse(price),
      'category': cate,
      'color': color,
      'description': desc,
      'image': imageURL,
    });

    // print(id + 1);
    // print(price.toString());
    // print(cate);
    // print(color);
    // print(desc);
    // print(imageURL);
  }

  Future<dynamic> isAdmin(UID) async {
    dynamic role = '';
    if (UID != null) {
      await FirebaseFirestore.instance
          .collection('users')
          .where('UID', isEqualTo: UID)
          .get()
          .then((QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach((doc) {
          role = doc['Role'];
        });
      });
    }
    return role;
  }

  var user = FirebaseAuth.instance.currentUser;
  CollectionReference ref = FirebaseFirestore.instance.collection('users');

  Future imageUser(type) async {
    var selectedImage = await imagePicker.pickImage(
        source: type == false ? ImageSource.camera : ImageSource.gallery);

    if (selectedImage != null) {
      file = File(selectedImage.path);
      imageName = basename(selectedImage.path);
    } else {
      print('Not Selected Image');
    }

    var refImage = FirebaseStorage.instance
        .ref('UserProfiles/user_' + DateTime.now().toString());
    await refImage.putFile(file);
    imageURL = await refImage.getDownloadURL();

    updateImage();
  }

  updateImage() async {
    FirebaseFirestore.instance
        .collection('users')
        .where('UID', isEqualTo: user!.uid)
        .get()
        .then((value) => value.docs.forEach((element) {
              FirebaseFirestore.instance
                  .collection('users')
                  .doc(element.id)
                  .set({'Avatar': imageURL}, SetOptions(merge: true));
            }));
  }

  var productCollection = FirebaseFirestore.instance.collection('Products');

  List productList = [];

  Cards show = Cards();
  showCateProduct(cate, cateScreen) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.70,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      itemCount: productList.length,
      itemBuilder: (context, i) {
        if (productList.isNotEmpty) {
          return cate == productList[i]['category'] && cate != null
              ? show.catePage(
                  cateScreen,
                  '0',
                  productList[i]['itemID'].toString(),
                  productList[i]['image'],
                  productList[i]['name'],
                  productList[i]['price'],
                  productList[i]['category'],
                  productList[i]['color'],
                  productList[i]['description'],
                )
              : Container();
        }
        if (ConnectionState == ConnectionState.waiting) {
          return ImageLoading();
        } else {
          return Container();
        }
      },
    );

    // FutureBuilder<QuerySnapshot>(
    //   future: productCollection.get(),
    //   builder: (context, snapshot) {
    //     if (snapshot.hasData) {
    //       return GridView.builder(
    //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //           crossAxisCount: 2,
    //           childAspectRatio: 0.70,
    //           crossAxisSpacing: 20,
    //           mainAxisSpacing: 20,
    //         ),
    //         itemCount: snapshot.data!.docs.length,
    //         itemBuilder: (context, i) {
    //           return cate == snapshot.data!.docs[i]['category'] && cate != null
    //               ? show.catePage(
    //                   cateScreen,
    //                   snapshot.data!.docs[i].id,
    //                   snapshot.data!.docs[i]['itemID'].toString(),
    //                   snapshot.data!.docs[i]['image'],
    //                   snapshot.data!.docs[i]['name'],
    //                   snapshot.data!.docs[i]['price'],
    //                   snapshot.data!.docs[i]['category'],
    //                   snapshot.data!.docs[i]['color'],
    //                   snapshot.data!.docs[i]['description'],
    //                 )
    //               : Container();
    //         },
    //       );
    //     }
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return ImageLoading();
    //     } else {
    //       return Container();
    //     }
    //   },
    // );
  }

  // // Add to Cart
  addToCart(itemID, image, name, cate, price, quantity) async {
    FirebaseFirestore.instance.collection('cart').add({
      'UID': user!.uid,
      'itemID': itemID,
      'image': image,
      'name': name,
      'cate': cate,
      'price': price,
      'quantity': quantity,
    });
  }

  CollectionReference cartCollection =
      FirebaseFirestore.instance.collection('cart');

  showCart(UID) {
    return StreamBuilder<QuerySnapshot>(
      stream: cartCollection.snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data != null) {
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, i) {
              return snapshot.data!.docs[i]['UID'] == UID
                  ? CartDesign(
                      elementID: snapshot.data!.docs[i].id,
                      prodID: snapshot.data!.docs[i]['itemID'],
                      image: snapshot.data!.docs[i]['image'],
                      title: snapshot.data!.docs[i]['name'],
                      cate: snapshot.data!.docs[i]['cate'],
                      price: snapshot.data!.docs[i]['price'].toString(),
                      quantity: snapshot.data!.docs[i]['quantity'].toString(),
                    )
                  : Container();
            },
          );
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return LoadingListPage();
        } else if (snapshot.hasData == false) {
          return EmptyScreen();
        } else {
          return Container(
            height: 110,
            width: 110,
            child: Text('dgvfd'),
          );
        }
      },
    );
  }

  deleteFromCart(elementID) async {
    await cartCollection.doc(elementID).delete();
  }

  Cards cards = Cards();

  showProdforAdmin(ctx) {
    return StreamBuilder<QuerySnapshot>(
      stream: productCollection.snapshots(),
      builder: (ctx, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (ctx, i) {
              return cards.showManagement(
                ctx,
                snapshot.data!.docs[i].id,
                snapshot.data!.docs[i]['itemID'],
                snapshot.data!.docs[i]['name'],
                snapshot.data!.docs[i]['image'],
                snapshot.data!.docs[i]['price'],
                snapshot.data!.docs[i]['category'],
                snapshot.data!.docs[i]['description'],
                snapshot.data!.docs[i]['color'],
              );
            },
          );
        }
        if (ConnectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else {
          return LoadingListPage();
        }
      },
    );
  }

  CollectionReference prodColl =
      FirebaseFirestore.instance.collection('Products');

  deleteProduct(elementID) async {
    await prodColl.doc(elementID).delete();
  }

  updateProduct(elementID, name, cate, color, price, desc, image) async {
    if (selectedImage != null) {
      var random = Random().nextInt(100000);
      var refImage = FirebaseStorage.instance
          .ref('ProductImgs/Product_' + random.toString());
      await refImage.putFile(file);
      imageURL = await refImage.getDownloadURL();
    }

    await productCollection.doc(elementID).update({
      'name': name,
      'price': int.tryParse(price),
      'category': cate,
      'color': color,
      'description': desc,
      'image': selectedImage == null ? image : imageURL,
    });
  }

  addToHistory(UID, wholeTotal, total, tax, itemCount) async {
    DateTime dateTime = DateTime.now();
    var orderNO = 'NSAEB00' + Random().nextInt(111111111).toString();
    FirebaseFirestore.instance.collection('history').add({
      'UID': UID,
      'DT': dateTime,
      'Total': wholeTotal,
      'OrderNO': orderNO,
      'CountOfitems': itemCount,
    });

    addToOrders(UID, wholeTotal, total, tax, dateTime, orderNO);
  }

  addToOrders(UID, wholeTotal, total, tax, dateTime, orderNO) async {
    // var title, cate, price, quantity;

    cartCollection
        .where('UID', isEqualTo: UID)
        .get()
        .then((value) => value.docs.forEach((element) {
              FirebaseFirestore.instance.collection('orders').add({
                'UID': UID,
                'email': user!.email,
                'DT': dateTime,
                'orderNO': orderNO,
                'name': element['name'],
                'cate': element['cate'],
                'price': element['price'],
                'quantity': element['quantity'],
                'image': element['image'],
                'total': total,
                'tax': tax,
                'wholeTotal': wholeTotal,
              });
            }));

    removeAllCart(UID);
  }

  removeAllCart(UID) async {
    cartCollection
        .where('UID', isEqualTo: UID)
        .get()
        .then((value) => value.docs.forEach((element) {
              cartCollection.doc(element.id).delete();
            }));
  }

  String formattedDate(timeStamp) {
    var toDate = DateTime.fromMillisecondsSinceEpoch(timeStamp.seconds * 1000);
    return DateFormat('dd-MM-yyyy').format(toDate);
  }

  CollectionReference historyCollec =
      FirebaseFirestore.instance.collection('history');

  //show history
  showHistory(UID) {
    return FutureBuilder<QuerySnapshot>(
      future: historyCollec.get(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, i) {
              return UID == snapshot.data!.docs[i]['UID']
                  ? cards.historyCard(
                      context,
                      snapshot.data!.docs[i]['OrderNO'].toString(),
                      formattedDate(snapshot.data!.docs[i]['DT']),
                      snapshot.data!.docs[i]['Total'].toString(),
                      snapshot.data!.docs[i]['CountOfitems'].toString(),
                      snapshot.data!.docs[i]['DT'],
                    )
                  : Container();
            },
          );
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return ShimmerPage();
        } else {
          return Container();
        }
      },
    );
  }

  CollectionReference orderCollec =
      FirebaseFirestore.instance.collection('orders');

  //show last orders
  showOrders(UID, date) {
    return FutureBuilder<QuerySnapshot>(
      future: orderCollec.get(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, i) {
              return date == snapshot.data!.docs[i]['DT']
                  ? cards.EachCategory(
                      snapshot.data!.docs[i]['image'],
                      snapshot.data!.docs[i]['name'],
                      snapshot.data!.docs[i]['price'],
                      snapshot.data!.docs[i]['cate'],
                    )
                  : Container();
            },
          );
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return EachCateShimmerPage();
        } else {
          return Container();
        }
      },
    );
  }

  getOrdersToAdmin() {
    return FutureBuilder<QuerySnapshot>(
      future: historyCollec.get(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, i) {
              return cards.showOrdersToAdmin(
                context,
                snapshot.data!.docs[i]['OrderNO'].toString(),
                formattedDate(snapshot.data!.docs[i]['DT']),
                snapshot.data!.docs[i]['Total'].toString(),
                snapshot.data!.docs[i]['CountOfitems'].toString(),
                snapshot.data!.docs[i]['DT'],
                snapshot.data!.docs[i]['UID'],
              );
            },
          );
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return ShimmerPage();
        } else {
          return Container();
        }
      },
    );
  }

  // End ******************************

  // Navigate to Loading
  loading(nextScreen, context) {
    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) {
        return LottieWaitting(nextScreen: nextScreen);
      },
    ));
  }
}
