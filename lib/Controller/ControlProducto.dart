import 'package:get/get.dart';
import 'package:proyecto_fast_reservation/Data/Service/PeticionesProducto.dart';
import 'package:proyecto_fast_reservation/domain/models/producto.dart';

class ProductoController extends GetxController {
  final Rxn<List<Producto>> _productoFirestore = Rxn<List<Producto>>();
  List<Producto>? get getproductosGral => _productoFirestore.value;

  final Rxn<Producto> _producto = Rxn<Producto>();
  Producto? get producto => _producto.value;

  final Rx<dynamic> _imagenProducto = "".obs;
  String get imagenProducto => _imagenProducto.value;

  final Rx<dynamic> _idProducto = "".obs;
  String get idProducto => _idProducto.value;

  final Rx<dynamic> _nombreProducto = "".obs;
  String get nombreProducto => _nombreProducto.value;

  final Rx<dynamic> _descripcionProducto = "".obs;
  String get descripcionProducto => _descripcionProducto.value;

  final Rx<dynamic> _precioProducto = "".obs;
  String get precioProducto => _precioProducto.value;

  Future<void> consultaProductos() async {
    _productoFirestore.value = await PeticionesProducto.consultarGral();
  }

  Future<void> consultaProducto(String id) async {
    List<Producto> lista = await PeticionesProducto.consultarGral();

    for (var producto in lista) {
      if (producto.idProducto == id) {
        _imagenProducto.value = producto.foto;
        _idProducto.value = producto.idProducto;
        _nombreProducto.value = producto.nombreProducto;
        _descripcionProducto.value = producto.descripcionProducto;
        _precioProducto.value = producto.precioProducto;
        _producto.value = producto;
      }
    }
  }
}
