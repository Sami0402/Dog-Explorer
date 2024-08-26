import 'package:dog_explorer/data_service/dog_model.dart';
import 'package:get/get.dart';
import 'package:dog_explorer/data_service/data_controller.dart';

class DogSearchController extends GetxController {
  final DataController dataController = Get.find<DataController>();
  var searchQuery = ''.obs;
  var filteredDogList = <Dog>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Listen to changes in the search query and update filtered results
    ever(searchQuery, (_) => _filterDogs());
    // Initialize filtered list with all dogs initially
    filteredDogList.assignAll(dataController.dogList?.dogs ?? []);
  }

  void _filterDogs() {
    final query = searchQuery.value.toLowerCase();
    if (query.isEmpty) {
      filteredDogList.assignAll(dataController.dogList?.dogs ?? []);
    } else {
      filteredDogList.assignAll(dataController.dogList?.dogs
              ?.where((dog) =>
                  (dog.name?.toLowerCase().contains(query) ?? false) ||
                  (dog.breedGroup?.toLowerCase().contains(query) ?? false))
              .toList() ??
          []);
    }
  }
}
