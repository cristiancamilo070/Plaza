import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CardSlider extends StatefulWidget {
  const CardSlider({Key? key}) : super(key: key);



  @override
  _CardSliderState createState() => _CardSliderState();
}

class _CardSliderState extends State<CardSlider> {

  final ScrollController scrollController = ScrollController();
  Map? mapResponse;

  Future apiCall()async{
    http.Response response;
    
    //https://reqres.in/api/users/2 exercise vidio
    response=await http.get(Uri.parse("https://api.bazzaio.com/v5/listados/listar_productos_tienda/590/0"));
    if(response.statusCode==200){
        setState(() {
          //stringResponse=response.body;
          mapResponse=json.decode(response.body);
          //dataResponse=mapResponse!["1"];          
          //key=mapResponse!.keys.toList();
          //val = mapResponse![key[0]];
        });
    }
  }

  @override
    void initState() {
      apiCall();
      super.initState();
    }

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
            child: mapResponse==null           ?        const Center(child:  CircularProgressIndicator(color: Colors.green,)): 
            GridView.builder(
                gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                   crossAxisCount: MediaQuery.of(context).orientation == Orientation.landscape ? 3: 2,
                   //rossAxisSpacing: 10,
                   mainAxisSpacing: 1,
                   childAspectRatio: (1.6/1),
                ),
                scrollDirection: Axis.horizontal,
                itemCount: mapResponse!['data'].length,
                itemBuilder: (BuildContext context, int index) => 
                Container(
                    width: 130,
                    height: 180,
                    color: Colors.grey.shade300,
                    margin: const EdgeInsets.symmetric(horizontal: 1),
                    child: Column(
                      children: [
                        Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.green,
                            width: 6,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                          child: FadeInImage.assetNetwork(
                            alignment: Alignment.center,
                            placeholder: 'assets/img/loading.gif',
                            image:mapResponse!['data'][index]["imagen"].toString() ,
                            width: 155,
                            height: 180,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Text(mapResponse!['data'][index]["nombre"].toString()),
                        Text('Precio: '+mapResponse!['data'][index]["precio"].toString()),
                        //Text(key[index].toString()),
                        Row(
                          children: [
                            const SizedBox( width: 15 ),
                            ElevatedButton.icon(
                              autofocus: true,
                              onPressed: () {Navigator.pushNamed(context, 'esp');},
                              icon: const Icon(Icons.favorite, size: 18), label: Text(mapResponse!['data'][index]["likes"].toString()),
                            ),
                            const SizedBox( width: 15 ),
                            ElevatedButton.icon(
                              autofocus: true,
                              onPressed: () {Navigator.pushNamed(context, 'esp');},
                              icon: const Icon(Icons.shopping_basket_outlined, size: 25), label: const Text('')
                            )
                          ],

                        )
                      ],
                    ),
                  ),
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
