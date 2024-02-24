import 'dart:async';
import 'dart:typed_data';

import 'package:bjndiscover/app/data/models/wisata_model.dart';
import 'package:bjndiscover/app/modules/geotag/maps/utama.dart';
import 'package:bjndiscover/app/modules/home/controllers/home_controller.dart';
import 'package:bjndiscover/app/services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'page.dart';
import 'package:bjndiscover/constant.dart';
import '../controllers/geotag_controller.dart';

class PlaceSourcePage extends ExamplePage {
  PlaceSourcePage() : super(const Icon(Icons.place), 'Place source');

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class PlaceSymbolBody extends StatefulWidget {
  PlaceSymbolBody(this.datas);
  final WisataModel datas;
  var getController = Get.find<GeotagController>();

  @override
  State<StatefulWidget> createState() => PlaceSymbolBodyState(datas);
}

class PlaceSymbolBodyState extends State<PlaceSymbolBody> {
  PlaceSymbolBodyState(this.datas);
  final WisataModel datas;
  var getController = Get.find<GeotagController>();

  bool sourceAdded = false;
  bool layerAdded = false;
  List<Symbol> _symbols = []; // Simpan _symbols di sini
  late MapboxMapController controller;

  Future<void> _onMapCreated(MapboxMapController controller) async {
    this.controller = controller;

    // Remove existing layers
    // for (int i = 0; i < datas.data!.length; i++) {
    //   String layerId = datas.data![i].lAYERID.toString();
    //   await controller.removeLayer(layerId);
    // }

    for (int i = 0; i < datas.data!.length; i++) {
      String layerId = datas.data![i].latitude!.toString();
      await controller.removeLayer(layerId);
    }

    // // Add Image Source and Layer
    // for (int i = 0; i < datas.data!.length; i++) {
    //   String sourceId = datas.data![i].sOURCEID.toString();
    //   String layerId = datas.data![i].lAYERID.toString();
    //   Get.log(sourceId.toString());
    //   // await addImageSourceFromAsset(sourceId, 'images/tag.png', datas.data![i]);
    //   await addLayer(layerId, sourceId);
    // }

    // Add Marker
    for (int i = 0; i < datas.data!.length; i++) {
      // Add marker and save it to _symbols
      Symbol symbol = await controller.addSymbol(SymbolOptions(
        geometry: LatLng(datas.data![i].latitude!, datas.data![i].longitude!),
        iconImage: 'images/tag.png',
        iconSize: 2.0,
        textField: datas.data![i].nmWisata!,
        textOffset: Offset(0, -2.5),
        textSize: 12.0,
        iconOpacity: 1.0,
      ));
      _symbols.add(symbol);
    }

    // Callback when a marker is tapped
    controller.onSymbolTapped.add((symbol) {
      int tappedIndex = _symbols.indexOf(symbol);
      print("Marker clicked: ${datas.data![tappedIndex].nmWisata}");
      showPopupCard(context, datas.data![tappedIndex]);
    });

    setState(() => sourceAdded = true);
  }

  @override
  void dispose() {
    super.dispose();
  }

  /// Adds an asset image as a source to the currently displayed style
  Future<void> addImageSourceFromAsset(
      String imageSourceId, String assetName, Data data) async {
    final ByteData bytes = await rootBundle.load(assetName);
    final Uint8List list = bytes.buffer.asUint8List();
    return controller.addImageSource(imageSourceId, list,
        convertToKotak(data.latitude!.toDouble(), data.longitude!.toDouble()));
  }

  /// Update an asset image as a source to the currently displayed style
  // Future<void> updateImageSourceFromAsset(
  //     String imageSourceId, String assetName) async {
  //   final ByteData bytes = await rootBundle.load(assetName);
  //   final Uint8List list = bytes.buffer.asUint8List();
  //   return controller.updateImageSource(
  //     imageSourceId,
  //     list,
  //     const LatLngQuad(
  //       bottomRight: LatLng(-33.89884564291081, 151.25229835510254),
  //       bottomLeft: LatLng(-33.89884564291081, 151.20131492614746),
  //       topLeft: LatLng(-33.934601369931634, 151.20131492614746),
  //       topRight: LatLng(-33.934601369931634, 151.25229835510254),
  //     ),
  //   );
  // }

  Future<void> removeImageSource(String imageSourceId) {
    return controller.removeSource(imageSourceId);
  }

  Future<void> addLayer(String imageLayerId, String imageSourceId) {
    if (layerAdded) {
      removeLayer(imageLayerId);
    }
    setState(() => layerAdded = true);
    // return controller.addImageLayer(imageLayerId, imageSourceId);
    return controller.addImageLayer(imageLayerId, imageSourceId);
  }

  Future<void> addLayerBelow(
      String imageLayerId, String imageSourceId, String belowLayerId) {
    if (layerAdded) {
      removeLayer(imageLayerId);
    }
    setState(() => layerAdded = true);
    return controller.addImageLayerBelow(
        imageLayerId, imageSourceId, belowLayerId);
  }

  Future<void> removeLayer(String imageLayerId) {
    setState(() => layerAdded = false);
    return controller.removeLayer(imageLayerId);
  }

  LatLngQuad convertToKotak(double latitude, double longitude) {
    final LatLngQuad kotak = LatLngQuad(
        topLeft: LatLng(latitude + 0.0016, longitude - 0.0016),
        topRight: LatLng(latitude + 0.0016, longitude + 0.0016),
        bottomRight: LatLng(latitude - 0.0016, longitude + 0.0016),
        bottomLeft: LatLng(latitude - 0.0016, longitude - 0.0016));
    print("value : " + kotak.toString());
    return kotak;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        // Expanded(
        SizedBox(
            // height: 700.0,
            height: 500.0,
            child: Obx(
              () => MapboxMap(
                accessToken: MapsDemo.ACCESS_TOKEN,
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                  // target: LatLng(-33.852, 151.211),
                  // Koordinat Bojonegoro
                  target: getController.isLoading.value
                      ? LatLng(-7.1579, 111.8819)
                      : LatLng(getController.position!.latitude,
                          getController.position!.longitude),
                  // target: LatLng(-33.852, 151.211),
                  zoom: 13.0,
                ),
              ),
            ))
        // ),
        // Expanded(
        //   child: SingleChildScrollView(
        //     child: Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //       children: <Widget>[
        //         Column(
        //           children: <Widget>[
        //             TextButton(
        //               child: const Text('Add source (asset image)'),
        //               onPressed: sourceAdded
        //                   ? null
        //                   : () {
        //                       addImageSourceFromAsset(
        //                               SOURCE_ID, 'assets/sydney.png')
        //                           .then((value) {
        //                         setState(() => sourceAdded = true);
        //                       });
        //                     },
        //             ),
        //             TextButton(
        //               child: const Text('Update source (asset image)'),
        //               onPressed: !sourceAdded
        //                   ? null
        //                   : () {
        //                       // updateImageSourceFromAsset(SOURCE_ID,
        //                       //         'assets/symbols/custom-icon.png')
        //                       //     .then((value) {
        //                       //   setState(() => sourceAdded = true);
        //                       // });
        //                     },
        //             ),
        //             TextButton(
        //               child: const Text('Remove source (asset image)'),
        //               onPressed: sourceAdded
        //                   ? () async {
        //                       await removeLayer(LAYER_ID);
        //                       removeImageSource(SOURCE_ID).then((value) {
        //                         setState(() => sourceAdded = false);
        //                       });
        //                     }
        //                   : null,
        //             ),
        //             TextButton(
        //               child: const Text('Show layer'),
        //               onPressed: sourceAdded
        //                   ? () => addLayer(LAYER_ID, SOURCE_ID)
        //                   : null,
        //             ),
        //             TextButton(
        //               child: const Text('Show layer below water'),
        //               onPressed: sourceAdded
        //                   ? () => addLayerBelow(LAYER_ID, SOURCE_ID, 'water')
        //                   : null,
        //             ),
        //             TextButton(
        //               child: const Text('Hide layer'),
        //               onPressed:
        //                   sourceAdded ? () => removeLayer(LAYER_ID) : null,
        //             ),
        //           ],
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
      ],
    );
  }
}

void showPopupCard(BuildContext context, Data data) {
  HomeController homeController = Get.find<HomeController>();
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        // alignment: Alignment.bottomCenter,
        child: Container(
          padding: EdgeInsets.all(8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  // Gambar
                  Container(
                    width: 80,
                    height: 110,
                    margin: EdgeInsets.only(right: 16),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.all(Radius.circular(4.0)),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          '${baseApiUrl}${data.gambarWisata}' ?? '',
                        ),
                      ),
                    ),
                  ),
                  // Nama Wisata dan Alamat Wisata
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data.nmWisata ?? '',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Lat: ${data.latitude ?? ''}',
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          'Long: ${data.longitude ?? ''}',
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Align(
                              alignment: Alignment.topCenter,
                              child:
                                  Icon(Icons.location_on, color: Colors.green),
                            ),

                            SizedBox(width: 8.0),
                            // Teks alamat
                            Expanded(
                              child: Text(
                                data.alamatWisata ?? '',
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  fontSize: 10,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  // Tombol Bookmark
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Column(
                      children: [
                        IconButton(
                          onPressed: () {
                            // Logika Bookmark
                            homeController
                                .toggleFavorite(data.nmWisata.toString());
                            Navigator.of(context).pop();
                            // Close the dialog
                            // Navigator.of(context).pop();
                          },
                          icon: Stack(
                            children: [
                              // Ikon utama (berisi warna putih)
                              Icon(
                                Icons.bookmark,
                                color: homeController
                                        .isFavorite(data.nmWisata.toString())
                                    ? primaryColor
                                    : Colors.grey,
                                size: 30.0,
                              ),
                              // Ikon tepi (berisi garis hitam tipis)
                              Positioned.fill(
                                child: Icon(
                                  Icons.bookmark,
                                  color: homeController
                                          .isFavorite(data.nmWisata.toString())
                                      ? primaryColor
                                      : Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Tambahkan ikon navigasi di sini
                        // IconButton(
                        //   onPressed: () {
                        //     // Logika untuk navigasi ke halaman lain
                        //     // ...
                        //   },
                        //   icon: Icon(
                        //     Icons.navigate_next,
                        //     color: Colors.grey,
                        //     size: 30.0,
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  ).then((value) {
    // Logika setelah dialog ditutup
  });
}
