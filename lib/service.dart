import 'dart:convert';

import 'package:flutter_charts/model.dart';
import 'package:http/http.dart' as http;


/// A service class that interacts with the API to fetch cryptocurrency data.
class ApiService {
  /// The base URL for the API endpoint.
  static const String _baseUrl =
      "https://financialmodelingprep.com/api/v3/quote/BTCUSD?apikey=dZL39ZlGDHhzl2tzz6LozcjznJEuvumj";

  /// Fetches the latest cryptocurrency data from the API.
  ///
  /// Returns a [Future] that completes with a [CryptoModel] object containing
  /// the data. Throws an [Exception] if the request fails.
  static Future<CryptoModel> getApiData() async {
    // Send a GET request to the API endpoint.
    final response = await http.get(Uri.parse(_baseUrl));

    // Check if the response was successful (HTTP status code 200).
    if (response.statusCode == 200) {
      // Parse the response body as JSON and extract the first element.
      var data = json.decode(response.body);
      return CryptoModel.fromJson(data[0]);
    } else {
      // Throw an exception if the request failed.
      throw Exception('Failed to load data');
    }
  }
}
