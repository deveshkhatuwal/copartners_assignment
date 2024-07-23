import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../../models/expert_model.dart';


class ExpertController with ChangeNotifier {
  List<Expert> _experts = [];
  Map<int, List<Expert>> _expertsByServiceType = {
    1: [], // Commodity
    2: [], // Equity
    3: [], // Options
  };

  List<Expert> get experts => _experts;
  Map<int, List<Expert>> get expertsByServiceType => _expertsByServiceType;

  Future<void> fetchExperts() async {
    const url = 'YOUR_API_ENDPOINT_URL'; // Replace with your API endpoint URL
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body)['data'];
        final List<Expert> loadedExperts = [];
        final Map<int, List<Expert>> categorizedExperts = {
          1: [],
          2: [],
          3: [],
        };

        for (var item in data) {
          final expert = Expert.fromJson(item['experts']);
          loadedExperts.add(expert);
          categorizedExperts[item['serviceType']]?.add(expert);
        }

        _experts = loadedExperts;
        _expertsByServiceType = categorizedExperts;
        notifyListeners();
      } else {
        throw Exception('Failed to load experts');
      }
    } catch (error) {
      rethrow;
    }
  }
}