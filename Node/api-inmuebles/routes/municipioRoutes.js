const express = require('express');
const router = express.Router();
const controller = require('../controllers/municipioController');

router.get('/', controller.getMunicipios);

router.get('/:id', controller.getDepartamento);



module.exports = router;
