import 'package:flutter/material.dart';
import 'package:plaza/models/products_response.dart';
import 'package:plaza/widgets/card_swiper_widget.dart';
import 'package:provider/provider.dart';

class ProdPage extends StatelessWidget {
  const ProdPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final productsProv=Provider.of<ProductsResponse>(context,listen: true);
    
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children:const [
         TextField(
           
              decoration: InputDecoration(
              border: OutlineInputBorder(borderSide: BorderSide(width: 45), gapPadding: 90, borderRadius: BorderRadius.all(Radius.circular(40))),
              hintText: "Buscar"
              
      ),
         ),
         CardSlider(),
        ],
        ),
    );
  }
}
