import 'package:flutter/material.dart';
import 'package:modelhandling/controller/usercontroller.dart';
import 'package:modelhandling/model/user.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  List<User> users = [];
  final controller = UserController();
  
  @override
  void initState() {
    super.initState();
    loadUser();
  } 

  void loadUser() async {
    final data = await controller.getUsers();
    setState(() {
      users = data;
    });
  }

  void adduser() async {
    if (nameController.text.isEmpty || emailController.text.isEmpty) {
      return;
    }
    final user = User(name: nameController.text, email: emailController.text);

    await controller.addUser(user);
    nameController.clear();
    emailController.clear();
    loadUser();
  }

  void deleteuser(int id) async {
    await controller.deleteUser(id);
    loadUser();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            controller: nameController,
            decoration: const InputDecoration(labelText: "Name"),
          ),
          TextField(
            controller: emailController,
            decoration: const InputDecoration(labelText: "Email"),
          ),
          ElevatedButton(
            onPressed: adduser, 
            child: const Text("Add User")
          ),

          Expanded(
            child: ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                return ListTile(
                  title: Text(user.name),
                  subtitle: Text(user.email),
                  trailing: IconButton(
                    onPressed: () {deleteuser(user.id!);}, 
                    icon: const Icon(Icons.delete)
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}