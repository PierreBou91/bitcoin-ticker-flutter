import 'dart:convert';

import 'package:http/http.dart' as http;

const baseURL = 'https://rest.coinapi.io';
const exchangeRateExtention = '/v1/exchangerate';
const apiKey = '4DC89FCB-4C7D-4479-8A56-DAB18341A62E';

class NetworkHelper {
  NetworkHelper({this.crypto, this.curr});
  String crypto;
  String curr;

  Future getData() async {
    http.Response response = await http
        .get('$baseURL$exchangeRateExtention/$crypto/$curr?apikey=$apiKey');
    if (response.statusCode == 200) {
      String data = response.body;
      print(data);
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
