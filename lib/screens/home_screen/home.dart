import 'package:dog_explorer/data_service/data_controller.dart';
import 'package:dog_explorer/navbar/navbar.dart';
import 'package:dog_explorer/screens/home_screen/components/list_of_dogCards.dart';
import 'package:dog_explorer/screens/saved_dog_screen/saved_dog_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.sizeOf(context).height;
    final w = MediaQuery.sizeOf(context).width;

    DataController dataController = Get.put(DataController());

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey[400],
          title: Text(
            'Dog Explorer',
            style: TextStyle(
              fontFamily: 'Montserrat',
              color: Colors.white,
            ),
          ),
        ),
        body: listOfDogCards(
          dataController: dataController,
        ),
      ),
    );
  }
}
