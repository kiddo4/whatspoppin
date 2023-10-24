// To parse this JSON data, do
//
//     final popItem = popItemFromJson(jsonString);

import 'dart:convert';

List<PopItem> popItemFromJson(String str) => List<PopItem>.from(json.decode(str));

String popItemToJson(List<PopItem> data) => json.encode(List<dynamic>.from(data.map((e) => e.toJson())));

class PopItem {
    int id;
    String text;

    PopItem({
        required this.id,
        required this.text,
    });

    factory PopItem.fromJson(Map<String, dynamic> json) => PopItem(
        id: json["id"],
        text: json["text"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "text": text,
    };
}
