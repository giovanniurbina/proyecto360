const bcrypt = require('bcrypt');
const db = require("../config/database"); // Conexión a la base de datos

// Controlador para insertar un nuevo usuario
exports.createUsuario = async (req, res) => {
  try {
    // Extraer los parámetros de la solicitud
    const { rol_idrol, estados_idestados, correo_electronico, nombre_completo, password, telefono, fecha_nacimiento, Clientes_idClientes } = req.body;

    // Validar que se envíen todos los datos necesarios
    if (!rol_idrol || !estados_idestados || !correo_electronico || !nombre_completo || !password || !telefono || !fecha_nacimiento || !Clientes_idClientes) {
      return res.status(400).json({ message: "Faltan datos requeridos." });
    }

    // Encriptar la contraseña antes de insertarla
    const saltRounds = 10; // Número de rondas para la encriptación
    const hashedPassword = await bcrypt.hash(password, saltRounds);

    // Ejecutar el procedimiento almacenado para insertar el usuario con la contraseña encriptada
    await db.query(
      `EXEC sp_InsertarUsuario @rol_idrol = :rol_idrol, 
                                @estados_idestados = :estados_idestados, 
                                @correo_electronico = :correo_electronico, 
                                @nombre_completo = :nombre_completo, 
                                @password = :password, 
                                @telefono = :telefono, 
                                @fecha_nacimiento = :fecha_nacimiento, 
                                @Clientes_idClientes = :Clientes_idClientes`,
      {
        replacements: { rol_idrol, estados_idestados, correo_electronico, nombre_completo, password: hashedPassword, telefono, fecha_nacimiento, Clientes_idClientes },
      }
    );

    // Responder al cliente que el usuario fue creado correctamente
    res.json({ message: "Usuario creado correctamente." });
  } catch (error) {
    console.error("Error al crear el usuario:", error);
    res.status(500).json({ message: "Error al crear el usuario.", error });
  }
};


exports.updateUsuario = async (req, res) => {
    try {
      // Extraer los parámetros de la solicitud
      const { rol_idrol, estados_idestados, correo_electronico, nombre_completo, password, telefono, fecha_nacimiento, Clientes_idClientes } = req.body;
      const { idusuarios } = req.params; // Obtener idusuarios desde los parámetros de la URL
  
      // Validar que se envíen todos los datos necesarios
      if (!idusuarios || !rol_idrol || !estados_idestados || !correo_electronico || !nombre_completo || !password || !telefono || !fecha_nacimiento || !Clientes_idClientes) {
        return res.status(400).json({ message: "Faltan datos requeridos." });
      }
  
      // Encriptar la nueva contraseña antes de enviarla
      const saltRounds = 10; // Número de rondas para la encriptación
      const hashedPassword = await bcrypt.hash(password, saltRounds);
  
      // Ejecutar el procedimiento almacenado para actualizar el usuario con la contraseña encriptada
      await db.query(
        `EXEC sp_ActualizarUsuario @idusuarios = :idusuarios,
                                    @rol_idrol = :rol_idrol,
                                    @estados_idestados = :estados_idestados,
                                    @correo_electronico = :correo_electronico,
                                    @nombre_completo = :nombre_completo,
                                    @password = :password,
                                    @telefono = :telefono,
                                    @fecha_nacimiento = :fecha_nacimiento,
                                    @Clientes_idClientes = :Clientes_idClientes`,
        {
          replacements: { idusuarios, rol_idrol, estados_idestados, correo_electronico, nombre_completo, password: hashedPassword, telefono, fecha_nacimiento, Clientes_idClientes },
        }
      );
  
      // Responder al cliente que el usuario fue actualizado correctamente
      res.json({ message: "Usuario actualizado correctamente." });
    } catch (error) {
      console.error("Error al actualizar el usuario:", error);
      res.status(500).json({ message: "Error al actualizar el usuario.", error });
    }
  };
  