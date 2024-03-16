class ModelPegawai {
  ModelPegawai({
    required this.isSuccess,
    required this.message,
    required this.data,
  });
  late final bool isSuccess;
  late final String message;
  late final List<Datum> data;

  ModelPegawai.fromJson(Map<String, dynamic> json) {
    isSuccess = json['isSuccess'];
    message = json['message'];
    data = List.from(json['data']).map((e) => Datum.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['isSuccess'] = isSuccess;
    _data['message'] = message;
    _data['data'] = data.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Datum {
  Datum({
    required this.id,
    required this.noBp,
    required this.noHp,
    required this.email,
    required this.createdAt,
    required this.updatedAt,
  });
  late final String id;
  late final String noBp;
  late final String noHp;
  late final String email;
  late final String createdAt;
  late final String updatedAt;

  Datum.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    noBp = json['no_bp'];
    noHp = json['no_hp'];
    email = json['email'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['no_bp'] = noBp;
    _data['no_hp'] = noHp;
    _data['email'] = email;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}
