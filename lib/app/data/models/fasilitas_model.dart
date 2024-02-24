class FasilitasModel {
  String? message;
  List<Data>? data;

  FasilitasModel({this.message, this.data});

  FasilitasModel.fromJson(Map<String, dynamic> json) {
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
  String? nmFasilitas;
  String? kategori;
  String? alamat;
  String? telepon;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
      this.nmFasilitas,
      this.kategori,
      this.alamat,
      this.telepon,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nmFasilitas = json['nm_fasilitas'];
    kategori = json['kategori'];
    alamat = json['alamat'];
    telepon = json['telepon'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nm_fasilitas'] = this.nmFasilitas;
    data['kategori'] = this.kategori;
    data['alamat'] = this.alamat;
    data['telepon'] = this.telepon;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
