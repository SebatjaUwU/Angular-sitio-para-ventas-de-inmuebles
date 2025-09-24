const { poolPromise, sql } = require('../Models/db');


exports.getDepartamentostotal = async (req, res) => {
  try {
    const pool = await poolPromise;
    const result = await pool.request().query('EXEC ObtenerDepartamentos');
    res.json(result.recordset);

  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};