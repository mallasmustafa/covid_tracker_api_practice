import 'dart:convert';
import 'package:covid_tracker_app/model/covid_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CovidController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getApi();
  }

  final String baseUrl = "https://disease.sh/v3/covid-19/countries";
  RxList<CovidModel> covidList = RxList<CovidModel>();
  RxBool isLoading = false.obs;

  getApi() async {
    isLoading.value = true;
    var response = await http.get(Uri.parse(baseUrl));
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      for (var user in data) {
        covidList.add(CovidModel.fromJson(user));
        print(response.body);
      }
      isLoading.value = false;
    } else {
      isLoading.value = false;
      print("Something went wrong");
      Get.snackbar("Network Problem", "Check internet connection");
    }
  }
}