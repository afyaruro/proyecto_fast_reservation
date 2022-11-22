class Mesa {
  final String idMesa;
  final String nombreMesa;
  final String descripcionMesa;
  final String foto;

  Mesa(
      {required this.idMesa,
      required this.nombreMesa,
      required this.descripcionMesa,
      required this.foto});

  factory Mesa.desdeDoc(Map<String, dynamic> data) {
    return Mesa(
      idMesa: data['idMesa'] ?? '',
      nombreMesa: data['nombreMesa'] ?? '',
      descripcionMesa: data['descripcionMesa'] ?? '',
      foto: data['foto'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        "idMesa": idMesa,
        "nombreMesa": nombreMesa,
        "descripcionMesa": descripcionMesa,
        "foto": foto
      };
}
