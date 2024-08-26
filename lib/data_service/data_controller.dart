import 'dart:convert';
import 'package:dog_explorer/data_service/dog_list.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class DataController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getDogInformationFromApi();
  }

  //Model for list of dogs
  DogList? dogList;

  //For loading indicator
  var isDataLoading = false.obs;

  getDogInformationFromApi() async {
    try {
      isDataLoading(true);
      http.Response response =
          await http.get(Uri.tryParse('https://freetestapi.com/api/v1/dogs')!);

      if (response.statusCode == 200) {
        // data successfully
        final result = jsonDecode(response.body);
        //Converting the data into model
        dogList = DogList.fromJson(result);
      } else {
        //error
        print('Error : ${response.statusCode}');
      }
    } catch (e) {
      print('Error while getting data is $e');
    } finally {
      isDataLoading(false);
    }
  }
}
