const Producto = require("../models/Producto");
const db = require("../config/database"); // 

//obtener productos
exports.getProductos = async (req, res) => {
    try {
        // Llamada al procedimiento almacenado
        const [productos] = await db.query("EXEC ObtenerProductos");

        // Enviar los productos como respuesta JSON
        res.status(200).json(productos);
    } catch (error) {
        console.error("Error al obtener productos:", error);
        res.status(500).json({ message: "Error al obtener productos" });
    }
};
// Crear un producto
exports.createProducto = async (req, res) => {
    const {
        CategoriaProductos_idCategoriaProductos,
        usuarios_idusuarios,
        nombre,
        marca,
        codigo,
        stock,
        estados_idestados,
        precio,
        foto,
    } = req.body;

    try {
        // Llamar al procedimiento almacenado
        await db.query(
            "EXEC sp_InsertarProducto @CategoriaProductos_idCategoriaProductos=:CategoriaProductos_idCategoriaProductos, @usuarios_idusuarios=:usuarios_idusuarios, @nombre=:nombre, @marca=:marca, @codigo=:codigo, @stock=:stock, @estados_idestados=:estados_idestados, @precio=:precio, @foto=:foto",
            {
                replacements: {
                    CategoriaProductos_idCategoriaProductos,
                    usuarios_idusuarios,
                    nombre,
                    marca,
                    codigo,
                    stock,
                    estados_idestados,
                    precio,
                    foto: foto || null, // Permitir que foto sea null si no se envía
                },
            }
        );

        res.status(201).json({ message: "Producto creado exitosamente" });
    } catch (error) {
        console.error("Error al crear producto:", error);
        res.status(500).json({ message: "Error al crear producto" });
    }
};

exports.updateProducto = async (req, res) => {
  try {
    // Extraer parámetros de la solicitud
    const { id } = req.params; // ID del producto a actualizar
    const { precio } = req.body; // Nuevo precio

    // Validar que se envíen los datos necesarios
    if (!id || !precio) {
      return res.status(400).json({ message: "ID del producto y precio son requeridos." });
    }

    // Ejecutar el procedimiento almacenado con el nombre correcto del parámetro
    const result = await db.query(
      `EXEC sp_ActualizarPrecioProducto @idProductos = :idProductos, @nuevoPrecio = :nuevoPrecio`,
      {
        replacements: { idProductos: id, nuevoPrecio: precio }, // Reemplazar las variables correctamente
      }
    );

    // Responder al cliente
    res.json({ message: "Producto actualizado correctamente.", result });
  } catch (error) {
    console.error("Error al actualizar el producto:", error);
    res.status(500).json({ message: "Error al actualizar el producto.", error });
  }
};

exports.deleteProducto = async (req, res) => {
  const { id } = req.params;
  await Producto.destroy({ where: { id } });
  res.json({ message: "Producto eliminado" });
};
