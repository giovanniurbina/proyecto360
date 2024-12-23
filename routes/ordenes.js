const express = require("express");
const router = express.Router();
const ordenesController = require("../controllers/ordenesController");

// Ruta para insertar una orden (encabezado)
router.post("/", ordenesController.insertarOrden);

// Ruta para insertar los detalles de la orden
router.post("/:idOrden/detalles", ordenesController.insertarOrdenDetalle);

module.exports = router;
