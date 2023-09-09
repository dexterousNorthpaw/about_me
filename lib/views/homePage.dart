import 'package:about_me/views/github.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size media = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(
      children: [
        Container(
          constraints: const BoxConstraints.expand(),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/home_img.jpeg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: 0.5.sh,
          left: 0.6.sw,
          child: const Text("Slack Name: \nRAYHAN", style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w900
          ),),
        ),
        Positioned(
          top: 0.6.sh,
          left: 0.6.sw,
          child: Container(
            height: 70.h,
            width: 150.w,
            decoration: BoxDecoration(
              color: Color.fromRGBO(0, 0, 0, 0.5),
              borderRadius: BorderRadius.circular(50.r),
            ),
            child: TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const WebViewApp()),
                );
              },
              child: const Text("Open GitHub",style: TextStyle(color: Colors.white),),
            ),
          ),
        ),
      ],
    ));
  }
}
