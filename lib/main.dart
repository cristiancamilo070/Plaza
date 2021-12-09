import 'package:flutter/material.dart';
import 'package:plaza/pages/cart_page.dart';
import 'package:plaza/pages/categories_page.dart';
import 'package:plaza/pages/home_page.dart';
import 'package:plaza/pages/product_page.dart';
import 'package:plaza/pages/profile_page.dart';
import 'package:plaza/pages/single_product_page.dart';
import 'package:plaza/providers/products_provider.dart';
import 'package:plaza/providers/ui_provider.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>UiProvider()),
        ChangeNotifierProvider(create: ( _ ) => ProductProvider(), lazy: false ),
      ],


      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'plaza',
        initialRoute: 'home',
        routes: {
          'home'       :(_)=>const HomePage(),
          'products'   :(_)=>const ProductsPage(),
          'categoty'   :(_)=>const CategoriesPage(),
          'cart'       :(_)=>const CartPage(),
          'profile'    :(_)=>const ProfilePage(),
          'esp'       :(_)=>const SingleProduct(),
        },
        theme: ThemeData(
          primarySwatch: Colors.green,
        )
      ),
    );
  }
}