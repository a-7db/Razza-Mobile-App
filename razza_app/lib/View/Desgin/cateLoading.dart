import 'package:flutter/material.dart';

class ImageLoading extends StatelessWidget {
  const ImageLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(left: 10),
          child: Column(
            children: [
              Row(
                children: [card(), SizedBox(width: 20), card()],
              ),
              SizedBox(height: 40),
              Row(
                children: [card(), SizedBox(width: 20), card()],
              ),
              
            ],
          ),
        ));
  }

  Container card() {
    return Container(
      width: 160,
      height: 200,
      decoration: BoxDecoration(
          color: Colors.grey[200], borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 160,
            height: 100,
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                )),
            child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                child: Image(
                  image: NetworkImage(
                      'https://wallpaperaccess.com/full/3966936.jpg'),
                  fit: BoxFit.cover,
                )),
          ),
          Container(
            margin: EdgeInsets.only(left: 10, top: 15),
            width: 100,
            height: 10,
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(20)),
          ),
          Container(
            margin: EdgeInsets.only(left: 10, top: 15),
            width: 50,
            height: 10,
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(20)),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.only(left: 10, top: 15),
                width: 70,
                height: 10,
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(20)),
              ),
              Container(
                margin: EdgeInsets.only(top: 15),
                width: 30,
                height: 10,
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(20)),
              ),
              SizedBox(width: 1)
            ],
          ),
        ],
      ),
    );
  }
}
