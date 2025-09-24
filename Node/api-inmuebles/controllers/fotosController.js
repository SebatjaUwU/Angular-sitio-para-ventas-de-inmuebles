const { poolPromise, sql } = require('../Models/db');

exports.getFotos = async (req, res) => {
  try {
    const { id_inmueble } = req.params; // o req.query si lo pasas como ?id_inmueble=1
    const pool = await poolPromise;

    const result = await pool
      .request()
      .input('id', sql.Int, id_inmueble)
      .execute('ObtenerFotosInmuebleActivos')

    res.json(result.recordset);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};

