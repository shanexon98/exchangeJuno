// ignore_for_file: avoid_init_to_null, import_of_legacy_library_into_null_safe, avoid_function_literals_in_foreach_calls

import 'package:exchange/core/models/exchance_model.dart';
import 'package:exchange/core/models/price_model.dart';
import 'package:exchange/core/services/forexServices/forex_services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomeController extends GetxController {
  final forexService = ForexService();
  ExchanceModel? exchange = null;
  Price? price = null;
  DateTime dateNow = DateTime.now();
  String formattedDate = DateFormat('MMMM d H:m a ').format(DateTime.now());

  List<ChartData> chartData = [];

  getPrice() async {
    price = await forexService.price();

    price?.results.forEach(
      (element) {
        element.vw;
      },
    );
    update(['exchange']);
  }

  getPriceDay() async {
    chartData = [];

    exchange = await forexService.exchange(
        60, 'minute', dateNow.subtract(const Duration(days: 1)), dateNow);

    for (var i = 0; i < exchange!.results.length; i++) {
      chartData.add(ChartData(i.toString(), exchange!.results[i].vw.toInt()));
    }

    update(['exchange']);
  }

  getPriceFiveDays() async {
    chartData = [];
    exchange = await forexService.exchange(
        1, 'hour', dateNow.subtract(const Duration(days: 5)), dateNow);
    for (var i = 0; i < exchange!.results.length; i++) {
      chartData.add(ChartData(i.toString(), exchange!.results[i].vw.toInt()));
    }
    update(['exchange']);
  }

  getPriceMounth() async {
    chartData = [];

    exchange = await forexService.exchange(
        10, 'hour', dateNow.subtract(const Duration(days: 30)), dateNow);

    for (var i = 0; i < exchange!.results.length; i++) {
      chartData.add(ChartData(i.toString(), exchange!.results[i].vw.toInt()));
    }

    update(['exchange']);
  }

  getPriceOneYear() async {
    chartData = [];

    exchange = await forexService.exchange(
        2, 'week', dateNow.subtract(const Duration(days: 365)), dateNow);

    for (var i = 0; i < exchange!.results.length; i++) {
      chartData.add(ChartData(i.toString(), exchange!.results[i].vw.toInt()));
    }

    update(['exchange']);
  }

  getPriceTwoYears() async {
    chartData = [];

    exchange = await forexService.exchange(
        4, 'week', dateNow.subtract(const Duration(days: 730)), dateNow);

    for (var i = 0; i < exchange!.results.length; i++) {
      chartData.add(ChartData(i.toString(), exchange!.results[i].vw.toInt()));
    }

    update(['exchange']);
  }

  @override
  void onInit() {
    super.onInit();
    getPriceDay();
  }
}

class ChartData {
  ChartData(this.x, this.y);
  final String x;
  final int y;
}
