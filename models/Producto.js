const { DataTypes } = require("sequelize");
const db = require("../config/database"); // Ruta correcta al archivo database.js

// Definición del modelo Producto
const Producto = db.define("Producto", {
  nombre: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  descripcion: {
    type: DataTypes.TEXT,
    allowNull: true,
  },
  precio: {
    type: DataTypes.FLOAT,
    allowNull: false,
  },
  stock: {
    type: DataTypes.INTEGER,
    allowNull: false,
    defaultValue: 0,
  },
});

module.exports = Producto;
