
import 'package:davipel_comex/constants/api_constants.dart';
import 'package:davipel_comex/services/api_pipeline_service.dart';
import 'package:http/http.dart';

class PaymentController {
  Future<Response> makePayment(Map<String, dynamic> data) async {
    var response =
        await ApiPipelineService().post(ApiConstants.postOrder, data);

    if (response.statusCode == 200) {


      // var user = UserModel.fromJson(jsonDecode(response.body)['success']);
      // var token = "Bearer ${jsonDecode(response.body)['success']['token']}";
      // saveAuthToken(token);
      // saveUserData(user);
    }

    return response;
  }

  Future<Response> addAgentFloat(Map<String, dynamic> data) async {
    var response =
        await ApiPipelineService().post(ApiConstants.agentFloat, data);

    if (response.statusCode == 200) {
      // var user = UserModel.fromJson(jsonDecode(response.body)['success']);
      // var token = "Bearer ${jsonDecode(response.body)['success']['token']}";
      // saveAuthToken(token);
      // saveUserData(user);
    }

    return response;
  }

  Future<Response> teloneDirectPurchase(Map<String, dynamic> data) async {
    var response = await ApiPipelineService()
        .post(ApiConstants.makeTeloneDirectPayment, data);

    if (response.statusCode == 200) {
      // var user = UserModel.fromJson(jsonDecode(response.body)['success']);
      // var token = "Bearer ${jsonDecode(response.body)['success']['token']}";
      // saveAuthToken(token);
      // saveUserData(user);
    }

    return response;
  }

  Future<Response>  econetBundlePurchase(Map<String, dynamic> payload) async {
    var response = await ApiPipelineService()
        .post(ApiConstants.econetBundles, payload);

    if (response.statusCode == 200) {
      // var user = UserModel.fromJson(jsonDecode(response.body)['success']);
      // var token = "Bearer ${jsonDecode(response.body)['success']['token']}";
      // saveAuthToken(token);
      // saveUserData(user);
    }

    return response;
  }
}
