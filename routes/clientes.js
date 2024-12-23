
const express = require("express");
const router = express.Router();
const clientesController = require("../controllers/clientesController");

// Ruta para insertar un cliente
router.post("/", clientesController.insertarCliente);

// Ruta para actualizar un cliente
router.put("/:idClientes", clientesController.actualizarCliente);

module.exports = router;
