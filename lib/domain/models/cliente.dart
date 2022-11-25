class Cliente {
  final String userName;
  final String password;
  final String nombreApellido;
  final String telefono;
  final String tipoUser;

  Cliente(
      {required this.userName,
      required this.password,
      required this.nombreApellido,
      required this.telefono,
      required this.tipoUser});

  factory Cliente.desdeDoc(Map<String, dynamic> data) {
    return Cliente(
      userName: data['userName'] ?? '',
      password: data['password'] ?? '',
      nombreApellido: data['nombreApellido'] ?? '',
      telefono: data['telefono'] ?? '',
      tipoUser: data['tipoUser'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        "userName": userName,
        "password": password,
        "nombreApellido": nombreApellido,
        "telefono": telefono,
        "tipoUser": tipoUser
      };
}
