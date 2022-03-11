class CanchasDisponibles {
  CanchasDisponibles({
    this.horaAtual,
    this.fecha,
    this.canchas,
  });
  String? horaAtual;
  String? fecha;
  List<CanchasDisponiblesResult>? canchas;
  List<CanchasDisponiblesConEmpresas>? canchasEmpresas;
}

class CanchasDisponiblesConEmpresas {
  String? idEmpresa;
  String? nombreEmpresa;
  String? direccion;
  List<CanchasDisponiblesResult>? canchasList;

  CanchasDisponiblesConEmpresas({this.idEmpresa, this.nombreEmpresa, this.direccion, this.canchasList});
}

class CanchasDisponiblesResult {
  CanchasDisponiblesResult(
      {this.empresaId,
      this.usuarioId,
      this.ubigeoId,
      this.empresaNombre,
      this.empresaDireccion,
      this.empresaCoordX,
      this.empresaCoordY,
      this.empresaTelefono1,
      this.empresaTelefono2,
      this.empresaDescripcion,
      this.empresaHorarioLs,
      this.empresaHorarioD,
      this.empresaValoracion,
      this.empresaFoto,
      this.empresaEstado,
      this.empresaFact,
      this.canchaId,
      this.canchaEstado,
      this.canchaPrecioD,
      this.canchaPrecioN,
      this.canchaPromoPrecio,
      this.canchaPromoInicio,
      this.canchaPromoFin,
      this.canchaPromoEstado,
      this.canchaFoto,
      this.canchaPrecioFinal,
      this.canchaNombre,
      this.dimensiones,
      this.tipo,
      this.tipoNombre,
      this.deporte,
      this.comisionCancha,
      this.deporteTipo,
      this.fechaActual,
      this.soyAdmin});

  String? empresaId;
  String? usuarioId;
  String? ubigeoId;
  String? empresaNombre;
  String? empresaDireccion;
  String? empresaCoordX;
  String? empresaCoordY;
  String? empresaTelefono1;
  String? empresaTelefono2;
  String? empresaDescripcion;
  String? empresaHorarioLs;
  String? empresaHorarioD;
  String? empresaValoracion;
  String? empresaFoto;
  String? empresaEstado;
  String? empresaFact;
  String? canchaId;
  String? canchaEstado;
  String? canchaPrecioD;
  String? canchaPrecioN;
  String? canchaPromoPrecio;
  String? canchaPromoInicio;
  String? canchaPromoFin;
  String? canchaPromoEstado;
  String? canchaFoto;
  String? canchaNombre;
  String? dimensiones;
  String? tipoNombre;
  String? tipo;
  String? deporteTipo;
  String? deporte;
  String? canchaPrecioFinal;
  String? canchaHora;
  String? canchaHoraCancha;
  String? fechaActual;
  String? comisionCancha;

  int? soyAdmin;
}
/* 
  factory CanchasDisponiblesResult.fromJson(Map<String, dynamic> json) => CanchasDisponiblesResult(
        empresaId: json["empresa_id"],
        usuarioId: json["usuario_id"],
        ubigeoId: json["ubigeo_id"],
        empresaNombre: json["empresa_nombre"],
        empresaDireccion: json["empresa_direccion"],
        empresaCoordX: json["empresa_coord_x"],
        empresaCoordY: json["empresa_coord_y"],
        empresaTelefono1: json["empresa_telefono_1"],
        empresaTelefono2: json["empresa_telefono_2"],
        empresaDescripcion: json["empresa_descripcion"],
        empresaHorarioLs: json["empresa_horario_ls"],
        empresaHorarioD: json["empresa_horario_d"],
        empresaValoracion: json["empresa_valoracion"],
        empresaFoto: json["empresa_foto"],
        empresaEstado: json["empresa_estado"],
        canchaId: json["cancha_id"],
        canchaPrecioD: json["cancha_precioD"],
        canchaPrecioN: json["cancha_precioN"],
        canchaPromoPrecio: json["cancha_promo_precio"],
        canchaPromoInicio: json["cancha_promo_inicio"],
        canchaPromoFin: json["cancha_promo_fin"],
        canchaPromoEstado: json["cancha_promo_estado"],
        canchaNombre: json["canchaNombre"],
        tipoNombre: json["tipoNombre"],
        deporte: json["deporte"],
        fechaActual: json["fechaActual"],
      );

  Map<String, dynamic> toJson() => {
        "empresa_id": empresaId,
        "usuario_id": usuarioId,
        "ubigeo_id": ubigeoId,
        "empresa_nombre": empresaNombre,
        "empresa_direccion": empresaDireccion,
        "empresa_coord_x": empresaCoordX,
        "empresa_coord_y": empresaCoordY,
        "empresa_telefono_1": empresaTelefono1,
        "empresa_telefono_2": empresaTelefono2,
        "empresa_descripcion": empresaDescripcion,
        "empresa_horario_ls": empresaHorarioLs,
        "empresa_horario_d": empresaHorarioD,
        "empresa_valoracion": empresaValoracion,
        "empresa_foto": empresaFoto,
        "empresa_estado": empresaEstado,
        "cancha_id": canchaId,
        "cancha_precioD": canchaPrecioD,
        "cancha_precioN": canchaPrecioN,
        "cancha_promo_precio": canchaPromoPrecio,
        "cancha_promo_inicio": canchaPromoInicio,
        "cancha_promo_fin": canchaPromoFin,
        "cancha_promo_estado": canchaPromoEstado,
        "canchaNombre": canchaNombre,
        "tipoNombre": tipoNombre,
        "deporte": deporte,
        "fechaActual": fechaActual,
      };
}
 */