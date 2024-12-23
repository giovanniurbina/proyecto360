const express = require("express");
const router = express.Router();
const usuariosController = require("../controllers/usuariosController");

// Ruta para crear un nuevo usuario
router.post("/", usuariosController.createUsuario);
// Ruta para actualizar un usuario
router.put("/:idusuarios", usuariosController.updateUsuario);

module.exports = router;
