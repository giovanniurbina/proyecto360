const express = require("express");
const jwt = require("jsonwebtoken");
const bcrypt = require("bcryptjs"); // O el método que uses para las contraseñas
const { secretKey } = require("../config/jwtConfig"); // Ruta a tu archivo de configuración de la clave secreta
const db = require("../config/database");

const router = express.Router();

// Ruta de Login
router.post("/", async (req, res) => {
  const { email, password } = req.body;

  try {
    // Verificar si el usuario existe en la base de datos
    const user = await db.query(
      "SELECT * FROM Usuarios WHERE email = ?",
      { replacements: [email], type: db.QueryTypes.SELECT }
    );

    if (user.length === 0) {
      return res.status(404).json({ message: "Usuario no encontrado" });
    }

    // Verificar si la contraseña es correcta
    const passwordValido = await bcrypt.compare(password, user[0].password);

    if (!passwordValido) {
      return res.status(401).json({ message: "Contraseña incorrecta" });
    }

    // Generar el token JWT
    const token = jwt.sign({ id: user[0].id }, secretKey, { expiresIn: '24h' });

    // Enviar el token al cliente
    res.status(200).json({ token });
  } catch (error) {
    console.error("Error al autenticar:", error);
    res.status(500).json({ message: "Error al autenticar usuario", error });
  }
});

module.exports = router;
