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
    // ignore: prefer_collection_literals
    final Map<String, dynamic> data =   Map<String, dynamic>();
    data['id_solicitud'] = idSolicitud;
    data['id_usuario'] = idUsuario;
    data['id_cancha'] =idCancha;
    data['solicitud_tipo'] =solicitudTipo;
    data['solicitud_codigo_app'] =solicitudCodigoApp;
    data['solicitud_nombre'] = solicitudNombre;
    data['solicitud_fecha'] = solicitudFecha;
    data['solicitud_hora'] = solicitudHora;
    data['solicitud_telefono'] = solicitudTelefono;
    data['solicitud_codigo'] = solicitudCodigo;
    data['solicitud_pago'] = solicitudPago;
    data['solicitud_comision'] = solicitudComision;
    data['solicitud_pago_datetime'] = solicitudPagoDatetime;
    data['solicitud_estado'] = solicitudEstado;
    data['solicitud_pagado'] = solicitudPagado;
    data['solicitud_observaciones'] = solicitudObservaciones;
    data['solicitud_file'] =solicitudFile;
    data['solicitud_origen'] = solicitudOrigen;
    data['solicitud_ventatipo'] = solicitudVentatipo;
    data['solicitud_ventanrodoc'] = solicitudVentanrodoc;
    data['solicitud_razonsocial'] = solicitudRazonsocial;
    data['solicitud_domicilio'] = solicitudDomicilio;
    data['id_usuario_aprobacion'] = idUsuarioAprobacion;
    data['solicitud_aprobacion_date'] = solicitudAprobacionDate;
    data['solicitud_mt'] = solicitudMt;
    data['cancha_id'] = canchaId;
    data['empresa_id'] = empresaId;
    data['cancha_nombre'] = canchaNombre;
    data['cancha_dimensiones'] = canchaDimensiones;
    data['cancha_precioM'] = canchaPrecioM;
    data['cancha_precioD'] = canchaPrecioD;
    data['cancha_precioN'] = canchaPrecioN;
    data['cancha_deporte'] = canchaDeporte;
    data['cancha_tipo'] = canchaTipo;
    data['cancha_foto'] = canchaFoto;
    data['cancha_promo_precio'] = canchaPromoPrecio;
    data['cancha_promo_inicio'] = canchaPromoInicio;
    data['cancha_promo_fin'] = canchaPromoFin;
    data['cancha_promo_estado'] = canchaPromoEstado;
    data['cancha_comision'] = canchaComision;
    data['cancha_estado'] = canchaEstado;
    data['usuario_id'] = usuarioId;
    data['ubigeo_id'] = ubigeoId;
    data['empresa_nombre'] = empresaNombre;
    data['empresa_direccion'] = empresaDireccion;
    data['empresa_coord_x'] = empresaCoordX;
    data['empresa_coord_y'] = empresaCoordY;
    data['empresa_telefono_1'] = empresaTelefono1;
    data['empresa_telefono_2'] = empresaTelefono2;
    data['empresa_descripcion'] = empresaDescripcion;
    data['empresa_horario_ls'] = empresaHorarioLs;
    data['empresa_horario_d'] = empresaHorarioD;
    data['empresa_valoracion'] = empresaValoracion;
    data['empresa_foto'] = empresaFoto;
    data['empresa_razon_social'] = empresaRazonSocial;
    data['empresa_ruc'] = empresaRuc;
    data['empresa_domiciliofiscal'] = empresaDomiciliofiscal;
    data['empresa_departamento'] = empresaDepartamento;
    data['empresa_provincia'] = empresaProvincia;
    data['empresa_distrito'] = empresaDistrito;
    data['empresa_ubigeo'] = empresaUbigeo;
    data['empresa_usuario_sol'] = empresaUsuarioSol;
    data['empresa_clave_sol'] = empresaClaveSol;
    data['empresa_certificado'] = empresaCertificado;
    data['empresa_certificado_clave'] = empresaCertificadoClave;
    data['empresa_estado'] = empresaEstado;
    data['empresa_fact'] = empresaFact;
    return data;
  }
}
