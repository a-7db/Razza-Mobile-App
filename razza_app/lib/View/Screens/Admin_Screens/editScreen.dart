import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:razza_app/View/Desgin/color.dart';
import 'package:razza_app/View/Desgin/effects.dart';

import '../../../Model/firestore.dart';

class EditScreen extends StatefulWidget {
  var elementID, id, name, image, color, cate, desc;
  int price;
  EditScreen({
    super.key,
    required this.elementID,
    required this.id,
    required this.name,
    required this.image,
    required this.cate,
    required this.color,
    required this.price,
    required this.desc,
  });

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  Style style = Style();
  DB db = DB();
  Effects effects = Effects();

  TextEditingController nameController = new TextEditingController();
  TextEditingController priceController = new TextEditingController();
  TextEditingController descController = new TextEditingController();

  late var filename;
  changePhoto() {
    if (db.selectedImage != '') {
      setState(() {
        filename = db.file;
      });
    }
  }

  var selectedColor;
  color(color, index) {
    return Container(
      width: 25,
      child: OutlinedButton(
        onPressed: () {
          setState(() {
            widget.color = index;
            selectedColor = index;
          });
        },
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.all(0),
          side: BorderSide.none,
        ),
        child: Container(
          child: selectedColor == index
              ? Icon(
                  Icons.done,
                  color: Colors.white,
                )
              : Container(),
          width: 30,
          height: 30,
          decoration:
              BoxDecoration(color: color, shape: BoxShape.circle, boxShadow: [
            BoxShadow(
                offset: Offset(0, 2),
                blurRadius: 5,
                spreadRadius: 0,
                color: Color.fromARGB(255, 183, 183, 183))
          ]),
        ),
      ),
    );
  }

  String getColor() {
    if (selectedColor == 'Black') {
      return 'Black';
    }
    if (selectedColor == 'Purple') {
      return 'Purple';
    }
    if (selectedColor == 'Orange') {
      return 'Orange';
    }
    if (selectedColor == 'Grey') {
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
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      selectedColor = widget.color;
      nameController.text = widget.name;
      priceController.text = widget.price.toString();
      descController.text = widget.desc;
      selectedCate = widget.cate;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(30)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            color: Color.fromARGB(255, 87, 43, 133),
                          )),
                      Text(
                        'Product Editing',
                        style: GoogleFonts.poppins(
                            color: Color.fromARGB(255, 87, 43, 133),
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                      Container(
                        width: 50,
                      )
                    ],
                  ),
                  SizedBox(height: 30),
                  Container(
                    margin: EdgeInsets.only(bottom: 15),
                    height: 100,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 17),
                              blurRadius: 17,
                              spreadRadius: -23,
                              color: Color.fromARGB(255, 183, 183, 183))
                        ]),
                    child: card(),
                  ),
                  SizedBox(height: 50),
                  name_and_price(),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Text('Color'),
                    ],
                  ),
                  Container(
                    child: Row(
                      children: [
                        SizedBox(height: 5),
                        Expanded(
                          flex: 2,
                          child: Row(
                            children: [
                              color(Colors.black, 'Black'),
                              SizedBox(width: 10),
                              color(Colors.purple[200], 'Purple'),
                              SizedBox(width: 10),
                              color(Colors.orange[200], 'Orange'),
                              SizedBox(width: 10),
                              color(Colors.grey[400], 'Grey'),
                              SizedBox(width: 10),
                              color(Colors.pink[100], 'Pink'),
                              SizedBox(width: 10),
                            ],
                          ),
                        ),
                        SizedBox(width: 20),
                        Container(
                            width: 150,
                            padding: EdgeInsets.only(left: 15),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                      offset: Offset(0, 17),
                                      blurRadius: 17,
                                      spreadRadius: -23,
                                      color: Color.fromARGB(255, 183, 183, 183))
                                ]),
                            child: DropdownButtonFormField(
                                decoration:
                                    InputDecoration(border: InputBorder.none),
                                hint: Text('Category'),
                                style: GoogleFonts.poppins(color: Colors.black),
                                value: widget.cate,
                                onChanged: (value) {
                                  setState(() {
                                    value = widget.cate;
                                    selectedCate = value;
                                    print(selectedCate);
                                  });
                                },
                                items: categories.map((valueItem) {
                                  return DropdownMenuItem(
                                    value: valueItem,
                                    child: Text(valueItem),
                                  );
                                }).toList())),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    height: 100,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 17),
                              blurRadius: 17,
                              spreadRadius: -23,
                              color: Color.fromARGB(255, 183, 183, 183))
                        ]),
                    child: TextFormField(
                      controller: descController,
                      style: GoogleFonts.poppins(fontSize: 13),
                      maxLines: 4,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.description_outlined),
                          border: InputBorder.none),
                    ),
                  ),
                  SizedBox(height: 60),
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            db.updateProduct(
                                widget.elementID,
                                nameController.text,
                                selectedCate,
                                selectedColor,
                                priceController.text,
                                descController.text,
                                widget.image);
                            effects.showAchievementView(
                                context,
                                'Updating',
                                nameController.text +
                                    ' is updated successfully',
                                1,
                                Icons.done_rounded);
                          },
                          child: Container(
                            height: 50,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Text('Update Item',
                                    style: GoogleFonts.poppins(
                                        color: Colors.white)),
                              ),
                            ),
                            decoration: BoxDecoration(
                                color: style.primaryColor,
                                borderRadius: BorderRadius.circular(50),
                                boxShadow: [
                                  BoxShadow(
                                      offset: Offset(0, 17),
                                      blurRadius: 17,
                                      spreadRadius: -10,
                                      color: Color.fromARGB(255, 183, 183, 183))
                                ]),
                          ),
                        ),
                      ),
                      SizedBox(width: 15),
                      Expanded(
                        child: InkWell(
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
                                          setState(() {
                                            filename = db.file;
                                          });
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
                                          setState(() {
                                            filename = db.file;
                                          });
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
                            height: 50,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Text('Change Image',
                                    style: GoogleFonts.poppins(
                                        color: style.primaryColor)),
                              ),
                            ),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50),
                                boxShadow: [
                                  BoxShadow(
                                      offset: Offset(0, 17),
                                      blurRadius: 17,
                                      spreadRadius: -15,
                                      color: Color.fromARGB(255, 183, 183, 183))
                                ]),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Row name_and_price() {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Container(
            width: 200,
            height: 50,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 17),
                      blurRadius: 17,
                      spreadRadius: -23,
                      color: Color.fromARGB(255, 183, 183, 183))
                ]),
            child: TextFormField(
              onChanged: (value) {
                setState(() {
                  widget.name = value;
                });
              },
              controller: nameController,
              style: GoogleFonts.poppins(fontSize: 14),
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.tag_rounded),
                  border: InputBorder.none,
                  prefixIconColor: style.primaryColor),
            ),
          ),
        ),
        SizedBox(width: 15),
        Expanded(
          flex: 2,
          child: Container(
            width: 200,
            height: 50,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 17),
                      blurRadius: 17,
                      spreadRadius: -23,
                      color: Color.fromARGB(255, 183, 183, 183))
                ]),
            child: TextFormField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  widget.price = int.parse(value);
                });
              },
              controller: priceController,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.attach_money_rounded),
                  border: InputBorder.none),
            ),
          ),
        ),
      ],
    );
  }

  Row card() {
    return Row(children: [
      Container(
        width: 100,
        height: 100,
        child: InkWell(
          onTap: () {
            changePhoto();
          },
          child: ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10)),
              child: db.selectedImage == null
                  ? Image(
                      image: NetworkImage(widget.image),
                      fit: BoxFit.cover,
                    )
                  : Image.file(db.file, fit: BoxFit.cover)),
        ),
      ),
      SizedBox(
        width: 10,
      ),
      // TEXT
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 220,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.name,
                      style: GoogleFonts.poppins(
                          fontSize: 15, color: Colors.black),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5),
              Text(
                widget.cate,
                style: GoogleFonts.poppins(
                    color: Colors.grey, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          Container(
            width: 220,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.color,
                  style: GoogleFonts.poppins(fontSize: 15, color: Colors.black),
                ),
                Container(
                  child: Text(
                    'SAR ' + widget.price.toString(),
                    style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                )
              ],
            ),
          )
        ],
      )
    ]);
  }
}
