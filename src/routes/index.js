const express = require('express');
const router = express.Router();
const controladorInicio = require('../controllers/homeController');


router.get('/', controladorInicio.inicio);
router.post('/contacto', controladorInicio.enviarFormulario);
router.get('/programadores/:id', controladorInicio.detalle);

module.exports = router;
