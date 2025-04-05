import 'package:flutter/material.dart';
import '/api/apis.dart';
import '/models/user_model.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _nameControl = TextEditingController();
  final TextEditingController _emailControl = TextEditingController();
  final TextEditingController _passwordControl = TextEditingController();

  List<UserModel> _users = [];

  @override
  void initState() {
    super.initState();
    _fetchUsers();
  }

  Future<void> _fetchUsers() async {
    await Apis.fetchUsers().then((value) {
      if (value.isEmpty) {
        print('No users found');
      } else {
        print('Users fetched successfully');
      }
      setState(() {
        _users = value;
      });
    });
  }

  _insertUser() async {
    if (_nameControl.text.isNotEmpty &&
        _emailControl.text.isNotEmpty &&
        _passwordControl.text.isNotEmpty) {
      await Apis.insertUser(
        _nameControl.text,
        _emailControl.text,
        _passwordControl.text,
      ).then((value) async {
        if (value) {
          await _fetchUsers();
        } else {
          print('Failed to add user');
        }
      });
    } else {
      print('Please fill all fields');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Demo Home Page'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async => await _insertUser(),
        tooltip: 'Add User',
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _nameControl,
              decoration: const InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _emailControl,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _passwordControl,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'User List:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _users.length,
                itemBuilder: (context, index) {
                  final user = _users[index];
                  return ListTile(
                    title: Text(user.name),
                    subtitle: Text(user.email),
                    leading: const CircleAvatar(
                      child: Icon(Icons.person),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
