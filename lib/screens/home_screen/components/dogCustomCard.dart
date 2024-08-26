// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:dog_explorer/screens/detail_screen/detail_screen.dart';

class dogCustomCard extends StatelessWidget {
  const dogCustomCard({
    Key? key,
    required this.imagePath,
    required this.dogName,
    required this.breed,
    this.onTap,
  }) : super(key: key);
  final String imagePath;
  final String dogName;
  final String breed;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.sizeOf(context).height;
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 4,
        color: Colors.blueGrey[50],
        child: Column(
          children: [
            //DOG IMAGE
            Expanded(
              child: Container(
                height: h * 0.2,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    color: Colors.purple[200],
                    image: DecorationImage(
                      image: NetworkImage(imagePath),
                      fit: BoxFit.cover,
                    )),
              ),
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //DOG NAME
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 6, bottom: 5, left: 10),
                      child: Text(
                        dogName,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    //BREAD
                    Padding(
                      padding: const EdgeInsets.only(left: 10, bottom: 10),
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 1),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.blueGrey.withOpacity(0.25)),
                        child: Text(
                          breed,
                          style: TextStyle(
                            color: Colors.blueGrey[800],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
