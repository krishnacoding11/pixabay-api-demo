import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailScreen extends StatefulWidget {
  final String? image;
  final int? like;
  final int? view;
  const DetailScreen({super.key, this.image, this.like, this.view});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Hero(
        tag: "tag: 'hero-rectangle'",
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(image: NetworkImage("${widget.image}"), fit: BoxFit.cover),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 45),
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(Icons.arrow_back),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(00)),
        child: BottomNavigationBar(
            onTap: (value) {},
            backgroundColor: Colors.purple.withOpacity(.3),
            selectedLabelStyle: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            unselectedItemColor: Colors.white,
            selectedItemColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            selectedIconTheme: const IconThemeData(color: Colors.white),
            //unselectedItemColor: Colors.grey,
            // unselectedFontSize: 12,
            // selectedFontSize: 12,
            unselectedLabelStyle: const TextStyle(
              fontSize: 12,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            items: [
              BottomNavigationBarItem(
                icon: Padding(padding: EdgeInsets.symmetric(vertical: 6), child: Icon(Icons.favorite)),
                label: "${widget.like}",
              ),
              BottomNavigationBarItem(
                icon: Padding(padding: EdgeInsets.symmetric(vertical: 6), child: Icon(Icons.remove_red_eye)),
                label: "${widget.view}",
              ),
            ]),
      ),
    );
  }
}
