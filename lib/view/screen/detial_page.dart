import 'dart:ui';

import 'package:flutter/material.dart';

class DetialPage extends StatelessWidget {
  const DetialPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    Map<String, dynamic> data =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffB6BBC4),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: Text(data['name']),
        flexibleSpace: const Image(
          image: NetworkImage(
            "https://w.forfun.com/fetch/d3/d36ac7447b618e0947acd3b1427cc496.jpeg",
          ),
          fit: BoxFit.cover,
        ),
      ),
      backgroundColor: const Color(0xffF0ECE5),
      body: Container(
        // padding: const EdgeInsets.all(18),
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              "https://i.pinimg.com/564x/20/dd/e1/20dde1142ae86f408d5f223c9ffc0782.jpg",
            ),
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            ClipRRect(
              // borderRadius: BorderRadius.circular(20),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 10,
                  sigmaY: 10,
                ),
                child: Container(
                  height: size.height * 1,
                  width: double.infinity,
                  margin: const EdgeInsets.all(60),
                  decoration: BoxDecoration(
                    color: data['color'],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  alignment: const Alignment(0, 0.8),
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 4,
                        child: Text(
                          data['S'].toString(),
                          style: const TextStyle(
                            fontSize: 30,
                            color: Color(0xffFCFFE7),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: const Alignment(0, -0.7),
              child: TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: 0, end: 1),
                duration: const Duration(seconds: 2),
                curve: Curves.easeInOut,
                builder: (contaxt, value, child) {
                  return Opacity(
                    opacity: value,
                    child: Transform.translate(
                      offset: Offset(0, 50 * (1 - value)),
                      child: child,
                    ),
                  );
                },
                child: Image.asset(
                  data['image'],
                  height: size.height * 0.4,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
