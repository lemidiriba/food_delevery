import 'package:food_delivery/data/api_client.dart';
import 'package:food_delivery/utils/app_consttants.dart';
import 'package:get/get_connect.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class PopularProductRepo extends GetxService {
  final ApiClient apiClient;

  PopularProductRepo({required this.apiClient});

  Future<Response> getPopularProductList() async{
    Response response = await apiClient.getData(AppConstants.popularProduct);
    return response;
  }
}