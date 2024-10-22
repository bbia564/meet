import 'dart:typed_data';

class HallEntity {
  int id;
  DateTime createTime;
  Uint8List imageData;
  String title;
  int totalSeat;
  String description;
  int usedSeat;

  HallEntity({
    required this.id,
    required this.createTime,
    required this.imageData,
    required this.title,
    required this.totalSeat,
    required this.description,
    required this.usedSeat,
  });

  factory HallEntity.fromJson(Map<String, dynamic> json) {
    return HallEntity(
      id: json['id'],
      createTime: DateTime.parse(json['createTime']),
      imageData: json['imageData'],
      title: json['title'],
      totalSeat: json['totalSeat'],
      description: json['description'],
      usedSeat: json['usedSeat'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'createTime': createTime.toIso8601String(),
      'imageData': imageData,
      'title': title,
      'totalSeat': totalSeat,
      'description': description,
      'usedSeat': usedSeat,
    };
  }

  bool get isUsed => usedSeat > 0;
}