import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/user_provider.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  void initState() {
    super.initState();
    // Fetch data when the screen loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<UserProvider>(context, listen: false).getAllUsers();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Clean API Call")),
      body: Consumer<UserProvider>(
        builder: (context, userProvider, child) {
          if (userProvider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (userProvider.errorMessage.isNotEmpty) {
            return Center(child: Text(userProvider.errorMessage));
          }

          return ListView.builder(
            itemCount: userProvider.users.length,
            itemBuilder: (context, index) {
              final user = userProvider.users[index];
              return ListTile(
                leading: CircleAvatar(child: Text(user.id.toString())),
                title: Text(user.name),
                subtitle: Text(user.email),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Provider.of<UserProvider>(context, listen: false).getAllUsers(),
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
