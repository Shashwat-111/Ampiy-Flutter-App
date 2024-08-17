// To parse this JSON data, do
//
//     final webSocketResponse = webSocketResponseFromJson(jsonString);

import 'dart:convert';

WebSocketResponse webSocketResponseFromJson(String str) => WebSocketResponse.fromJson(json.decode(str));

String webSocketResponseToJson(WebSocketResponse data) => json.encode(data.toJson());

class WebSocketResponse {
  final String? stream;
  final List<Datum>? data;

  WebSocketResponse({
    this.stream,
    this.data,
  });

  factory WebSocketResponse.fromJson(Map<String, dynamic> json) => WebSocketResponse(
    stream: json["stream"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "stream": stream,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  final T? t;
  final String? s;
  final String? datumP;
  final String? p;
  final String? c;
  final String? o;
  final String? h;
  final String? l;
  final String? b;
  final String? a;
  final String? cu;
  final String? au;
  final String? bu;

  Datum({
    this.t,
    this.s,
    this.datumP,
    this.p,
    this.c,
    this.o,
    this.h,
    this.l,
    this.b,
    this.a,
    this.cu,
    this.au,
    this.bu,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    t: tValues.map[json["T"]]!,
    s: json["s"],
    datumP: json["p"],
    p: json["P"],
    c: json["c"],
    o: json["o"],
    h: json["h"],
    l: json["l"],
    b: json["b"],
    a: json["a"],
    cu: json["cu"],
    au: json["au"],
    bu: json["bu"],
  );

  Map<String, dynamic> toJson() => {
    "T": tValues.reverse[t],
    "s": s,
    "p": datumP,
    "P": p,
    "c": c,
    "o": o,
    "h": h,
    "l": l,
    "b": b,
    "a": a,
    "cu": cu,
    "au": au,
    "bu": bu,
  };
}

enum T {
  FP_TCKR
}

final tValues = EnumValues({
  "fpTckr": T.FP_TCKR
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
