import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class MedicineFam extends Equatable {
  final String id;
  final String title;
  final String image;
  final double price;
  const MedicineFam({
    required this.id,
    required this.title,
    required this.image,
    required this.price,
  });

  @override
  List<Object> get props => [id, title, image, price];

  Map<String, dynamic> toJson() =>
      {'id': id, 'title': title, 'image': image, 'price': price};

  factory MedicineFam.fromJson(Map<String, dynamic> json) {
    return MedicineFam(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      image: json['image'] ?? '',
      price: json['price']?.toDouble() ?? 0.0,
    );
  }

  factory MedicineFam.fromQuerySnapshot(
      QueryDocumentSnapshot<Map<String, dynamic>> snapshot) {
    return MedicineFam.fromJson({...snapshot.data(), 'id': snapshot.id});
  }
}
