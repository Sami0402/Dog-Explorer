import 'package:dog_explorer/Hive/dog_model.dart';
import 'package:dog_explorer/screens/detail_screen/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SavedDogsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Saved Dogs',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueGrey[400],
      ),
      body: ValueListenableBuilder(
        valueListenable: Hive.box<DogModel>('dogs').listenable(),
        builder: (context, Box<DogModel> box, _) {
          if (box.values.isEmpty) {
            return Center(child: Text('Empty!'));
          }
          return Container(
            color: Colors.blueGrey[100],
            child: ListView.builder(
              itemCount: box.length,
              itemBuilder: (context, index) {
                final dog = box.getAt(index);
                Future deleteDog() async {
                  await box.deleteAt(index);
                }

                return GestureDetector(
                  onTap: () {
                    print("Tappped!");
                    Get.to(DetailScreen(
                      imagePath: dog!.image,
                      dogName: dog!.name,
                      breed: dog!.breed,
                      description: dog!.description,
                      lifespan: dog!.lifespan,
                      Origin: dog!.origin,
                    ));
                  },
                  child: Slidable(
                    endActionPane: ActionPane(
                        extentRatio: 0.25,
                        motion: StretchMotion(),
                        children: [
                          SlidableAction(
                            onPressed: (context) => deleteDog(),
                            icon: Icons.delete_outline,
                            backgroundColor: Colors.red.shade400,
                            borderRadius: BorderRadius.circular(12),
                          )
                        ]),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                        width: 0.5,
                        color: Colors.grey,
                      ))),
                      child: ListTile(
                        title: Text(dog?.name ?? 'No name'),
                        subtitle: Text(dog?.breed ?? 'No breed'),
                        leading: dog?.image != null
                            ? Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        dog!.image,
                                      ),
                                    )),
                              )
                            : Icon(Icons.image),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
