import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:razza_app/Model/firestore.dart';
import 'package:razza_app/View/Desgin/adminPanel.dart';
import 'package:razza_app/View/Desgin/inputStyle.dart';
import 'package:razza_app/View/Desgin/lottie.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  TextEditingController productName = new TextEditingController();
  TextEditingController price = new TextEditingController();
  TextEditingController desc = new TextEditingController();

  DB db = DB();
  var filename;
  changePhoto() {
    if (db.file != null) {
      setState(() {
        filename = db.file;
      });
    }
  }

  int selectedColor = 0;
  color(color, index) {
    return Container(
      width: 30,
      child: OutlinedButton(
        onPressed: () {
          setState(() {
            selectedColor = index;
          });
        },
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.all(0),
          side: BorderSide.none,
        ),
        child: Container(
          child: selectedColor == index && color == Colors.black
              ? Icon(
                  Icons.done,
                  color: Colors.white,
                )
              : selectedColor == index && color != Colors.black
                  ? Icon(
                      Icons.done,
                      color: Colors.black,
                    )
                  : Container(),
          width: 30,
          height: 30,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
      ),
    );
  }

  String getColor() {
    if (selectedColor == 1) {
      return 'Black';
    }
    if (selectedColor == 2) {
      return 'Purple';
    }
    if (selectedColor == 3) {
      return 'Orange';
    }
    if (selectedColor == 4) {
      return 'Grey';
    } else {
      return 'Pink';
    }
  }

  var selectedCate;

  List categories = [
    'White Shmaq',
    'Red Shmaq',
    'Watch',
    'Shoes',
    'Glsses',
    'Kabck',
    'Package',
    'Perfume',
    'Mesbah'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Container(
              width: double.infinity,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 150,
                          height: 170,
                          child: filename == null
                              ? Center(
                                  child: Icon(Icons.image,
                                      color: Colors.white70, size: 60))
                              : ClipRRect(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10)),
                                  child: Image.file(
                                    db.file,
                                    fit: BoxFit.cover,
                                  )),
                          decoration: BoxDecoration(
                              color: Colors.grey[400],
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10))),
                        ),
                        InkWell(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return Container(
                                  height: 115,
                                  child: Column(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          db.uploadeImage(true);
                                          Navigator.pop(context);
                                          changePhoto();
                                        },
                                        child: ListTile(
                                          title: Text('Gallery'),
                                          leading: Icon(Icons.photo_library),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          db.uploadeImage(false);
                                          Navigator.pop(context);
                                          changePhoto();
                                        },
                                        child: ListTile(
                                          title: Text('Camera'),
                                          leading:
                                              Icon(Icons.camera_alt_rounded),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                          child: Container(
                            width: 150,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.add_link_sharp,
                                        color: Colors.white),
                                    SizedBox(width: 5),
                                    Text(
                                      'Upload Image',
                                      style: GoogleFonts.poppins(
                                          color: Colors.white),
                                    )
                                  ]),
                            ),
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10))),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.2,
                      height: MediaQuery.of(context).size.height / 2.2,
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(8)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 15),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: TextFormField(
                                controller: productName,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Product Name'),
                              ),
                            ),
                            SizedBox(height: 20),
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    padding: EdgeInsets.only(left: 15),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: TextFormField(
                                      keyboardType: TextInputType.number,
                                      controller: price,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: '00.0 SR'),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 20),
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                      padding: EdgeInsets.only(left: 15),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: DropdownButtonFormField(
                                          decoration: InputDecoration(
                                              border: InputBorder.none),
                                          hint: Text('Select Category'),
                                          value: selectedCate,
                                          onChanged: (value) {
                                            setState(() {
                                              selectedCate = value;
                                            });
                                          },
                                          items: categories.map((valueItem) {
                                            return DropdownMenuItem(
                                              value: valueItem,
                                              child: Text(valueItem),
                                            );
                                          }).toList())),
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              children: [
                                Text('Color'),
                                SizedBox(width: 20),
                                Row(
                                  children: [
                                    color(Colors.black, 1),
                                    SizedBox(width: 10),
                                    color(Colors.purple[200], 2),
                                    SizedBox(width: 10),
                                    color(Colors.orange[200], 3),
                                    SizedBox(width: 10),
                                    color(Colors.grey[400], 4),
                                    SizedBox(width: 10),
                                    color(Colors.pink[100], 5),
                                    SizedBox(width: 10),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 15),
                            Container(
                              padding: EdgeInsets.only(left: 15),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: TextFormField(
                                controller: desc,
                                maxLines: 3,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'description..'),
                              ),
                            ),
                            SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      child: InkWell(
                        onTap: () {
                          db.addProducts(productName.text, price.text,
                              selectedCate, getColor(), desc.text);
                          db.loading(AdminPanel(screen: 2), context);
                        },
                        child: Container(
                          width: 60,
                          height: 60,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 4, vertical: 8),
                            child: Center(
                                child: Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 30,
                            )),
                          ),
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 77, 35, 121),
                              borderRadius: BorderRadius.circular(50)),
                        ),
                      ),
                    )
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
