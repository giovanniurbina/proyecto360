// controllers/clientesController.js

const db = require("../config/database");

// Controlador para insertar un cliente
exports.insertarCliente = async (req, res) => {
  const { razon_social, nombre_comercial, direccion_entrega, telefono, email } = req.body;

  try {
    // Ejecutar el procedimiento almacenado para insertar cliente
    await db.query(
      `EXEC sp_InsertarCliente @razon_social = ?, @nombre_comercial = ?, @direccion_entrega = ?, @telefono = ?, @email = ?`,
      {
        replacements: [razon_social, nombre_comercial, direccion_entrega, telefono, email],
        type: db.QueryTypes.SELECT
      }
    );

    res.status(201).json({ message: "Cliente insertado correctamente" });
  } catch (error) {
    console.error("Error al insertar cliente:", error);
    res.status(500).json({ message: "Error al insertar cliente", error });
  }
};

// Controlador para actualizar un cliente
exports.actualizarCliente = async (req, res) => {
    const { razon_social, nombre_comercial, direccion_entrega, telefono, email } = req.body;
    let { idClientes } = req.params;
  
    try {
      // Asegúrate de que idClientes sea un número entero
      idClientes = parseInt(idClientes, 10);
  
      // Verificar si el ID es válido
      if (isNaN(idClientes)) {
        return res.status(400).json({ message: "El ID del cliente no es válido" });
      }
  
      // Ejecutar el procedimiento almacenado para actualizar cliente
      await db.query(
        `EXEC sp_ActualizarCliente @idClientes = ?, @razon_social = ?, @nombre_comercial = ?, @direccion_entrega = ?, @telefono = ?, @email = ?`,
        {
          replacements: [idClientes, razon_social, nombre_comercial, direccion_entrega, telefono, email],
          type: db.QueryTypes.SELECT
        }
      );
  
      res.status(200).json({ message: "Cliente actualizado correctamente" });
    } catch (error) {
      console.error("Error al actualizar cliente:", error);
      res.status(500).json({ message: "Error al actualizar cliente", error });
    }
  };
  