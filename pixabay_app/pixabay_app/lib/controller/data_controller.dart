import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pixabay_app/apiService/model/data_model.dart';

class HomeController extends GetxController {
  bool isActive = false;
  List<Hits> dataList = [];

  Future<void> dataListApi() async {
    if (!isActive) {
      isActive = true;
      // Call your state update method here, like setState or update
      update();
    }

    try {
      var response =
          await http.get(Uri.parse("https://pixabay.com/api/?key=43432159-91e46c76b31e6e115ddb2b499&q=flowers&image_type=photo"), headers: {
        "Accept": "application/json",
        // 'Authorization': 'Bearer ${preferences.getString("token")}',
      });

      print("vendorOfferPlan==${response.body}");

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        DataModel dataModel = DataModel.fromJson(json.decode(response.body));
        if (data["total"] != null && data["total"] > 0) {
          // Assuming "total" indicates the number of results in the API response
          dataList = dataModel.hits ?? [];
          // dataList = data["hits"];
          print("dataList==$dataList");
        } else {
          // Handle empty response or no data found
          print("No data found in the API response.");
        }
      } else {
        // Handle API request failure
        print("API request failed with status code: ${response.statusCode}");
      }
    } catch (e) {
      // Handle other exceptions, such as network errors
      print("Error occurred: $e");
    }

    isActive = false;
    // Call your state update method here again
    update();
  }
}
