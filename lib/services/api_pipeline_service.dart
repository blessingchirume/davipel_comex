import 'dart:convert';
import 'dart:io';

import 'package:davipel_comex/helpers/http_helper.dart';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';

class ApiPipelineService {
  Future<http.Response> get(String url) async {
    // Create custom HttpClient with disabled SSL verification
    HttpClient httpClient = HttpClient()
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;

    // Create IOClient with the custom HttpClient
    http.Client client = IOClient(httpClient);

    try {
      return await client.get(
        Uri.parse(url),
        headers: await HttpHelper().setHttpHeaders(),
      );
    } finally {
      client.close(); // Close the client when done
    }
  }

  Future<http.Response> post(String url, Map<String, dynamic> payload) async {
    HttpClient httpClient = HttpClient()
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;

    // Create IOClient with the custom HttpClient
    http.Client client = IOClient(httpClient);
    return await client.post(
      Uri.parse(url),
      body: jsonEncode(payload),
      headers: await HttpHelper().setHttpHeaders(),
    );
  }
}
