import 'package:flutter/material.dart';
import 'package:plaza/pages/cart_page.dart';
import 'package:plaza/pages/categories_page.dart';
import 'package:plaza/pages/prod_page.dart';
import 'package:plaza/pages/product_page.dart';
import 'package:plaza/pages/profile_page.dart';
import 'package:plaza/providers/ui_provider.dart';
import 'package:plaza/widgets/bottom_navigation_bar.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade50,
        elevation: 0,
        toolbarHeight: 100,
          title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                  Image.asset(
                 'assets/img/plazaicon.jpg',
                  fit: BoxFit.contain,
                  height: 60,
              ),
            ],

          ),
        ),

      body: const _HomePageBody(),
      bottomNavigationBar:  const CustomNavigationBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {
  const _HomePageBody({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    //Obtener el selected menu opt
    final uiProvider=Provider.of<UiProvider>(context);

    //This one needs to be the same in the 2 classes
    final currentIndex=uiProvider.selectedMenuOpt;
    switch (currentIndex) {
      case 0 : return const ProdPage();
      case 1 : return const CategoriesPage();
      case 2 : return const CartPage();
      case 3 : return const ProfilePage();
      default: return const ProductsPage();
    }
  }
}