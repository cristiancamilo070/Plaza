// To parse this JSON data, do
//
//     final productsResponse = productsResponseFromMap(jsonString);

import 'dart:convert';

class ProductsResponse {
    ProductsResponse({
         required this.cliente,
        required this.nombre,
        required this.precio,
       required  this.idPromocion,
       required  this.valorPromo,
       required  this.idProductoPromo,
       required  this.estadoPromo,
       required  this.imagen,
    });

    String cliente;
    String nombre;
    String precio;
    String idPromocion;
    String valorPromo;
    String idProductoPromo;
    String estadoPromo;
    String imagen;

    factory ProductsResponse.fromJson(String str) => ProductsResponse.fromMap(json.decode(str));

    factory ProductsResponse.fromMap(Map<String, dynamic> json) => ProductsResponse(
        cliente: json["cliente"].toString(),
        nombre: json["nombre"].toString(),
        precio: json["precio"].toString(),
        idPromocion: json["id_promocion"].toString(),
        valorPromo: json["valor_promo"].toString(),
        idProductoPromo: json["id_producto_promo"].toString(),
        estadoPromo: json["estado_promo"].toString(),
        imagen: json["imagen"].toString(),
    );

    Map<String, dynamic> toMap() => {
        "cliente": cliente,
        "nombre": nombre,
        "precio": precio,
        "id_promocion": idPromocion,
        "valor_promo": valorPromo,
        "id_producto_promo": idProductoPromo,
        "estado_promo": estadoPromo,
        "imagen": imagen,
    };
}
