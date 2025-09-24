const { poolPromise } =  require('../Models/db');

exports.getTerritorial = async (req, res) => {
  try {
    const pool = await poolPromise;
    const result = await pool.request().query(`
       select * from Sucursales
    `);
    res.json(result.recordset);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};
