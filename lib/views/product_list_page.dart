import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../model/shoe.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  bool loadingData = true;
  List<Shoe> shoeList = [];

  @override
  void initState() {
    _getAllProducts();
    super.initState();
  }

  _getAllProducts() async {
    Response data = await http.get(Uri.parse('http://192.168.1.74/shoe-api/get_all_products.php'));
    loadingData = false;
    setState(() {});
    //print(data.body);

    shoeList = shoeFromJson(data.body);
    print(jsonEncode(shoeList[0].toJson()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: loadingData
            ? Center(child: const CircularProgressIndicator())
            : shoeList.isEmpty
                ? const Center(
                    child: Text('No Data'),
                  )
                : ListView.builder(
                    itemCount: shoeList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                          leading: Image.network('http://192.168.1.74/JDSneakerStore/images/'+shoeList[index].image01, width: 50,),
                          trailing: const Text(
                            "GFG",
                            style: TextStyle(color: Colors.green, fontSize: 15),
                          ),
                          title: Text(shoeList[index].name));
                    }));
  }
}
