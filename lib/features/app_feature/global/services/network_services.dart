import 'dart:convert';
import 'package:enhanced_ecommerce_app/features/app_feature/global/functions/fetch_remote_data.dart';
import 'package:http/http.dart' as http;

abstract class NetworkServices {
  Future<dynamic> postCheckSuccess({required String link, required Map body});
  Future<dynamic> postGetData({required String link, required Map body});
  Future<dynamic> postHomeData({required String link, required Map body});
}
