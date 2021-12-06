class Medico {
  final String nombre;
  final int telefono;
  final String correo;
  final String diaslaborales;
  final String especialidad;

  const Medico({
    this.nombre,
    this.telefono,
    this.correo,
    this.diaslaborales,
    this.especialidad,
  });

  factory Medico.fromJson(Map<String, dynamic> json) => Medico(
      nombre: json['NOMBRE'],
      telefono: json['TELEFONO'],
      correo: json['CORREO'],
      diaslaborales: json['DIAS_LABORALES'],
      especialidad: json['ESPECIALIDAD']);

  Map<String, dynamic> toJson() => {
        'NOMBRE': nombre,
        'TELEFONO': telefono,
        'CORREO': correo,
        'DIAS_LABORALES': diaslaborales,
        'ESPECIALIDAD': especialidad,
      };
}
