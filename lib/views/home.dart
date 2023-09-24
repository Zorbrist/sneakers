import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:jdflutter/views/product_list_page.dart';
import 'package:jdflutter/views/secondpage.dart';
import 'package:jdflutter/views/widgets/shoppingcart.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Drawer(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildHeader(context),
              buildMenuItems(context),
            ],
          ),
        ),
      );

  Widget buildHeader(BuildContext context) => Container(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top,
        ),
      );

  Widget buildMenuItems(BuildContext context) => Container(
        padding: const EdgeInsets.all(20.0),
        child: Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.account_balance_sharp),
              title: const Text("Home"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.border_color_sharp),
              title: const Text("Orders"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.production_quantity_limits_sharp),
              title: const Text("Product"),
              onTap: () {},
            ),
            const Divider(color: Colors.black),
            ListTile(
              leading: const Icon(Icons.people_alt),
              title: const Text("About Us"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.phone_in_talk),
              title: const Text("Feedback"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.accessible_forward),
              title: const Text("Users"),
              onTap: () {
                // Navigator.of(context).push(MaterialPageRoute(builder: (_) => UsersListPage()));
              },
            )
          ],
        ),
      );
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  get menuButton => null;

  final List<String> imagePaths = [
    "images/black.png",
    "images/forum2.png",
    "images/gellyte.png"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Stack(children: <Widget>[
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/brown.jpg"), // Background image path
              fit: BoxFit.cover, // Adjust the fit as needed
            ),
          ),
        ),
        Column(children: <Widget>[
          Padding(
            padding: EdgeInsets.all(1.0),
            child: CarouselSlider(
              items: imagePaths.map((imagePath) {
                return Container(
                  padding: const EdgeInsets.all(14.0),
                  decoration: BoxDecoration(
                    color: Colors
                        .transparent, // Set to transparent to allow background image to show
                    border: Border.all(
                      color: Colors.transparent,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover, // Adjust the image fit as needed
                  ),
                );
              }).toList(),
              options: CarouselOptions(
                height: 200.0,
                enlargeCenterPage: true,
                autoPlay: true,
              ),
            ),
          ),
        ]),
      ]),
      drawer: const NavigationDrawer(),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (_) => ProductListPage()));
      },),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.orange,
      title: const Text(
        'JD Sneaker Store',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        textAlign: TextAlign.center,
      ),
      centerTitle: true,
      // leading: IconButton(
      //   icon: Image.asset('images/logo.png'),
      //   onPressed: () {},
      // ),
      actions: [
        Builder(builder: (context) {
          return IconButton(
            icon: const Icon(Icons.shop),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ShoppingCart()),
              );
            },
          );
        })
      ],
    );
  }
}
