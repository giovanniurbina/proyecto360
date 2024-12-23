const express = require("express");
const router = express.Router();
const categoriasController = require("../controllers/categoriasController");

router.get("/", categoriasController.getCategorias);
router.post("/", categoriasController.createCategoria);
// Ruta para actualizar una categoría
router.put("/", categoriasController.updateCategoria);

module.exports = router;
