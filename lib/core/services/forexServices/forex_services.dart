import 'package:dio/dio.dart';
import 'package:exchange/core/models/exchance_model.dart';
import 'package:exchange/core/models/price_model.dart';
import 'package:intl/intl.dart';

class ForexService {
  String urlApi = '54O3KHBYrgovlpp0vUCdNSSteyam3SBI';
  Future<ExchanceModel?> exchange(
    int multiplayer,
    String time,
    DateTime from,
    DateTime to,
  ) async {
    String fromFormat = DateFormat('y-MM-d').format(from);

    String toFormat = DateFormat('y-MM-d').format(to);

    try {
      final resp = await Dio().get(
          'https://api.polygon.io/v2/aggs/ticker/C:USDCOP/range/$multiplayer/$time/$fromFormat/$toFormat?apiKey=$urlApi',
          options: Options(headers: {'Content-Type': 'application/json'}));

      ExchanceModel exchange = ExchanceModel.fromJson(resp.data);

      return exchange;
    } catch (e) {
      return null;
    }
  }

  Future<Price?> price() async {
    try {
      final resp = await Dio().get(
          'https://api.polygon.io/v2/aggs/ticker/C:USDCOP/prev?adjusted=true&apiKey=$urlApi',
          options: Options(headers: {'Content-Type': 'application/json'}));
      Price price = Price.fromJson(resp.data);

      return price;
    } catch (e) {
      return null;
    }
  }
}
