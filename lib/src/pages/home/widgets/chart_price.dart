// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:exchange/src/utils/theme_util.dart';
import 'package:exchange/widgets/text_default.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../home_controller.dart';

class ChartPrice extends StatelessWidget {
  const ChartPrice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        id: 'exchange',
        builder: (_) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Container(
              height: 330,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), color: neutral10),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  const TextDefault(
                    sizetext: 15,
                    colorText: neutral80,
                    text: 'TRM USD > COP',
                    fontWeight: FontWeight.bold,
                  ),
                  SfCartesianChart(
                      crosshairBehavior: CrosshairBehavior(
                        enable: true,
                        //hideDelay: duration * 1000,
                        activationMode: ActivationMode.singleTap,
                        shouldAlwaysShow: true,
                        //lineType: _lineType
                      ),
                      zoomPanBehavior: ZoomPanBehavior(
                          // enableSelectionZooming: true,
                          enableDoubleTapZooming: true,
                          enablePinching: true),
                      primaryXAxis: CategoryAxis(
                          interval: 2,
                          majorGridLines: const MajorGridLines(width: 0)),
                      primaryYAxis: NumericAxis(
                          interval: 200,
                          majorGridLines: const MajorGridLines(width: 1)),
                      tooltipBehavior: TooltipBehavior(
                          color: neutral10,
                          format: _.formattedDate.toString(),
                          header: _.exchange?.results[0].vw
                                  .truncateToDouble()
                                  .toString() ??
                              '',
                          canShowMarker: true,
                          textStyle: const TextStyle(color: neutral80),
                          activationMode: ActivationMode.singleTap,
                          shouldAlwaysShow: true,
                          enable: true),
                      series: <ChartSeries>[
                        AreaSeries<ChartData, String>(
                            dataSource: _.chartData,
                            gradient: const LinearGradient(
                                begin: Alignment.center,
                                end: Alignment.bottomCenter,
                                colors: [greenJuno, white]),
                            xValueMapper: (ChartData price, _) => price.x,
                            yValueMapper: (ChartData sales, _) => sales.y)
                      ]),
                ],
              ),
            ),
          );
        });
  }
}
