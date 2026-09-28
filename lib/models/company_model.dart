class CompanyModel {
  const CompanyModel({
    required this.id,
    required this.nit,
    required this.companyName,
    required this.companyEmail,
    required this.ownerUserId,
    required this.createAt,
  });

  final String id;
  final String nit;
  final String companyName;
  final String companyEmail;
  final String ownerUserId;
  final DateTime createAt;

  CompanyModel copyWith({
    String? id,
    String? nit,
    String? companyName,
    String? companyEmail,
    String? ownerUserId,
    DateTime? createAt,
  }) {
    return CompanyModel(
      id: id ?? this.id,
      nit: nit ?? this.nit,
      companyName: companyName ?? this.companyName,
      companyEmail: companyEmail ?? this.companyEmail,
      ownerUserId: ownerUserId ?? this.ownerUserId,
      createAt: createAt ?? this.createAt,
    );
  }

  factory CompanyModel.fromJson(Map<String, dynamic> json) {
    return CompanyModel(
      id: json['id']?.toString() ?? '',
      nit: json['nit']?.toString() ?? '',
      companyName: json['company_name']?.toString() ?? '',
      companyEmail: json['company_email']?.toString() ?? '',
      ownerUserId: json['owner_user_id']?.toString() ?? '',
      createAt: DateTime.tryParse(json['create_at']?.toString() ?? '') ??
          DateTime.fromMillisecondsSinceEpoch(0),
    );
  }

  factory CompanyModel.empty() {
    return CompanyModel(
      id: '',
      nit: '',
      companyName: '',
      companyEmail: '',
      ownerUserId: '',
      createAt: DateTime.fromMillisecondsSinceEpoch(0),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nit': nit,
      'company_name': companyName,
      'company_email': companyEmail,
      'owner_user_id': ownerUserId,
      'create_at': createAt.toIso8601String(),
    };
  }
}
