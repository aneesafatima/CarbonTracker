import 'dart:convert';

import 'package:template_flutter/database/models/base_model.dart';


class User extends BaseModel {
  final List<dynamic>? preferredTransports;
  final List<dynamic>? frequentTransports;
  final String trackingMode = "refresh"; // Default tracking mode; other modes will be supported later
  final double? weight;
  final String? sustainabilityThoughts;
  final int? lastResetMonth;
  final int? lastResetYear;

  // Constructor with named parameters and default values

  User({
    super.id,
    required this.preferredTransports,
    required this.frequentTransports,
    required this.weight,
    this.sustainabilityThoughts,
    required this.lastResetMonth,
    required this.lastResetYear,
  });

  //Named constructor to create a User from a Map

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      preferredTransports: jsonDecode(map['preferred_transports']),
      frequentTransports: jsonDecode(map['frequent_transports']),
      weight: map['weight'],
      sustainabilityThoughts: map['sustainability_thoughts'],
      lastResetMonth: map['last_reset_month'],
      lastResetYear: map['last_reset_year'],
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'preferred_transports': jsonEncode(preferredTransports),
      'frequent_transports': jsonEncode(frequentTransports),
      'tracking_mode': trackingMode,
      'weight': weight,
      'sustainability_thoughts': sustainabilityThoughts,
      'last_reset_month': lastResetMonth,
      'last_reset_year': lastResetYear,
    };
  }
}
