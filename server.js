const express = require("express");
const db = require("./config/database");
const verificarToken = require("./middleware/auth");  // Importa el middleware aquí

const app = express();

// Middleware
app.use(express.json());

// Rutas
app.use("/api/login", require("./routes/authRoutes"));  // Ruta para login

// Rutas protegidas que requieren autenticación
app.use("/api/clientes", verificarToken, require("./routes/clientes"));
app.use("/api/ordenes", verificarToken, require("./routes/ordenes"));

// Rutas existentes
app.use("/api/productos", require("./routes/productos"));
//ruta categorias
app.use("/api/categorias", require("./routes/categorias"));
//ruta usuarios
app.use("/api/usuarios", require("./routes/usuarios"));
//ruta ordenes
app.use("/api/ordenes", require("./routes/ordenes"));
//ruta clientes
app.use("/api/clientes", require("./routes/clientes"));

// Probar la conexión a la base de datos
db.authenticate()
  .then(() => console.log("Conexión exitosa a la base de datos"))
  .catch((error) => console.error("Error conectando a la base de datos:", error));

// Iniciar el servidor
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Servidor corriendo en el puerto ${PORT}`);
});
