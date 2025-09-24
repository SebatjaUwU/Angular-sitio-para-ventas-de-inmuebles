const { poolPromise, sql } = require('../Models/db');

const path = require('path');

const multer = require('multer');
const fs = require('fs');


// Configuración dinámica de almacenamiento
const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    const inmuebleId = req.params.id;
    const dir = `uploads/inmuebles/${inmuebleId}`;
    fs.mkdirSync(dir, { recursive: true });
    cb(null, dir);
  },
  filename: (req, file, cb) => {
    const uniqueName = Date.now() + '-' + file.originalname.replace(/\s+/g, '_');
    cb(null, uniqueName);
  }
});

const upload = multer({ storage });

exports.uploadFotos = [

  upload.array('fotos'),
  async (req, res) => {
    const { id } = req.params;
    const pool = await poolPromise;

    try {
      for (const file of req.files) {
        const filePath = file.path.replace(/\\/g, '/');
        await pool.request()
          .input('inmueble_id', sql.Int, id)
          .input('url', sql.NVarChar, filePath)
          .query('INSERT INTO FotosInmueble (id_inmueble, foto_url,estado_registro) VALUES (@inmueble_id, @url,1)');
      }

      res.status(201).json({ message: 'Fotos guardadas correctamente' });
    } catch (err) {
      res.status(500).json({ error: err.message });
    }
  }
];

exports.inactivarFoto = async (req, res) => {

  try {
    const {id} = req.params;


    const pool = await poolPromise;

    // Validar si el FMI ya existe


    // Insertar nuevo inmueble
    const result = await pool.request()
      .input('id', sql.Int, id)
      .execute('InactivarFoto');

    const inmuebleId = result;

    res.status(201).json({ message: 'foto Inactivado con id', id });
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};




exports.insertInmueble = async (req, res) => {

  try {

    const requiredFields = [
      'FMI', 'id_subtipo', 'Direccion',
      'id_municipio', 'id_estado_ocupacion', 'Precio', 'id_sucursal',
      'Descripcion', 'link_comercializacion'
    ];
    for (const field of requiredFields) {
      if (!req.body[field]) {
        return res.status(400).json({ error: `Falta el campo obligatorio: ${field}` });
      }
    }
    if (req.body['Precio'] <= 0 || typeof req.body['Precio'] !== 'number') { //Verificar si es numero o debe ser menor a 0
      return res.status(400).json({ error: `Precio debe ser un numero entero o mayor a 0 : Precio ${req.body['Precio']} y debe ser numerico : ${typeof req.body['Precio']}` });
    }
    if (req.body['Area_Terreno'] < 0) { //Verificar si es numero o debe ser menor a 0
      return res.status(400).json({ error: `Area de terreno debe ser mayor a 0` });
    }

    const {
      FMI,
      id_subtipo,
      Area_Terreno,
      Area_Construida,
      Direccion,
      id_municipio,
      id_estado_ocupacion,
      Precio,
      id_sucursal,
      Descripcion,
      link_comercializacion,
      estadoRegistro = 1
    } = req.body;

    const pool = await poolPromise;

    // Validar si el FMI ya existe
    const checkFMI = await pool.request()
      .input('FMI', sql.NVarChar, FMI)
      .query('SELECT id  FROM Inmueble WHERE folio_matricula = @FMI');

    if (checkFMI.recordset.lengh > 0) {
      return res.status(400).json({ error: 'El FMI ya existe en la base de datos. Por favor verificar, puede que este inactivo o activo' });
    }

    // Insertar nuevo inmueble
    const result = await pool
      .request()
      .input('FMI', sql.NVarChar, FMI)
      .input('id_subtipo', sql.Int, id_subtipo)
      .input('Area_Terreno', sql.Float, Area_Terreno)
      .input('Area_Construida', sql.Float, Area_Construida)
      .input('Direccion', sql.NVarChar, Direccion)
      .input('id_municipio', sql.Int, id_municipio)
      .input('id_estado_ocupacion', sql.Int, id_estado_ocupacion)
      .input('Precio', sql.BigInt(18, 2), Precio)
      .input('id_sucursal', sql.Int, id_sucursal)
      .input('Descripcion', sql.NVarChar, Descripcion)
      .input('link_comercializacion', sql.NVarChar, link_comercializacion)
      .input('estadoRegistro', sql.Int, estadoRegistro)
      // .query(`
      //   UPDATE INMUEBLE Inmueble (
      //     folio_matricula, id_subtipo, Area_Terreno, Area_Construida, Direccion,
      //     id_municipio, id_estado_ocupacion, Precio, id_sucursal,
      //     Descripcion, link_comercializacion, estado_registro
      //   )
      //   OUTPUT INSERTED.id
      //   VALUES (
      //     @FMI, @id_subtipo, @Area_Terreno, @Area_Construida, @Direccion,
      //     @id_municipio, @id_estado_ocupacion, @Precio, @id_sucursal,
      //     @Descripcion, @link_comercializacion, @estadoRegistro
      //   )
      // `);
      .execute('InsertInmueble');

    const inmuebleId = result.recordset[0].id

    res.status(201).json({ message: 'Inmueble creado', id: inmuebleId });
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};


exports.editInmueble = async (req, res) => {

  try {
    const { id_inmueble } = req.params;
    // Solo area de tereno y construida pueden estar en 0
    const requiredFields = [
      'FMI', 'id_subtipo', 'Direccion',
      'id_municipio', 'id_estado_ocupacion', 'Precio', 'id_sucursal',
      'Descripcion', 'link_comercializacion'
    ];
    for (const field of requiredFields) {
      if (!req.body[field]) {
        return res.status(400).json({ error: `Falta el campo obligatorio: ${field}` });
      }
    }
    if (req.body['Precio'] <= 0 || typeof req.body['Precio'] !== 'number') { //Verificar si es numero o debe ser menor a 0
      return res.status(400).json({ error: `Precio debe ser un numero entero o mayor a 0 : Precio ${req.body['Precio']} y debe ser numerico : ${typeof req.body['Precio']}` });
    }
    if (req.body['Area_Terreno'] < 0) { //Verificar si es numero o debe ser menor a 0
      return res.status(400).json({ error: `Area de terreno debe ser mayor a 0` });
    }

    const {
      FMI,
      id_subtipo,
      Area_Terreno,
      Area_Construida,
      Direccion,
      id_municipio,
      id_estado_ocupacion,
      Precio,
      id_sucursal,
      Descripcion,
      link_comercializacion,
      estadoRegistro = 1
    } = req.body;

    const pool = await poolPromise;

    // Validar si el FMI ya existe

    const checkFMI = await pool.request()
      .input('id_inmueble', sql.NVarChar, id_inmueble)
      .query('SELECT folio_matricula , id FROM Inmueble WHERE ID = @id_inmueble');

    const folioActual = checkFMI.recordset[0].folio_matricula;

    if (folioActual !== FMI) {

      // valida si el folio es diferente al ingresado desde la peticion
      const validateFMI = await pool.request()
        .input('FMI', sql.NVarChar, FMI)
        .input('id_inmueble', sql.NVarChar, id_inmueble)
      // valida si hay otro inmueble con el inmueble buscado, por su  FMI Y no ID.
        .query('SELECT ID FROM Inmueble WHERE folio_matricula = @FMI AND ID != @id_inmueble');

      // Si hay otro inmueble con el folio de matricula seleccionado se devuelve 
      if (validateFMI.recordset.length > 0) {
        return res.status(400).json({
          error: `El nuevo folio de matrícula (${FMI}) ya está asignado a otro inmueble.`
        });
      }

    }

    // Insertar nuevo inmueble
    const result = await pool.request()
      .input('id', sql.Int, id_inmueble)
      .input('FMI', sql.NVarChar, FMI)
      .input('id_subtipo', sql.Int, id_subtipo)
      .input('Area_Terreno', sql.Float, Area_Terreno)
      .input('Area_Construida', sql.Float, Area_Construida)
      .input('Direccion', sql.NVarChar, Direccion)
      .input('id_municipio', sql.Int, id_municipio)
      .input('id_estado_ocupacion', sql.Int, id_estado_ocupacion)
      .input('Precio', sql.BigInt(18, 2), Precio)
      .input('id_sucursal', sql.Int, id_sucursal)
      .input('Descripcion', sql.NVarChar, Descripcion)
      .input('link_comercializacion', sql.NVarChar, link_comercializacion)
      .input('estadoRegistro', sql.Int, estadoRegistro)
      // .query(`
      //   UPDATE INMUEBLE
      //   SET folio_matricula = @FMI, id_subtipo = @id_subtipo, Area_Terreno = @Area_Terreno,
      //   Area_Construida = @Area_Construida, Direccion = @Direccion , id_municipio = @id_municipio,
      //   id_estado_ocupacion = @id_estado_ocupacion , Precio = @Precio , id_sucursal = @id_sucursal,
      //   Descripcion = @Descripcion , link_comercializacion = @link_comercializacion , 
      //   estado_registro  = @estadoRegistro

      //   WHERE id = @id_inmueble


      // `);
      .execute('UpdateInmueble')

    const inmuebleId = result;

    res.status(201).json({ message: 'Inmueble actualizado con id', id_inmueble });
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};

exports.inactivarInmueble = async (req, res) => {

  try {
    const { id_inmueble } = req.params;


    const pool = await poolPromise;

    // Validar si el FMI ya existe


    // Insertar nuevo inmueble
    const result = await pool.request()
      .input('id', sql.Int, id_inmueble)
      .execute('InactivarInmueble');

    const inmuebleId = result;

    res.status(201).json({ message: 'Inmueble Inactivado con id', id_inmueble });
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};

exports.ActivarInmueble = async (req, res) => {

  try {
    const { id_inmueble } = req.params;


    const pool = await poolPromise;

    // Validar si el FMI ya existe


    // Insertar nuevo inmueble
    const result = await pool.request()
      .input('id', sql.Int, id_inmueble)
      .execute('ActivarInmueble');

    const inmuebleId = result;

    res.status(201).json({ message: 'Inmueble Activado con id', id_inmueble });
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};


exports.getInmuebles = async (req, res) => {
  try {
    const pool = await poolPromise;
    const result = await pool.request().query('EXEC ObtenerInmueblesActivos');
    res.json(result.recordset);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};


exports.getInmueblesconFotos = async (req, res) => {
  try {
    const pool = await poolPromise;
    const result = await pool.request().query('EXEC ObtenerInmueblesActivosConFotos');
    const rows = result.recordset;
    const inmueblesMap = {};

    rows.forEach(row => {
      const id = row.id; // Asegúrate de usar el nombre correcto del campo

      if (!inmueblesMap[id]) {
        // Crear el objeto del inmueble si no existe
        inmueblesMap[id] = {
          InmuebleID: row.id,
          folio_matricula: row.folio_matricula,
          id_subtipo : row.id_subtipo,
          area_terreno: row.area_terreno,
          area_construida : row.area_construida,
          id_municipio : row.id_municipio,
          id_estado_ocupacion : row.id_estado_ocupacion,
          precio : row.precio,
          id_sucursal : row.id_sucursal,
          descripcion : row.descripcion,
          estado_registro : row.eestado_registro_inmueble,
          fecha_creacion : row.estado_registro_fecha_creacion,
          Direccion : row.Direccion,
          link_comercializacion : row.link_comercializacion,
          Fotos: []
        };
      }

      // Agregar la foto actual al array
      inmueblesMap[id].Fotos.push({
        id_inmueble : row.id_inmueble,
        id_foto: row.id_foto,
        foto_url : row.foto_url,
        fecha_creacion_foto: row.fecha_creacion_foto,
        estado_registro_foto : row.estado_registro_foto
      });
    });

    // Convertir el mapa en array
    const inmuebles = Object.values(inmueblesMap);
    // res.json(result.recordset);
      res.json(inmuebles);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};



