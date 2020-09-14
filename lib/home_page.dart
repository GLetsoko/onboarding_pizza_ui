import 'package:flutter/material.dart';
import 'package:onboarding_ui/constants.dart';

import 'components/page_view_content.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;
  PageController _controller = PageController();

  List<Map<String, String>> contentData = [
    {
      'imageUrl': 'assets/images/pizza_delivery.png',
      'text': 'Food delivery',
      'description':
          'We will deliver your order as quickly \n and efficiently as possible.'
    },
    {
      'imageUrl': 'assets/images/eating_pizza.png',
      'text': 'Get your order',
      'description':
          'The courier will deliver your order directly\nto your home.'
    },
    {
      'imageUrl': 'assets/images/pizza.png',
      'text': 'Bon appetite!',
      'description': 'Enjoy tasty and hot food, we try to be\nbetter for you.'
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundCol,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/background.jpg'),
              fit: BoxFit.cover),
        ),
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: PageView.builder(
                  itemCount: contentData.length,
                  controller: _controller,
                  onPageChanged: (value) {
                    setState(() {
                      currentPage = value;
                    });
                  },
                  itemBuilder: (context, index) {
                    return PageViewContent(
                      imageUrl: contentData[index]['imageUrl'],
                      text: contentData[index]['text'],
                      description: contentData[index]['description'],
                    );
                  }),
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FlatButton(
                    onPressed: null,
                    child: Text(
                      'Skip',
                      style: kTextBody2.copyWith(fontSize: 20.0),
                    ),
                  ),
                  Row(
                    children: List.generate(
                      contentData.length,
                      (index) => _buildIndicator(index),
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      _controller.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut);
                    },
                    child: Text(
                      'Next',
                      style: kTextBody2.copyWith(
                          fontSize: 20.0, color: kOrangeColor),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  AnimatedContainer _buildIndicator(int index) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      margin: EdgeInsets.all(8.0),
      height: 10.0,
      width: 10.0,
      decoration: BoxDecoration(
        color: currentPage == index ? kWhiteColor : kUselectedCol,
        borderRadius: BorderRadius.circular(50.0),
      ),
    );
  }
}
