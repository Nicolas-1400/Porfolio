const express = require("express");
const router = express.Router();
const homeController = require("../controllers/homeController");

router.get("/", homeController.inicio);
router.post("/contacto", homeController.enviarFormulario);
router.get("/programadores/:id", homeController.detalle);

module.exports = router;
