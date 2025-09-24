const { poolPromise, sql } = require('../Models/db');

exports.getMunicipios = async (req, res) => {
  try {
    const pool = await poolPromise;
    const result = await pool.request().query('SELECT * FROM Municipios');
    res.json(result.recordset);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};




exports.getDepartamento = async (req, res) => {
  try {
    const { id } = req.params; // o req.query si lo pasas como ?id_inmueble=1
    const pool = await poolPromise;

    const result = await pool
      .request()
      .input('id', sql.Int, id)
      .query(`
     select 
d.nombre
from municipios m
inner join Departamentos d on  m.departamento_id = d.id
where m.id = @id
    `);

    res.json(result.recordset);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};




