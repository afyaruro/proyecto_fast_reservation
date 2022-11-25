class Producto {
  final String idProducto;
  final String nombreProducto;
  final String descripcionProducto;
  final String precioProducto;
  final String foto;

  Producto(
      {required this.idProducto,
      required this.nombreProducto,
      required this.descripcionProducto,
      required this.precioProducto,
      required this.foto});

  factory Producto.desdeDoc(Map<String, dynamic> data) {
    return Producto(
      idProducto: data['idProducto'] ?? '',
      nombreProducto: data['nombreProducto'] ?? '',
      descripcionProducto: data['descripcionProducto'] ?? '',
      precioProducto: data['precioProducto'],
      foto: data['foto'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        "idProducto": idProducto,
        "nombreProducto": nombreProducto,
        "descripcionProducto": descripcionProducto,
        "precioProducto": precioProducto,
        "foto": foto
      };
}
