import '../models/user_model.dart'; // Assume you have a user model
import '../services/api_client.dart';

class UserRepository {
  final ApiClient apiClient;

  UserRepository({required this.apiClient});

  Future<List<UserModel>> fetchUsers() async {
    try {
      final response = await apiClient.dio.get('/users');
      // Map response data to UserModel list
      return (response.data as List).map((e) => UserModel.fromJson(e)).toList();
    } catch (e) {
      rethrow;
    }
  }
}
