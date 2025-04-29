// product_service.dart
import 'dart:convert';
import 'dart:io';
import 'package:davipel_comex/helpers/http_helper.dart';
import 'package:davipel_comex/models/responses/product_model.dart';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';

class ProductService {
  final String baseUrl;

  ProductService({required this.baseUrl});

  Future<http.Client> _getUnverifiedClient() async {
    final HttpClient customHttpClient = HttpClient()
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;

    return IOClient(customHttpClient);
  }

  Future<List<ProductModel>> fetchProducts() async {
    try {
      final client = await _getUnverifiedClient();
      final response = await client.get(Uri.parse('$baseUrl', ),  headers: await HttpHelper().setHttpHeaders(),);

      if (response.statusCode == 200) {
        // First decode the response body
        final decodedBody = utf8.decode(response.bodyBytes);

        // Handle any escaped characters
        final sanitizedBody = decodedBody
            .replaceAll(r'\"', '"')  // Unescape quotes
            .replaceAll(r"\'", "'");  // Unescape apostrophes

        // Parse the JSON
        final List<dynamic> data = json.decode(sanitizedBody)['success'];

        return data.map((json) => ProductModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load products: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load products: $e');
    }
  }
}