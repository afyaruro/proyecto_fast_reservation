class Cuenta {
  final String idCuenta;
  final String idMesa;
  final String idProducto;

  Cuenta({
    required this.idMesa,
    required this.idCuenta,
    required this.idProducto,
  });

  factory Cuenta.desdeDoc(Map<String, dynamic> data) {
    return Cuenta(
        idMesa: data['idMesa'] ?? '',
        idCuenta: data['idCuenta'] ?? '',
        idProducto: data['idProducto'] ?? '');
  }

  Map<String, dynamic> toJson() => {
        "idMesa": idMesa,
        "idCuenta": idCuenta,
        "idProducto": idProducto,
      };
}
