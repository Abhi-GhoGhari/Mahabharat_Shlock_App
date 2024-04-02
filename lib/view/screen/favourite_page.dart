import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mahabharat_app/utils/character_utils.dart';

class FavouritePge extends StatefulWidget {
  const FavouritePge({super.key});

  @override
  State<FavouritePge> createState() => _FavoritPageState();
}

class _FavoritPageState extends State<FavouritePge> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: const Color(0xffE5BA73),
      appBar: AppBar(
        title: const Text("Favourite Page"),
        flexibleSpace: const Image(
          image: NetworkImage(
            "https://w.forfun.com/fetch/d3/d36ac7447b618e0947acd3b1427cc496.jpeg",
          ),
          fit: BoxFit.cover,
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              "https://i.pinimg.com/564x/20/dd/e1/20dde1142ae86f408d5f223c9ffc0782.jpg",
            ),
          ),
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          child: Column(
            children: favCharacters
                .map(
                  (e) => Stack(
                    alignment: Alignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(0.1),
                        child: ClipRRect(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(
                              sigmaX: 10,
                              sigmaY: 10,
                            ),
                            child: Container(
                              height: size.height * 0.50,
                              width: double.infinity,
                              margin: const EdgeInsets.all(60),
                              decoration: BoxDecoration(
                                color: e['color'],
                                borderRadius: BorderRadius.circular(20),
                              ),
                              alignment: Alignment.bottomLeft,
                              padding: const EdgeInsets.all(20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  //name
                                  Expanded(
                                    flex: 4,
                                    child: Text(
                                      e['name'],
                                      style: const TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  //star
                                  Expanded(
                                    child: IconButton(
                                      onPressed: () {
                                        if (favCharacters.contains(e)) {
                                          favCharacters.remove(e);
                                        } else {
                                          favCharacters.add(e);
                                        }
                                        setState(() {});
                                      },
                                      icon: Icon(
                                        favCharacters.contains(e)
                                            ? Icons.star
                                            : Icons.star_border,
                                        color: Colors.white,
                                        size: 27,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      //photo
                      Align(
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
                            e['image'],
                            height: size.height * 0.4,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
