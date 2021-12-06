import 'dart:convert';
import 'package:cl_carmelo/model/Medico.dart';
import 'package:http/http.dart' as http;

class MedicosApi {
  static Future<List<Medico>> getMedicos(String query) async {
    final url = Uri.parse('https://flutterclcarmelo.000webhostapp.com/ws/obtenerInfoMedico.php');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List medicos = json.decode(response.body);

      return medicos.map((json) => Medico.fromJson(json)).where((medico) {
        final titleLower = medico.nombre.toLowerCase();
        final authorLower = medico.especialidad.toLowerCase();
        final searchLower = query.toLowerCase();

        return titleLower.contains(searchLower) ||
            authorLower.contains(searchLower);
      }).toList();
    } else {
      throw Exception();
    }
  }
}
