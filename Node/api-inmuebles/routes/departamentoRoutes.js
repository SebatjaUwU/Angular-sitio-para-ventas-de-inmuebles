const express = require('express');
const router = express.Router();
const controller = require('../controllers/departamentoController');



router.get('/', controller.getDepartamentostotal);



module.exports = router;
