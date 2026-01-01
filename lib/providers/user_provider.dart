import 'package:flutter/material.dart';

import '../data/models/user_model.dart';
import '../data/repositories/user_repository.dart';

class UserProvider with ChangeNotifier {
  final UserRepository userRepository;

  UserProvider({required this.userRepository});

  List<UserModel> _users = [];
  bool _isLoading = false;
  String _error = '';

  List<UserModel> get users => _users;
  bool get isLoading => _isLoading;
  String get error => _error;

  Future<void> getUsers() async {
    _isLoading = true;
    _error = '';
    notifyListeners();

    try {
      _users = await userRepository.fetchUsers();
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
