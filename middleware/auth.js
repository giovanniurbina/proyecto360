const jwt = require('jsonwebtoken');
const { secretKey } = require('../config/jwtConfig'); // Aquí puedes ajustar la ruta al archivo de configuración de tu clave secreta

// Middleware para verificar el token
const verificarToken = (req, res, next) => {
  const token = req.headers['authorization'];

  if (!token) {
    return res.status(403).json({ message: 'Token no proporcionado' });
  }

  // Remover el 'Bearer ' si está presente en el encabezado de autorización
  const tokenSinBearer = token.split(' ')[1];

  jwt.verify(tokenSinBearer, secretKey, (err, decoded) => {
    if (err) {
      return res.status(401).json({ message: 'Token no válido' });
    }
    req.userId = decoded.id;  // Puedes agregar cualquier otra información que se descodifique
    next();
  });
};

module.exports = verificarToken;
