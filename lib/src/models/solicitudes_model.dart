class SolicitudesModel {
  String? idSolicitud;
  String? idUsuario;
  String? idCancha;
  String? solicitudTipo;
  String? solicitudCodigoApp;
  String? solicitudNombre;
  String? solicitudFecha;
  String? solicitudHora;
  String? solicitudTelefono;
  String? solicitudCodigo;
  String? solicitudPago;
  String? solicitudComision;
  String? solicitudPagoDatetime;
  String? solicitudEstado;
  String? solicitudPagado;
  String? solicitudObservaciones;
  String? solicitudFile;
  String? solicitudOrigen;
  String? solicitudVentatipo;
  String? solicitudVentanrodoc;
  String? solicitudRazonsocial;
  String? solicitudDomicilio;
  String? idUsuarioAprobacion;
  String? solicitudAprobacionDate;
  String? solicitudMt;
  String? canchaId;
  String? empresaId;
  String? canchaNombre;
  String? canchaDimensiones;
  String? canchaPrecioM;
  String? canchaPrecioD;
  String? canchaPrecioN;
  String? canchaDeporte;
  String? canchaTipo;
  String? canchaFoto;
  String? canchaPromoPrecio;
  String? canchaPromoInicio;
  String? canchaPromoFin;
  String? canchaPromoEstado;
  String? canchaComision;
  String? canchaEstado;
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
  String? empresaRazonSocial;
  String? empresaRuc;
  String? empresaDomiciliofiscal;
  String? empresaDepartamento;
  String? empresaProvincia;
  String? empresaDistrito;
  String? empresaUbigeo;
  String? empresaUsuarioSol;
  String? empresaClaveSol;
  String? empresaCertificado;
  String? empresaCertificadoClave;
  String? empresaEstado;
  String? empresaFact;

  SolicitudesModel(
      {this.idSolicitud,
      this.idUsuario,
      this.idCancha,
      this.solicitudTipo,
      this.solicitudCodigoApp,
      this.solicitudNombre,
      this.solicitudFecha,
      this.solicitudHora,
      this.solicitudTelefono,
      this.solicitudCodigo,
      this.solicitudPago,
      this.solicitudComision,
      this.solicitudPagoDatetime,
      this.solicitudEstado,
      this.solicitudPagado,
      this.solicitudObservaciones,
      this.solicitudFile,
      this.solicitudOrigen,
      this.solicitudVentatipo,
      this.solicitudVentanrodoc,
      this.solicitudRazonsocial,
      this.solicitudDomicilio,
      this.idUsuarioAprobacion,
      this.solicitudAprobacionDate,
      this.solicitudMt,
      this.canchaId,
      this.empresaId,
      this.canchaNombre,
      this.canchaDimensiones,
      this.canchaPrecioM,
      this.canchaPrecioD,
      this.canchaPrecioN,
      this.canchaDeporte,
      this.canchaTipo,
      this.canchaFoto,
      this.canchaPromoPrecio,
      this.canchaPromoInicio,
      this.canchaPromoFin,
      this.canchaPromoEstado,
      this.canchaComision,
      this.canchaEstado,
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
      this.empresaRazonSocial,
      this.empresaRuc,
      this.empresaDomiciliofiscal,
      this.empresaDepartamento,
      this.empresaProvincia,
      this.empresaDistrito,
      this.empresaUbigeo,
      this.empresaUsuarioSol,
      this.empresaClaveSol,
      this.empresaCertificado,
      this.empresaCertificadoClave,
      this.empresaEstado,
      this.empresaFact});

  SolicitudesModel.fromJson(Map<String, dynamic> json) {
    idSolicitud = json['id_solicitud'];
    idUsuario = json['id_usuario'];
    idCancha = json['id_cancha'];
    solicitudTipo = json['solicitud_tipo'];
    solicitudCodigoApp = json['solicitud_codigo_app'];
    solicitudNombre = json['solicitud_nombre'];
    solicitudFecha = json['solicitud_fecha'];
    solicitudHora = json['solicitud_hora'];
    solicitudTelefono = json['solicitud_telefono'];
    solicitudCodigo = json['solicitud_codigo'];
    solicitudPago = json['solicitud_pago'];
    solicitudComision = json['solicitud_comision'];
    solicitudPagoDatetime = json['solicitud_pago_datetime'];
    solicitudEstado = json['solicitud_estado'];
    solicitudPagado = json['solicitud_pagado'];
    solicitudObservaciones = json['solicitud_observaciones'];
    solicitudFile = json['solicitud_file'];
    solicitudOrigen = json['solicitud_origen'];
    solicitudVentatipo = json['solicitud_ventatipo'];
    solicitudVentanrodoc = json['solicitud_ventanrodoc'];
    solicitudRazonsocial = json['solicitud_razonsocial'];
    solicitudDomicilio = json['solicitud_domicilio'];
    idUsuarioAprobacion = json['id_usuario_aprobacion'];
    solicitudAprobacionDate = json['solicitud_aprobacion_date'];
    solicitudMt = json['solicitud_mt'];
    canchaId = json['cancha_id'];
    empresaId = json['empresa_id'];
    canchaNombre = json['cancha_nombre'];
    canchaDimensiones = json['cancha_dimensiones'];
    canchaPrecioM = json['cancha_precioM'];
    canchaPrecioD = json['cancha_precioD'];
    canchaPrecioN = json['cancha_precioN'];
    canchaDeporte = json['cancha_deporte'];
    canchaTipo = json['cancha_tipo'];
    canchaFoto = json['cancha_foto'];
    canchaPromoPrecio = json['cancha_promo_precio'];
    canchaPromoInicio = json['cancha_promo_inicio'];
    canchaPromoFin = json['cancha_promo_fin'];
    canchaPromoEstado = json['cancha_promo_estado'];
    canchaComision = json['cancha_comision'];
    canchaEstado = json['cancha_estado'];
    usuarioId = json['usuario_id'];
    ubigeoId = json['ubigeo_id'];
    empresaNombre = json['empresa_nombre'];
    empresaDireccion = json['empresa_direccion'];
    empresaCoordX = json['empresa_coord_x'];
    empresaCoordY = json['empresa_coord_y'];
    empresaTelefono1 = json['empresa_telefono_1'];
    empresaTelefono2 = json['empresa_telefono_2'];
    empresaDescripcion = json['empresa_descripcion'];
    empresaHorarioLs = json['empresa_horario_ls'];
    empresaHorarioD = json['empresa_horario_d'];
    empresaValoracion = json['empresa_valoracion'];
    empresaFoto = json['empresa_foto'];
    empresaRazonSocial = json['empresa_razon_social'];
    empresaRuc = json['empresa_ruc'];
    empresaDomiciliofiscal = json['empresa_domiciliofiscal'];
    empresaDepartamento = json['empresa_departamento'];
    empresaProvincia = json['empresa_provincia'];
    empresaDistrito = json['empresa_distrito'];
    empresaUbigeo = json['empresa_ubigeo'];
    empresaUsuarioSol = json['empresa_usuario_sol'];
    empresaClaveSol = json['empresa_clave_sol'];
    empresaCertificado = json['empresa_certificado'];
    empresaCertificadoClave = json['empresa_certificado_clave'];
    empresaEstado = json['empresa_estado'];
    empresaFact = json['empresa_fact'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_solicitud'] = this.idSolicitud;
    data['id_usuario'] = this.idUsuario;
    data['id_cancha'] = this.idCancha;
    data['solicitud_tipo'] = this.solicitudTipo;
    data['solicitud_codigo_app'] = this.solicitudCodigoApp;
    data['solicitud_nombre'] = this.solicitudNombre;
    data['solicitud_fecha'] = this.solicitudFecha;
    data['solicitud_hora'] = this.solicitudHora;
    data['solicitud_telefono'] = this.solicitudTelefono;
    data['solicitud_codigo'] = this.solicitudCodigo;
    data['solicitud_pago'] = this.solicitudPago;
    data['solicitud_comision'] = this.solicitudComision;
    data['solicitud_pago_datetime'] = this.solicitudPagoDatetime;
    data['solicitud_estado'] = this.solicitudEstado;
    data['solicitud_pagado'] = this.solicitudPagado;
    data['solicitud_observaciones'] = this.solicitudObservaciones;
    data['solicitud_file'] = this.solicitudFile;
    data['solicitud_origen'] = this.solicitudOrigen;
    data['solicitud_ventatipo'] = this.solicitudVentatipo;
    data['solicitud_ventanrodoc'] = this.solicitudVentanrodoc;
    data['solicitud_razonsocial'] = this.solicitudRazonsocial;
    data['solicitud_domicilio'] = this.solicitudDomicilio;
    data['id_usuario_aprobacion'] = this.idUsuarioAprobacion;
    data['solicitud_aprobacion_date'] = this.solicitudAprobacionDate;
    data['solicitud_mt'] = this.solicitudMt;
    data['cancha_id'] = this.canchaId;
    data['empresa_id'] = this.empresaId;
    data['cancha_nombre'] = this.canchaNombre;
    data['cancha_dimensiones'] = this.canchaDimensiones;
    data['cancha_precioM'] = this.canchaPrecioM;
    data['cancha_precioD'] = this.canchaPrecioD;
    data['cancha_precioN'] = this.canchaPrecioN;
    data['cancha_deporte'] = this.canchaDeporte;
    data['cancha_tipo'] = this.canchaTipo;
    data['cancha_foto'] = this.canchaFoto;
    data['cancha_promo_precio'] = this.canchaPromoPrecio;
    data['cancha_promo_inicio'] = this.canchaPromoInicio;
    data['cancha_promo_fin'] = this.canchaPromoFin;
    data['cancha_promo_estado'] = this.canchaPromoEstado;
    data['cancha_comision'] = this.canchaComision;
    data['cancha_estado'] = this.canchaEstado;
    data['usuario_id'] = this.usuarioId;
    data['ubigeo_id'] = this.ubigeoId;
    data['empresa_nombre'] = this.empresaNombre;
    data['empresa_direccion'] = this.empresaDireccion;
    data['empresa_coord_x'] = this.empresaCoordX;
    data['empresa_coord_y'] = this.empresaCoordY;
    data['empresa_telefono_1'] = this.empresaTelefono1;
    data['empresa_telefono_2'] = this.empresaTelefono2;
    data['empresa_descripcion'] = this.empresaDescripcion;
    data['empresa_horario_ls'] = this.empresaHorarioLs;
    data['empresa_horario_d'] = this.empresaHorarioD;
    data['empresa_valoracion'] = this.empresaValoracion;
    data['empresa_foto'] = this.empresaFoto;
    data['empresa_razon_social'] = this.empresaRazonSocial;
    data['empresa_ruc'] = this.empresaRuc;
    data['empresa_domiciliofiscal'] = this.empresaDomiciliofiscal;
    data['empresa_departamento'] = this.empresaDepartamento;
    data['empresa_provincia'] = this.empresaProvincia;
    data['empresa_distrito'] = this.empresaDistrito;
    data['empresa_ubigeo'] = this.empresaUbigeo;
    data['empresa_usuario_sol'] = this.empresaUsuarioSol;
    data['empresa_clave_sol'] = this.empresaClaveSol;
    data['empresa_certificado'] = this.empresaCertificado;
    data['empresa_certificado_clave'] = this.empresaCertificadoClave;
    data['empresa_estado'] = this.empresaEstado;
    data['empresa_fact'] = this.empresaFact;
    return data;
  }
}
