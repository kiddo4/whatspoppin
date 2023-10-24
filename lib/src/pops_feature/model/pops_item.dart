// To parse this JSON data, do
//
//     final popItem = popItemFromJson(jsonString);

import 'dart:convert';

PopItem popItemFromJson(String str) => PopItem.fromJson(json.decode(str));

String popItemToJson(PopItem data) => json.encode(data.toJson());

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
