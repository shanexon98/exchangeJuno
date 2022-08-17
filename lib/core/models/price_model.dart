// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

Price PriceFromJson(String str) => Price.fromJson(json.decode(str));

String PriceToJson(Price data) => json.encode(data.toJson());

class Price {
  Price({
    required this.ticker,
    required this.queryCount,
    required this.resultsCount,
    required this.adjusted,
    required this.results,
    required this.status,
    required this.requestId,
    required this.count,
  });

  String ticker;
  int queryCount;
  int resultsCount;
  bool adjusted;
  List<Result> results;
  String status;
  String requestId;
  int count;

  factory Price.fromJson(Map<String, dynamic> json) => Price(
        ticker: json["ticker"],
        queryCount: json["queryCount"],
        resultsCount: json["resultsCount"],
        adjusted: json["adjusted"],
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        status: json["status"],
        requestId: json["request_id"],
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "ticker": ticker,
        "queryCount": queryCount,
        "resultsCount": resultsCount,
        "adjusted": adjusted,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "status": status,
        "request_id": requestId,
        "count": count,
      };
}

class Result {
  Result({
    required this.t,
    required this.v,
    required this.vw,
    required this.o,
    required this.c,
    required this.h,
    required this.l,
    required this.resultT,
    required this.n,
  });

  double v;
  double vw;
  double o;
  double c;
  double h;
  double l;
  double t;
  double n;
  double resultT;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        t: json["T"].toDouble(),
        v: json["v"].toDouble(),
        vw: json["vw"].toDouble(),
        o: json["o"].toDouble(),
        c: json["c"].toDouble(),
        h: json["h"].toDouble(),
        l: json["l"].toDouble(),
        resultT: json["t"],
        n: json["n"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "T": t,
        "v": v,
        "vw": vw,
        "o": o,
        "c": c,
        "h": h,
        "l": l,
        "t": resultT,
        "n": n,
      };
}
