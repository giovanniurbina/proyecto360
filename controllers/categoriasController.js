const Categoria = require('../models/categoria');
const db = require("../config/database"); // 


exports.getCategorias = async (req, res) => {
    try {
      // Ejecutar el procedimiento almacenado
      const result = await db.query(
        `EXEC sp_ObtenerCategorias`, // Llamamos al procedimiento almacenado
        {
          type: db.QueryTypes.SELECT, // Indicamos que esperamos un SELECT
        }
      );
   
      console.log(result); // Agrega este log para depurar
   
      // Si obtenemos resultados, los devolvemos
      if (result.length > 0) {
        res.json({ categorias: result });
      } else {
        res.status(404).json({ message: "No se encontraron categorías." });
      }
    } catch (error) {
      console.error("Error al obtener las categorías:", error);
      res.status(500).json({ message: "Error al obtener las categorías.", error });
    }
   };

// Controlador para crear una nueva categoría
exports.createCategoria = async (req, res) => {
  try {
    // Extraer los parámetros de la solicitud
    const { usuarios_idusuarios, estados_idestados, nombre } = req.body;

    // Validar que se envíen todos los datos necesarios
    if (!usuarios_idusuarios || !estados_idestados || !nombre) {
      return res.status(400).json({ message: "Faltan datos requeridos: usuario, estado y nombre." });
    }

    // Ejecutar el procedimiento almacenado para crear la categoría
    await db.query(
      `EXEC sp_CrearCategoria @usuarios_idusuarios = :usuarios_idusuarios, @estados_idestados = :estados_idestados, @nombre = :nombre`,
      {
        replacements: { usuarios_idusuarios, estados_idestados, nombre }, // Reemplazar los parámetros
      }
    );

    // Responder al cliente que la categoría se ha creado exitosamente
    res.json({ message: "Categoría creada correctamente." });
  } catch (error) {
    console.error("Error al crear la categoría:", error);
    res.status(500).json({ message: "Error al crear la categoría.", error });
  }
};

// Controlador para actualizar una categoría
exports.updateCategoria = async (req, res) => {
  try {
    // Extraer los parámetros de la solicitud
    const { idCategoriaProductos, usuarios_idusuarios, estados_idestados, nombre } = req.body;

    // Validar que se envíen todos los datos necesarios
    if (!idCategoriaProductos || !usuarios_idusuarios || !estados_idestados || !nombre) {
      return res.status(400).json({ message: "Faltan datos requeridos: idCategoria, usuario, estado y nombre." });
    }

    // Ejecutar el procedimiento almacenado para actualizar la categoría
    await db.query(
      `EXEC sp_ActualizarCategoria @idCategoriaProductos = :idCategoriaProductos, 
                                    @usuarios_idusuarios = :usuarios_idusuarios, 
                                    @estados_idestados = :estados_idestados, 
                                    @nombre = :nombre`,
      {
        replacements: { idCategoriaProductos, usuarios_idusuarios, estados_idestados, nombre }, // Reemplazar los parámetros
      }
    );

    // Responder al cliente que la categoría ha sido actualizada correctamente
    res.json({ message: "Categoría actualizada correctamente." });
  } catch (error) {
    console.error("Error al actualizar la categoría:", error);
    res.status(500).json({ message: "Error al actualizar la categoría.", error });
  }
};

