const { poolPromise } =  require('../Models/db');

exports.getSubtipo = async (req, res) => {
  try {
    const pool = await poolPromise;
    const result = await pool.request().query(`
        select * from TiposPropiedad
    `);
    res.json(result.recordset);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};
