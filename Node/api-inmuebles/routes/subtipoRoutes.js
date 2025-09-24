const express = require('express');
const router = express.Router();
const controller = require('../controllers/subtipoController');

router.get('/', controller.getSubtipo);

module.exports = router;
