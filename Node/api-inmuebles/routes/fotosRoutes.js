const express = require('express');
const router = express.Router();
const controller = require('../controllers/fotosController');


router.get('/:id_inmueble', controller.getFotos);




module.exports = router;
