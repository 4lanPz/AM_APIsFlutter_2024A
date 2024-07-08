import 'package:flutter/material.dart';
import '../models/gato.dart';
import '../services/gato_api_service.dart';

class GatoProvider with ChangeNotifier {
  final ApiService _apiService = ApiService();
  List<Gato> _gatoList = [];
  bool _isLoading = false;

  List<Gato> get gatoList => _gatoList;
  bool get isLoading => _isLoading;

  Future<void> fetchgato() async {
    _isLoading = true;
    notifyListeners();

    _gatoList = await _apiService.fetchGatoList();
    _isLoading = false;
    notifyListeners();
  }
}
