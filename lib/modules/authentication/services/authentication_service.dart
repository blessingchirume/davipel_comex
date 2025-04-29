import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';

import '../../../constants/api_constants.dart';

class AuthenticationService {
  Future<http.Response> auth(Map<String, String> data) async {
    return await http.post(
      Uri.parse(ApiConstants.login),
      headers: {
        'Content-Type': 'application/json',
        "accept": ApiConstants.acceptType,
        "mimeType": ApiConstants.acceptType,
      },
      body: json.encode(data),
    );
  }

  Future<http.Response> test(Map<String, String> data) async {
    // Create custom HttpClient with disabled SSL verification
    HttpClient httpClient = HttpClient()
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;

    // Create IOClient with the custom HttpClient
    http.Client client = IOClient(httpClient);

    try {
      var headers = {
        'x-api-key': '8a6408c6818c0f59175a665c600c3ea5c4036c6e9bc7af3474c2400dce693469',
        'Content-Type': 'application/json',
        'accept': ApiConstants.acceptType,
      };

      var request = http.MultipartRequest('POST', Uri.parse(ApiConstants.login));
      request.fields.addAll(data);
      request.headers.addAll(headers);

      // Use the custom client to send the request
      http.StreamedResponse response = await client.send(request);

      // Convert StreamedResponse to Response
      return await http.Response.fromStream(response);
    } finally {
      client.close(); // Don't forget to close the client
    }
  }
}
