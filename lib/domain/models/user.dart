class Usuario {
  final String userName;
  final String password;
  final String tipoUser;

  Usuario(
      {required this.userName, required this.password, required this.tipoUser});

  factory Usuario.desdeDoc(Map<String, dynamic> data) {
    return Usuario(
      userName: data['userName'] ?? '',
      password: data['password'] ?? '',
      tipoUser: data['tipoUser'] ?? '',
    );
  }

  Map<String, dynamic> toJson() =>
      {"userName": userName, "password": password, "tipoUser": tipoUser};
}
