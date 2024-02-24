import 'dart:io';

import 'package:bjndiscover/app/data/models/fasilitas_model.dart';
import 'package:bjndiscover/app/data/models/favorite_model.dart';
import 'package:bjndiscover/app/data/models/kerajinan_model.dart';
import 'package:bjndiscover/app/data/models/kesenian_model.dart';
import 'package:bjndiscover/app/data/models/kuliner_model.dart';
import 'package:bjndiscover/app/data/models/wisata_model.dart';
import 'package:get/get.dart';

class ApiService extends GetConnect {
  //Api untuk menampilkan data wisata
  Future<WisataModel> getAllWisata() async {
    final Map<String, String> httpHeaders = {
      HttpHeaders.contentTypeHeader: "application/json",
      "Connection": "Keep-Alive",
      "Keep-Alive": "timeout=5, max=1000"
    };

    final response = await get(
        'https://geoskripsi.official-ekata.com/api/wisata',
        headers: httpHeaders);
    var dataResponse = response.body;
    WisataModel model = WisataModel.fromJson(dataResponse);
    return model;
  }

  Future<List<WisataModel>> getAllWisataByKategori(String kategori) async {
    final response =
        await get('https://geoskripsi.official-ekata.com/api/wisata');
    var dataResponse = response.body as List;
    List<WisataModel> modelList =
        dataResponse.map((item) => WisataModel.fromJson(item)).toList();
    return modelList;
  }

  Future<List<WisataModel>> getWisataByName(String nmWisata) async {
    try {
      final response = await get(
        'https://geoskripsi.official-ekata.com/api/wisata', // Replace with your actual API endpoint
        query: {'nmWisata': nmWisata},
      );
      // Parse the response and return the appropriate data model
      var dataResponse = response.body as List;
      List<WisataModel> modelList =
          dataResponse.map((item) => WisataModel.fromJson(item)).toList();
      return modelList;
    } catch (error) {
      throw Exception('Error getting wisata by name: $error');
    }
  }

  //Api untuk menampilkan data kesenian
  Future<KesenianModel> getAllKesenian() async {
    final response =
        await get('https://geoskripsi.official-ekata.com/api/kesenian');
    var dataResponse = response.body;
    KesenianModel model = KesenianModel.fromJson(dataResponse);
    return model;
  }

  //Api untuk menampilkan data kerajinan
  Future<KerajinanModel> getAllKerajinan() async {
    final response =
        await get('https://geoskripsi.official-ekata.com/api/kerajinan');
    var dataResponse = response.body;
    KerajinanModel model = KerajinanModel.fromJson(dataResponse);
    return model;
  }

  //Api untuk menampilkan data kerajinan
  Future<KulinerModel> getAllKuliner() async {
    final response =
        await get('https://geoskripsi.official-ekata.com/api/kuliner');
    var dataResponse = response.body;
    KulinerModel model = KulinerModel.fromJson(dataResponse);
    return model;
  }

  //Api untuk Fasilitas
  Future<FasilitasModel> getAllFasilitas() async {
    final Map<String, String> httpHeaders = {
      HttpHeaders.contentTypeHeader: "application/json",
      "Connection": "Keep-Alive",
      "Keep-Alive": "timeout=5, max=1000"
    };

    final response = await get(
        'https://geoskripsi.official-ekata.com/api/fasilitas',
        headers: httpHeaders);
    var dataResponse = response.body;
    FasilitasModel model = FasilitasModel.fromJson(dataResponse);
    return model;
  }

  // Future<FavoriteModel> getAllFavorite() async {
  //   final response = await get('http://10.0.2.2:8000/api/favorite');
  //   var dataResponse = response.body;
  //   FavoriteModel model = FavoriteModel.fromJson(dataResponse);
  //   return model;
  // }

  Future<void> deleteFavorite(int id) async {
    try {
      final response = await delete(
        'https://geoskripsi.official-ekata.com/api/favorite/hapus/$id',
      );

      if (response.statusCode == 200) {
        print('Favorite deleted successfully.');
      } else {
        throw Exception('Failed to delete favorite');
      }
    } catch (error) {
      print('Error deleting favorite: $error');
      throw error;
    }
  }

  // Future<void> addFav(WisataModel wisataModel) async {
  //   try {
  //     final response = await post(
  //       'http://10.0.2.2:8000/api/create',
  //       wisataModel.toJson(), // Assuming toJson() returns a Map
  //     );

  //     if (response.statusCode == 200) {
  //       print('Data created successfully.');
  //     } else {
  //       throw Exception('Failed to create data');
  //     }
  //   } catch (error) {
  //     print('Error creating data: $error');
  //     throw error; // You can choose to throw or handle the error here.
  //   }
  // }
}
