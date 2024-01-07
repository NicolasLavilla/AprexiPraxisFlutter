import 'package:flutter/material.dart';
import 'package:flutter_aprexi_praxis/presentation/view/followoffer/follow_offer_screen.dart';
import 'package:flutter_aprexi_praxis/presentation/view/requestoffer/request_offer_screen.dart';


class MyPageView extends StatelessWidget {
  const MyPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Offers',
      home: Scaffold(
        body: PageView(
          physics: const BouncingScrollPhysics(),
          children: const <Widget>[
            RequestOfferScreen(),
            FollowOfferScreen(),
          ],
        ),
      ),
    );
  }
}



/*class MyPageView extends StatelessWidget {
  const MyPageView({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Offers',
      home: Scaffold(
        body: PageView(
          physics: const BouncingScrollPhysics(),
          children: const <Widget>[
            RequestOfferScreen(),
            FollowOfferScreen(),
          ],
        ),
      ),
    );
  }
}*/
