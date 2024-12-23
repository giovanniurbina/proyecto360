const db = require("../config/database"); // 

// Función para insertar la orden
exports.insertarOrden = async (req, res) => {
  try {
    const { usuarios_idusuarios, estados_idestados, nombre_completo, direccion, telefono, correo_electronico, fecha_entrega, total_orden } = req.body;

    // Validar que los datos requeridos estén presentes
    if (!usuarios_idusuarios || !estados_idestados || !nombre_completo || !direccion || !telefono || !correo_electronico || !fecha_entrega || !total_orden) {
      return res.status(400).json({ message: "Faltan datos requeridos." });
    }

    // Insertar la orden (encabezado)
    const result = await db.query(
      `EXEC sp_InsertarOrden @usuarios_idusuarios = :usuarios_idusuarios, 
                             @estados_idestados = :estados_idestados, 
                             @nombre_completo = :nombre_completo, 
                             @direccion = :direccion, 
                             @telefono = :telefono, 
                             @correo_electronico = :correo_electronico, 
                             @fecha_entrega = :fecha_entrega, 
                             @total_orden = :total_orden`,
      {
        replacements: {
          usuarios_idusuarios,
          estados_idestados,
          nombre_completo,
          direccion,
          telefono,
          correo_electronico,
          fecha_entrega,
          total_orden
        }
      }
    );

    res.json({ message: "Orden creada correctamente." });
  } catch (error) {
    console.error("Error al insertar la orden:", error);
    res.status(500).json({ message: "Error al insertar la orden.", error });
  }
};

// Función para insertar los detalles de la orden
exports.insertarOrdenDetalle = async (req, res) => {
  try {
    const { Orden_idOrden, Productos_idProductos, cantidad, precio, subtotal } = req.body;

    // Validar que los datos requeridos estén presentes
    if (!Orden_idOrden || !Productos_idProductos || !cantidad || !precio || !subtotal) {
      return res.status(400).json({ message: "Faltan datos requeridos." });
    }

    // Insertar los detalles de la orden
    const result = await db.query(
      `EXEC sp_InsertarOrdenDetalle @Orden_idOrden = :Orden_idOrden, 
                                    @Productos_idProductos = :Productos_idProductos, 
                                    @cantidad = :cantidad, 
                                    @precio = :precio, 
                                    @subtotal = :subtotal`,
      {
        replacements: {
          Orden_idOrden,
          Productos_idProductos,
          cantidad,
          precio,
          subtotal
        }
      }
    );

    res.json({ message: "Detalle de la orden agregado correctamente." });
  } catch (error) {
    console.error("Error al insertar el detalle de la orden:", error);
    res.status(500).json({ message: "Error al insertar el detalle de la orden.", error });
  }
};
