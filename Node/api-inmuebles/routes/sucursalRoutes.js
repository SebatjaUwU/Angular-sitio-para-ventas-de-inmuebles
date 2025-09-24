const express = require('express');
const router = express.Router();
const controller = require('../controllers/sucursalController');

router.get('/', controller.getTerritorial);



module.exports = router;
