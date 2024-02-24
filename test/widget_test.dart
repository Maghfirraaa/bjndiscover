import 'package:bjndiscover/app/services/api_services.dart';

void main() async {
  widgetTest();
  widgetTest2();
}

void widgetTest() async {
  ApiService coba = ApiService();
  final response = await coba.getAllWisata();
  print(response);
}

void widgetTest2() async {
  ApiService coba = ApiService();
  final response = await coba.getAllKesenian();
  print(response);
}
