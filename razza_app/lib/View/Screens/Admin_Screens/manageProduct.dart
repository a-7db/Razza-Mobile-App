import 'package:flutter/material.dart';
import 'package:razza_app/Model/firestore.dart';

import '../../Desgin/cards.dart';

class ProductManagement extends StatefulWidget {
  const ProductManagement({super.key});

  @override
  State<ProductManagement> createState() => _ProductManagementState();
}

class _ProductManagementState extends State<ProductManagement> {
  DB db = DB();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    db.showProdforAdmin(context);
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
      child: db.showProdforAdmin(context),
    )));
  }
}
