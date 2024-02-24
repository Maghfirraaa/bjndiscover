class FavoriteModel {
  String? message;
  List<Data>? data;

  FavoriteModel({this.message, this.data});

  FavoriteModel.fromJson(Map<String, dynamic> json) {
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
  String? gambarWisata;
  String? nmWisata;
  String? kategori;
  String? alamatWisata;
  double? latitude;
  double? longitude;
  String? deskripsi;
  String? fasilitas;
  String? jamOperasional;
  String? telepon;
  String? hrgTiket;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
      this.gambarWisata,
      this.nmWisata,
      this.kategori,
      this.alamatWisata,
      this.latitude,
      this.longitude,
      this.deskripsi,
      this.fasilitas,
      this.jamOperasional,
      this.telepon,
      this.hrgTiket,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    gambarWisata = json['gambar_wisata'];
    nmWisata = json['nm_wisata'];
    kategori = json['kategori'];
    alamatWisata = json['alamat_wisata'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    deskripsi = json['deskripsi'];
    fasilitas = json['fasilitas'];
    jamOperasional = json['jam_operasional'];
    telepon = json['telepon'];
    hrgTiket = json['hrg_tiket'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['gambar_wisata'] = this.gambarWisata;
    data['nm_wisata'] = this.nmWisata;
    data['kategori'] = this.kategori;
    data['alamat_wisata'] = this.alamatWisata;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['deskripsi'] = this.deskripsi;
    data['fasilitas'] = this.fasilitas;
    data['jam_operasional'] = this.jamOperasional;
    data['telepon'] = this.telepon;
    data['hrg_tiket'] = this.hrgTiket;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
