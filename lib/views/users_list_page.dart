import 'package:flutter/material.dart';

class UsersListPage extends StatefulWidget {
  const UsersListPage({super.key});

  @override
  State<UsersListPage> createState() => _UsersListPageState();
}

class _UsersListPageState extends State<UsersListPage> {

  bool loadingData = true;
  List<user> userlist = [];

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
