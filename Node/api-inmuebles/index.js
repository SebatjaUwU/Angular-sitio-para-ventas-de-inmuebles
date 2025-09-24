const express = require('express');
const cors = require('cors');
const app = express();
const path = require('path');
// Middleware
app.use(cors());

// Servir archivos estáticos del frontend Angular
//  REAL : app.use(express.static(path.join(__dirname, '..', '..'  ,'Angular')));

// app.use(express.static(path.join(__dirname, '..', '..'  ,'Angular')));

// Redirigir cualquier ruta que no sea API ni /uploads al index.html
// app.get(/^\/(?!api|uploads).*/, (req, res) => {
//   res.sendFile(path.join(__dirname, '..', '..' , 'Angular', 'index.html'));
// });



app.use(express.json());

// Rutas
const municipioRoutes = require('./routes/municipioRoutes');
app.use('/api/municipios', municipioRoutes);

const departamentoRoutes = require('./routes/departamentoRoutes');
app.use('/api/departamentos', departamentoRoutes);





const ocupacionRoutes = require('./routes/ocupacionRoutes');
app.use('/api/ocupacion', ocupacionRoutes);

const subtipoRoutes = require('./routes/subtipoRoutes');
app.use('/api/subtipo', subtipoRoutes);

const sucursalRoutes = require('./routes/sucursalRoutes.js');
app.use('/api/sucursal', sucursalRoutes);


const inmueblesRoutes = require('./routes/inmueblesRoutes.js');
app.use('/api/inmueble', inmueblesRoutes);


const fotosRoutes = require('./routes/fotosRoutes.js');
app.use('/api/fotos', fotosRoutes);

//carpeta uploads para ser accesible, en el codigo de inmuebles

app.use('/uploads', express.static('uploads'));



// Servidor

const PORT = process.env.PORT || 3000;


app.get('/', (req, res) => {
  res.json({ mensaje: 'Bienvenido a la API de Ventas SAE' });
});


app.listen(PORT, () => {
  console.log(`🚀 Servidor corriendo en http://localhost:${PORT}`);
});
