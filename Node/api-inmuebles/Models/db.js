const sql = require('mssql');

const config = {
  user: 'Aplicativo_Desarrollo',
  password: 'Saesas2017+',
  server: 'DEVELOPSERVER\\DEVELOPSERVER', // Ej: 'localhost' o '192.168.1.100'
  database: 'VentasSAE',
  options: {
    encrypt: false, // true si usas Azure
    trustServerCertificate: true,
  },
};

const poolPromise = new sql.ConnectionPool(config)
  .connect()
  .then(pool => {
    console.log('✅ Conectado a SQL Server');
    return pool;
  })
  .catch(err => {
    console.error('❌ Error de conexión:', err);
  });

module.exports = {
  sql,
  poolPromise,
};
