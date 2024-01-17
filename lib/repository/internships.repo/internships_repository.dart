import 'package:internshala_clone/data/network/network_api_service.dart';
import 'package:internshala_clone/res/app_url.dart';

class InternshisRepository {
  Future<dynamic> getInternships() async {
    final apiServices = NetworkApiService();
    try {
      const url = AppUrl.internShipSearchEndpoint;
      final response = await apiServices.getGetApiResponse(url);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
