class Mesero {
  final String userName;
  final String password;
  final String nombreApellido;
  final String telefono;
  final String tipoUser;
  final String salario;
  final String foto;

  Mesero(
      {required this.userName,
      required this.password,
      required this.nombreApellido,
      required this.telefono,
      required this.tipoUser,
      required this.salario,
      required this.foto});

  factory Mesero.desdeDoc(Map<String, dynamic> data) {
    return Mesero(
      userName: data['userName'] ?? '',
      password: data['password'] ?? '',
      nombreApellido: data['nombreApellido'] ?? '',
      telefono: data['telefono'] ?? '',
      tipoUser: data['tipoUser'] ?? '',
      salario: data['salario'] ?? '',
      foto: data['foto'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        "userName": userName,
        "password": password,
        "nombreApellido": nombreApellido,
        "telefono": telefono,
        "tipoUser": tipoUser,
        "salario": salario,
        "foto": foto
      };
}
