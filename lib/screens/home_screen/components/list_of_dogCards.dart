import 'package:dog_explorer/data_service/data_controller.dart';
import 'package:dog_explorer/screens/detail_screen/detail_screen.dart';
import 'package:dog_explorer/screens/home_screen/components/dogCustomCard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class listOfDogCards extends StatelessWidget {
  const listOfDogCards({
    super.key,
    required this.dataController,
  });

  final DataController dataController;

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.sizeOf(context).height;
    final w = MediaQuery.sizeOf(context).width;
    return Obx(() {
      // Check if data is loading
      if (dataController.isDataLoading.value) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }

      // Check if data is available
      final DogList = dataController.dogList?.dogs ?? [];
      if (DogList.isEmpty) {
        return Center(
          child: Text('No data available'),
        );
      }

      //Build the Gridview if data is avilable
      return Container(
        color: Colors.blueGrey[100],
        height: h,
        width: w,
        child: GridView.builder(
          padding: EdgeInsets.only(top: 10, left: 12, right: 12, bottom: 10),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 1 / 1.4),
          itemCount: DogList.length,
          itemBuilder: (context, index) {
            final dog = DogList[index];

            return dogCustomCard(
              imagePath: dog.image ?? '',
              dogName: dog.name ?? '',
              breed: dog.breedGroup ?? '',
              onTap: () {
                Get.to(DetailScreen(
                  imagePath: dog.image ?? '',
                  dogName: dog.name ?? '',
                  breed: dog.breedGroup ?? '',
                  description: dog.description ?? '',
                  lifespan: dog.lifespan ?? '',
                  Origin: dog.origin ?? '',
                ));
              },
            );
          },
        ),
      );
    });
  }
}
