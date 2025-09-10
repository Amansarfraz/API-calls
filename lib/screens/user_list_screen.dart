import 'package:flutter/material.dart';
import '../model/user.dart';
import '../model/user_response.dart';
import '../services/api_service.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  final ApiService _apiService = ApiService();
  final List<User> _users = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _fetchUsers();
  }

  Future<void> _fetchUsers() async {
    setState(() => _isLoading = true);
    try {
      final UserResponse userResponse = await _apiService.fetchUsers(10);
      setState(() {
        _users.addAll(userResponse.results ?? []);
      });
    } catch (e) {
      debugPrint("❌ Error fetching users: $e");
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Random Users")),
      body: _isLoading && _users.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: _fetchUsers,
              child: ListView.builder(
                itemCount: _users.length,
                itemBuilder: (context, index) {
                  final user = _users[index];
                  final imageUrl =
                      user.picture?.large ??
                      user.picture?.medium ??
                      user.picture?.thumbnail ??
                      "https://via.placeholder.com/150";

                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(imageUrl),
                      onBackgroundImageError: (_, __) {},
                      child: user.picture == null
                          ? const Icon(Icons.person, color: Colors.white)
                          : null,
                    ),
                    title: Text(
                      "${user.name?.first ?? ''} ${user.name?.last ?? ''}",
                    ),
                    subtitle: Text(user.email ?? "No email"),
                  );
                },
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _fetchUsers,
        child: const Icon(Icons.add),
      ),
    );
  }
}
