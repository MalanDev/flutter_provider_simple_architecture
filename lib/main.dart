import 'package:flutter/material.dart';
import 'package:flutter_provider_simple_architecture/data/services/api_client.dart';
import 'package:flutter_provider_simple_architecture/ui/screens/user_screen.dart';
import 'package:provider/provider.dart';

import 'data/repositories/user_repository.dart';
import 'providers/user_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // 1. Create ApiClient
    final apiClient = ApiClient();
    // 2. Create Repository using ApiClient
    final userRepository = UserRepository(apiClient: apiClient);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserProvider(userRepository: userRepository),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Dio Provider Demo',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const UserScreen(),
      ),
    );
  }
}
