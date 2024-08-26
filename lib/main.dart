import 'package:dog_explorer/Hive/dog_model.dart';
import 'package:dog_explorer/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async{
  //initalize hive
  await Hive.initFlutter();
  Hive.registerAdapter(DogModelAdapter());

  //open the box
  await Hive.openBox<DogModel>('dogs');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppPage.getnavbar(),
      getPages: AppPage.routes,
    );
  }
}
