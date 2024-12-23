const { Sequelize } = require("sequelize");

// Configuración de la conexión a la base de datos
const db = new Sequelize("GDA0037-OT-JONATHANURBINA", "sa", "123456", {
  host: "localhost", // Cambia según tu configuración
  dialect: "mssql",  
  logging: false,    // Desactiva logs si no los necesitas
});

module.exports = db;
