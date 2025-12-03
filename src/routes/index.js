const express = require('express');
const router = express.Router();
const homeController = require('../controllers/homeController');


router.get('/', homeController.index);
router.post('/contacto', homeController.submit);
router.get('/programadores/:id', homeController.detail);

module.exports = router;
