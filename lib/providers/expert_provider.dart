import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ExpertProvider with ChangeNotifier {
  List<dynamic> _optionsExperts = [];
  List<dynamic> _commodityExperts = [];
  List<dynamic> _equityExperts = [];

  List<dynamic> get optionsExperts => _optionsExperts;
  List<dynamic> get commodityExperts => _commodityExperts;
  List<dynamic> get equityExperts => _equityExperts;
  bool _isLoading = false;
  String? _error;
  bool get isLoading => _isLoading;
  String? get error => _error;
  Future<void> fetchExperts() async {
    _isLoading = true;

    const url = 'https://copartners.in/SubscriptionService/api/Subscription/GetByExpertsId/c541a503-d267-4652-ceb8-08dca55ffcba';
    try {
      final response = await http.get(Uri.parse(url));
log(response.statusCode.toString());
      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (data['isSuccess']) {

          final List<dynamic> experts = data['data'];
          log(experts[4]['serviceType']);
          _optionsExperts = experts.where((e) => e['serviceType'] == '1').toList();
          _commodityExperts = experts.where((e) => e['serviceType'] == '2').toList();
          _equityExperts = experts.where((e) => e['serviceType'] == '3').toList();
          print(_optionsExperts);
          await Future.delayed(const Duration(seconds: 3));
          _isLoading = false;

          notifyListeners();
        } else {
          // Handle the case when isSuccess is false
          print('API request failed: ${data['message']}'); // Log the error message
        }
      } else {
        // Handle the case when the response status code is not 200
        print('HTTP request failed with status code: ${response.statusCode}');
      }
    } catch (error) {
      // Handle errors, e.g., network issues
      _isLoading= false;
      _error = 'Error while loading Data';
      print('Error fetching experts: $error');
    }

  }
  void cleardata(){
    _error = null;
    _isLoading = false;
  }
//   Future<void> fetchExperts() async {
//     log("fetching expert");
//
//     const url = 'https://copartners.in/SubscriptionService/api/Subscription/GetByExpertsId/c541a503-d267-4652-ceb8-08dca55ffcba';
//
//
//     try {
//       log("200 response api");
//
//       final response = await http.get(Uri.parse(url));
//       log(response.statusCode as String);
//
//       if (response.statusCode == 200) {
//
//         final data = json.decode(response.body);
//         log(data);
//         if (data['isSuccess']) {
// log("success response api");
//           final List<dynamic> experts = data['data'];
//           _optionsExperts = experts.where((e) => e['serviceType'] == '1').toList();
//           _commodityExperts = experts.where((e) => e['serviceType'] == '2').toList();
//           _equityExperts = experts.where((e) => e['serviceType'] == '3').toList();
//
//           notifyListeners();
//         } else {
//           log(response.statusCode.toString());
//           // Handle the case when isSuccess is false
//         }
//       } else {
//         // Handle the case when the response status code is not 200
//       }
//     } catch (error) {
//       // Handle errors, e.g., network issues
//     }
//   }
}