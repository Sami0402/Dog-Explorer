import 'package:dog_explorer/Hive/dog_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({
    super.key,
    required this.imagePath,
    required this.dogName,
    required this.breed,
    required this.description,
    required this.lifespan,
    required this.Origin,
  });
  final String imagePath;
  final String dogName;
  final String breed;
  final String description;
  final String lifespan;
  final String Origin;
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.sizeOf(context).height;
    final w = MediaQuery.sizeOf(context).width;
    return Scaffold(
        appBar: AppBar(
          title: Text('Details'),
          backgroundColor: Colors.blueGrey[100],
        ),
        body: SingleChildScrollView(
            child: Container(
          height: h,
          width: w,
          color: Colors.blueGrey.withOpacity(0.12),
          child: Container(
            child: Column(
              children: [
                //IMAGE
                Container(
                  height: h * 0.45,
                  child: Image.network(
                    imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: Container(
                    height: h * 0.55,
                    width: w,
                    decoration: BoxDecoration(
                        color: Colors.blue[100],
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        )),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //DOG NAME
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 15,
                            left: 15,
                            bottom: 10,
                          ),
                          child: Text(
                            dogName,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        //BREED
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 2),
                            decoration: BoxDecoration(
                                color: Colors.blue.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(5)),
                            child: Text(
                              breed,
                              style: TextStyle(
                                  fontSize: 15, color: Colors.blue[700]),
                            ),
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(
                                left: 15, right: 15, top: 15, bottom: 10),
                            child: Text(
                              description,
                              style: TextStyle(fontSize: 15),
                            )),
                        Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                children: [
                                  Icon(Icons.location_on_outlined),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Origin : ",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(Origin),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                children: [
                                  Icon(Icons.timeline_sharp),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Lifespan : ",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(lifespan),
                                ],
                              ),
                            ),
                          ],
                        ),
                        //Save Buttom
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          width: w * 0.95,
                          child: ElevatedButton(
                            style: ButtonStyle(
                                overlayColor:
                                    WidgetStatePropertyAll(Colors.blue[50]),
                                shape: WidgetStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)))),
                            child: Text(
                              "Save",
                              style: TextStyle(color: Colors.blue[900]),
                            ),
                            onPressed: () async {
                              var box = await Hive.openBox<DogModel>('dogs');
                              Get.snackbar('Saved!', 'Added to Saved Page');
                              var newDog = DogModel(
                                name: dogName,
                                breed: breed,
                                image: imagePath,
                                description: description,
                                origin: Origin,
                                lifespan: lifespan,
                              );
                              await box.add(newDog);
                              print('Dog saved!');
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        )));
  }
}
