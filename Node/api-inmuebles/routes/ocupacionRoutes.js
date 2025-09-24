const express = require('express');
const router = express.Router();
const controller = require('../controllers/ocupacionController');

router.get('/', controller.getEstadoOcupacion);

module.exports = router;
