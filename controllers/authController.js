const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');
const { secretKey, expiresIn } = require('../config/jwtConfig');
const db = require('../config/database');

// Controlador para la ruta de login
exports.login = async (req, res) => {
  const { email, password } = req.body;

  try {
    // Buscar el usuario en la base de datos por email
    const [user] = await db.query('SELECT * FROM Usuarios WHERE email = ?', {
      replacements: [email],
      type: db.QueryTypes.SELECT,
    });

    if (!user) {
      return res.status(400).json({ message: 'Usuario no encontrado' });
    }

    // Verificar la contraseña
    const validPassword = await bcrypt.compare(password, user.password);
    if (!validPassword) {
      return res.status(400).json({ message: 'Contraseña incorrecta' });
    }

    // Generar el JWT
    const token = jwt.sign(
      { id: user.idUsuarios },  // Incluye la información que quieras guardar en el token
      secretKey,
      { expiresIn: expiresIn }
    );

    // Enviar el token en la respuesta
    res.status(200).json({ message: 'Login exitoso', token });
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Error en el servidor' });
  }
};
