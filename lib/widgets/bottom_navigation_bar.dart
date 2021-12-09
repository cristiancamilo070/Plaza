
import 'package:flutter/material.dart';
import 'package:plaza/providers/ui_provider.dart';
import 'package:provider/provider.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final uiProvider=Provider.of<UiProvider>(context);
    final currentIndex=uiProvider.selectedMenuOpt;
    
    return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        boxShadow: [ BoxShadow(color: Colors.green.shade600, spreadRadius: 2),],
    ),
    child: BottomNavigationBar(
      onTap: (int i)=>uiProvider.selectedMenuOpt = i,
      currentIndex: currentIndex,
      fixedColor: Colors.green.shade600,
      elevation: 20,
      showSelectedLabels: true,
      type: BottomNavigationBarType.shifting,
      
      iconSize: 24,
      unselectedIconTheme: const IconThemeData(size: 20),
      unselectedItemColor: Colors.grey,
      items: <BottomNavigationBarItem>[

        BottomNavigationBarItem(
          icon:  const Icon(Icons.home_sharp),
          label: currentIndex == 0
                    ? "Inicio"
                    : "", 
        ),
        
        BottomNavigationBarItem(
          icon:  const Icon(Icons.grid_view_outlined ),
          label: currentIndex == 1
                    ? "Categorias"
                    : "",
        ),
        BottomNavigationBarItem(
          icon:  const Icon(Icons.shopping_basket_outlined),
          label: currentIndex == 2
                    ? "Canasta"
                    : "",
        ),
        BottomNavigationBarItem(
          icon:  const Icon(Icons.person_pin),
          label: currentIndex == 3
                    ? "Perfil"
                    : "",
        )
      ],
    ),
  );
  }
}