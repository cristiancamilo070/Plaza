import 'package:flutter/material.dart';

class CardSlider extends StatefulWidget {
  const CardSlider({Key? key}) : super(key: key);



  @override
  _CardSliderState createState() => _CardSliderState();
}

class _CardSliderState extends State<CardSlider> {

  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 700,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox( height: 20 ),
          const Padding(
            padding: EdgeInsets.symmetric( horizontal: 20 ),
            child: Text( 'Todos los productos', style: TextStyle( fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),),
          ),

          const SizedBox( height: 20 ),

          Expanded(
            child: GridView.builder(
                gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                   crossAxisCount: MediaQuery.of(context).orientation == Orientation.landscape ? 3: 2,
                   crossAxisSpacing: 10,
                   mainAxisSpacing: 1,
                   childAspectRatio: (1.7/1),
                ),
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: ( _, int index) => _FoodPoster( ),
                addSemanticIndexes: true,
                shrinkWrap: true,
              ),
            ),
        

          const SizedBox( height: 10 ),

         
        ],
      ),
    );
  }
}


class _FoodPoster extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

 
    return Container(
      width: 130,
      height: 200,
      color: Colors.grey.shade300,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        children: [
          const FadeInImage(
            alignment: Alignment.center,
            placeholder: AssetImage('assets/img/no-image.jpg'),
            image: AssetImage('assets/img/no-image.jpg'),
            width: 140,
            height: 200,
            fit: BoxFit.cover,
           ),
          const Text('nombre'),
          const Text('Precio viejo'),
          const Text('Precio nuevo'),
          Row(
            children: [
              const SizedBox( width: 15 ),
              ElevatedButton.icon(
                autofocus: true,
                onPressed: () {},
                icon: const Icon(Icons.favorite, size: 18), label: const Text(""),
              ),
              const SizedBox( width: 15 ),
              ElevatedButton.icon(
                autofocus: true,
                onPressed: () {},
                icon: const Icon(Icons.shopping_basket_outlined, size: 25), label: const Text('')
              )
            ],

          )
        ],
      ),
    );
  }
}