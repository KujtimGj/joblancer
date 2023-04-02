import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  String? id;
  final String publisher, title, payment_type, description,requirements,city;
  final String deadline, budget;
  final Timestamp createdAt;

  Post({
    this.id = '',
    required this.budget,
    required this.deadline,
    required this.description,
    required this.payment_type,
    required this.publisher,
    required this.title,
    required this.createdAt,
    required this.requirements,
    required this.city
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'publisher': publisher,
        'title': title,
        'payment_type': payment_type,
        'description': description,
        'deadline': deadline,
        'budget': budget,
        'createdAt': createdAt,
        'reqiurements':requirements,
        'city':city,
      };

  static Post fromJson(Map<String, dynamic> json) => Post(
        budget: json['budget'],
        deadline: json['deadline'],
        description: json['description'],
        payment_type: json['payment_type'],
        publisher: json['publisher'],
        title: json['title'],
        createdAt: json['createdAt'],
        requirements: json['requirements'],
        city: json['city'],
      );
}
