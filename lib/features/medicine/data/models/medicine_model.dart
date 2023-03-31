import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class MedicineModel extends Equatable {
  final String id;
  final int medicineCategoryIndex;
  final String medicineCategoryName;
  final String medicineName;
  final double dose;
  final String doseType;
  final String stomach;
  final DateTime time;
  final String? comments;
  const MedicineModel({
    required this.id,
    required this.medicineCategoryIndex,
    required this.medicineCategoryName,
    required this.medicineName,
    required this.dose,
    required this.doseType,
    required this.stomach,
    required this.time,
    this.comments,
  });

  @override
  List<Object?> get props {
    return [
      id,
      medicineCategoryIndex,
      medicineCategoryName,
      medicineName,
      dose,
      doseType,
      stomach,
      time,
      comments,
    ];
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'medicineCategoryIndex': medicineCategoryIndex,
        'medicineCategoryName': medicineCategoryName,
        'medicineName': medicineName,
        'dose': dose,
        'doseType': doseType,
        'stomach': stomach,
        'time': time.millisecondsSinceEpoch,
        'comments': comments
      };

  factory MedicineModel.fromJson(Map<String, dynamic> json) {
    return MedicineModel(
      id: json['id'],
      medicineCategoryIndex: json['medicineCategoryIndex']!.toInt(),
      medicineCategoryName: json['medicineCategoryName'],
      medicineName: json['medicineName'],
      dose: json['dose']!.toDouble(),
      doseType: json['doseType'],
      stomach: json['stomach'],
      time: DateTime.fromMillisecondsSinceEpoch(json['time']),
      comments: json['comments'],
    );
  }

  factory MedicineModel.fromQueryDocumentSnapshot(
      QueryDocumentSnapshot snapshot) {
    return MedicineModel.fromJson(
        {...snapshot.data() as Map<String, dynamic>, 'id': snapshot.id});
  }
}
