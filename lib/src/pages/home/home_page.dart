// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:exchange/src/pages/home/home_controller.dart';
import 'package:exchange/src/pages/home/widgets/chart_price.dart';
import 'package:exchange/src/utils/button_time.dart';
import 'package:exchange/src/utils/theme_util.dart';
import 'package:exchange/widgets/text_default.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: white,
        bottomNavigationBar: ConvexAppBar(
          color: blueJuno,
          activeColor: blueJuno,
          backgroundColor: white,
          items: const [
            TabItem(icon: Icons.home, title: ''),
            TabItem(icon: Icons.show_chart, title: ''),
            TabItem(icon: Icons.language, title: ''),
            TabItem(icon: Icons.swap_horiz, title: ''),
            TabItem(icon: Icons.apps, title: ''),
          ],
          initialActiveIndex: 1,
          onTap: (int i) => print('click index=$i'),
        ),
        body: SingleChildScrollView(
          child: GetBuilder<HomeController>(
              id: 'exchange',
              builder: (_) {
                return Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          const TextDefault(
                            text: 'Tasa de cambios',
                            fontWeight: FontWeight.bold,
                            colorText: neutral80,
                            sizetext: 22,
                          ),
                          const Spacer(),
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(52),
                                gradient: const LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [white, greenJuno],
                                )),
                            child: const Icon(
                              Icons.person_outline,
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 150,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: neutral10),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const TextDefault(
                                      sizetext: 55,
                                      colorText: neutral80,
                                      text: '\$'),
                                  TextDefault(
                                    sizetext: 60,
                                    colorText: neutral80,
                                    text: _.exchange?.results[0].vw
                                            .truncateToDouble()
                                            .toString() ??
                                        '',
                                    fontWeight: FontWeight.bold,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20.0),
                                    child: Container(
                                      height: 20,
                                      width: 50,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: blueJuno),
                                      child: const Center(
                                        child: TextDefault(
                                            sizetext: 15,
                                            colorText: white,
                                            text: 'COP'),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: Colors.transparent),
                                      child: const Center(
                                          child: Icon(
                                        Icons.info,
                                        size: 27,
                                        color: neutral80,
                                      )),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const TextDefault(
                                        sizetext: 24,
                                        colorText: black,
                                        text: '= 1 USD'),
                                    const Spacer(),
                                    TextDefault(
                                        sizetext: 15,
                                        colorText: blueJuno,
                                        text: _.formattedDate.toString()),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      const ChartPrice(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ButtonTime(
                              time: '24H',
                              changeTime: () {
                                _.getPriceDay();
                                _.update(['exchange']);
                              }),
                          ButtonTime(
                              time: '5D',
                              changeTime: () {
                                _.getPriceFiveDays();
                                _.update(['exchange']);
                              }),
                          ButtonTime(
                              time: '1M',
                              changeTime: () {
                                _.getPriceMounth();
                                _.update(['exchange']);
                              }),
                          ButtonTime(
                              time: '1A',
                              changeTime: () {
                                _.getPriceOneYear();
                                _.update(['exchange']);
                              }),
                          ButtonTime(
                              time: '2A',
                              changeTime: () {
                                _.getPriceTwoYears();
                                _.update(['exchange']);
                              }),
                        ],
                      )
                    ],
                  ),
                );
              }),
        ));
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final DateTime year;
  final double sales;
}
