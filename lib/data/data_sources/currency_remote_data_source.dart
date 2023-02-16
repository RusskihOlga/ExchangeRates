import 'dart:convert';

import 'package:exchange_rates/core/client.dart';
import 'package:exchange_rates/data/models/rate_json.dart';
import 'package:exchange_rates/data/models/result_currency_json.dart';
import 'package:flutter_network_connectivity/flutter_network_connectivity.dart';

class CurrencyRemoteDataSource {
  final Client client;
  final FlutterNetworkConnectivity _flutterNetworkConnectivity =
      FlutterNetworkConnectivity(lookUpUrl: "google.com");

  CurrencyRemoteDataSource({required this.client});

  Future<ResultCurrencyJson> getCurrencies() async {
    if (await _flutterNetworkConnectivity.isInternetConnectionAvailable()) {
      try {
        var response = await client.getData("daily_json.js");
        return ResultCurrencyJson.fromJson(jsonDecode(response));
      } catch (e) {
        throw Exception();
      }
    } else {
      throw Exception();
    }
  }

  Future<RateJson> getLastCurrencies() async {
    if (await _flutterNetworkConnectivity.isInternetConnectionAvailable()) {
      try {
        var response = await client.getData("latest.js");
        return RateJson.fromJson(jsonDecode(response));
      } catch (e) {
        throw Exception();
      }
    } else {
      throw Exception();
    }
  }

  Future<ResultCurrencyJson?> getArchives(String dateTime) async {
    if (await _flutterNetworkConnectivity.isInternetConnectionAvailable()) {
      try {
        var response = await client.getData("archive/$dateTime/daily_json.js");
        return ResultCurrencyJson.fromJson(jsonDecode(response));
      } catch (e) {
        return null;
      }
    } else {
      throw Exception();
    }
  }
}
