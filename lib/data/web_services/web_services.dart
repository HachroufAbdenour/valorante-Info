import 'dart:ffi';
import 'package:http/http.dart' as http;
import 'package:valorantegame/constant/constant.dart';

class WebService {
  
  Future<dynamic> getAgents() async {
    final response = await http.get(Uri.parse(apiUrl));

    return response; 
  }
}
