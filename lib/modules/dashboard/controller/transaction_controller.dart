import 'package:davipel_comex/models/responses/user_response_model.dart';
import 'package:davipel_comex/modules/authentication/controller/authentication_controller.dart';
import 'package:davipel_comex/services/api_pipeline_service.dart';
import 'package:http/http.dart' as http;

import '../../../constants/api_constants.dart';

class TransactionController {
  Future<http.Response> getTransactionHistory(String startDate, String endDate) async {
    UserModel user = await AuthenticationController().retrieveUserData();
    return ApiPipelineService().get('${ApiConstants.history}/${user.user!.id!}');
  }

  Future<http.Response> getDayTransactions() async {
    UserModel user = await AuthenticationController().retrieveUserData();
    return ApiPipelineService().get('${ApiConstants.dayTransactions}/${user.user!.id!}');
  }


  Future<http.Response> getLastTransaction() async {
    UserModel user = await AuthenticationController().retrieveUserData();
    return ApiPipelineService().get('${ApiConstants.lastTransaction}/${user.user!.id!}');
  }

  Future<http.Response> getAgentBalance() async {
    UserModel user = await AuthenticationController().retrieveUserData();
    return ApiPipelineService().get('${ApiConstants.agentBalance}/${user.user!.id!}');
  }
}
