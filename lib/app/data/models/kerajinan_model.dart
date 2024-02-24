class KerajinanModel {
  String? message;
  List<Data>? data;

  KerajinanModel({this.message, this.data});

  KerajinanModel.fromJson(Map<String, dynamic> json) {
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
  String? gambarKerajinan;
  String? nmKerajinan;
  String? deskripsi;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
      this.gambarKerajinan,
      this.nmKerajinan,
      this.deskripsi,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    gambarKerajinan = json['gambar_kerajinan'];
    nmKerajinan = json['nm_kerajinan'];
    deskripsi = json['deskripsi'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['gambar_kerajinan'] = this.gambarKerajinan;
    data['nm_kerajinan'] = this.nmKerajinan;
    data['deskripsi'] = this.deskripsi;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
