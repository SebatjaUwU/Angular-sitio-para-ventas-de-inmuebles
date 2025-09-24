const express = require('express');
const router = express.Router();
const controller = require('../controllers/inmuebleController');

router.post('/', controller.insertInmueble);
router.post('/:id/Subirfotos', controller.uploadFotos);

router.post('/:id/Eliminarfoto', controller.inactivarFoto);

router.get('/', controller.getInmuebles);


router.post('/:id_inmueble/editar', controller.editInmueble);

router.post('/:id_inmueble/inactivar', controller.inactivarInmueble);

router.post('/:id_inmueble/activar', controller.ActivarInmueble);


router.get('/ObtenerInmuebleConfotos', controller.getInmueblesconFotos);



module.exports = router;
