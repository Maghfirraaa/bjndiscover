class KesenianModel {
  String? message;
  List<Data>? data;

  KesenianModel({this.message, this.data});

  KesenianModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? gambarKesenian;
  String? nmKesenian;
  String? deskripsi;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
      this.gambarKesenian,
      this.nmKesenian,
      this.deskripsi,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    gambarKesenian = json['gambar_kesenian'];
    nmKesenian = json['nm_kesenian'];
    deskripsi = json['deskripsi'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['gambar_kesenian'] = this.gambarKesenian;
    data['nm_kesenian'] = this.nmKesenian;
    data['deskripsi'] = this.deskripsi;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
