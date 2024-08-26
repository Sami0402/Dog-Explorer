import 'package:dog_explorer/screens/search_screen/dog_search_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dog_explorer/screens/home_screen/components/dogCustomCard.dart';
import 'package:dog_explorer/screens/detail_screen/detail_screen.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.sizeOf(context).height;
    final w = MediaQuery.sizeOf(context).width;

    // Instantiate the SearchController
    final DogSearchController searchController = Get.put(DogSearchController());

    return SafeArea(
      child: Scaffold(
          // appBar: AppBar(
          //   title: Text('Search'),
          // ),
          body: Container(
        color: Colors.blueGrey[100],
        child: Column(
          children: [
            // Search Field
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Container(
                margin: EdgeInsets.only(top: 10, bottom: 10),
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.blueGrey[200],
                  borderRadius: BorderRadius.circular(45),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    onChanged: (value) {
                      searchController.searchQuery.value = value;
                    },
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      hintText: 'Search...',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
            // GridView
            Expanded(
              child: Obx(
                () {
                  final filteredDogs = searchController.filteredDogList;
                  return GridView.builder(
                    padding: EdgeInsets.only(
                        top: 10, left: 12, right: 12, bottom: 10),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                      childAspectRatio: 1 / 1.4,
                    ),
                    itemCount: filteredDogs.length,
                    itemBuilder: (context, index) {
                      final dog = filteredDogs[index];

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
                  );
                },
              ),
            ),
          ],
        ),
      )),
    );
  }
}
