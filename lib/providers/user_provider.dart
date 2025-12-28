import 'package:flutter/material.dart';

import '../data/models/user_model.dart';
import '../data/services/api_service.dart';

class UserProvider with ChangeNotifier {
  final ApiService _apiService = ApiService();

  List<User> _users = [];
  bool _isLoading = false;
  String _errorMessage = '';

  List<User> get users => _users;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  Future<void> getAllUsers() async {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners(); // Show loading spinner

    try {
      _users = await _apiService.fetchUsers();
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners(); // Hide spinner and show data/error
    }
  }
}
