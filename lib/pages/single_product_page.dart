import 'package:flutter/material.dart';
class SingleProduct extends StatelessWidget {
  const SingleProduct({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () => Navigator.of(context).pop(),
      ), 
      centerTitle: true,
),
      body: Center(
        child: Text('Caracteristicas del prducto'),
        ),
    );
  }
}