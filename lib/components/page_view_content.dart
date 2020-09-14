import 'package:flutter/material.dart';
import '../constants.dart';
import '../size_config.dart';

class PageViewContent extends StatelessWidget {
  PageViewContent({this.imageUrl, this.text, this.description});
  final String imageUrl;
  final String text;
  final String description;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
      child: Column(
        children: [
          Image.asset(
            imageUrl,
            height: getScreenHeight(300),
            width: getScreenWidth(270),
          ),
          SizedBox(height: 22.0),
          Text(
            text,
            style: kTextBody1,
          ),
          SizedBox(height: 18.0),
          Text(
            description,
            style: kTextBody2,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
