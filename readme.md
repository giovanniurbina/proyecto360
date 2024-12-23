# Proyecto API de Gestión de Clientes y Órdenes

Este proyecto es una API RESTful para gestionar clientes y órdenes en un sistema. La API está protegida por autenticación mediante JSON Web Tokens (JWT) y permite realizar operaciones CRUD para los clientes y las órdenes.

## Requisitos

- **Node.js** (version 16 o superior)
- **npm** (viene con Node.js)
- **Base de datos**: SQL Server (u otra que utilices)
- **Postman** (para probar las APIs)

## Configuración del Proyecto

### 1. Clonar el Repositorio

Clona este repositorio en local:

```bash
git clone https://github.com/tu_usuario/proyecto360.git

instrucciones

cd proyecto360
npm install

.env
DB_HOST=localhost
DB_USER=usuario_db
DB_PASSWORD=contraseña_db
DB_NAME=GDA0037-OT-JONATHANURBINA
JWT_SECRET=tu_clave_secreta

npm start


Claro, aquí tienes un ejemplo de cómo estructurar un archivo README.md para tu proyecto en GitHub, que incluye las instrucciones básicas de cómo usarlo, cómo configurar el entorno, cómo interactuar con la API, y cómo probarla con herramientas como Postman.

README.md
markdown
Copy code
# Proyecto API de Gestión de Clientes y Órdenes

Este proyecto es una API RESTful para gestionar clientes y órdenes en un sistema. La API está protegida por autenticación mediante JSON Web Tokens (JWT) y permite realizar operaciones CRUD para los clientes y las órdenes.

## Requisitos

- **Node.js** (version 16 o superior)
- **npm** (viene con Node.js)
- **Base de datos**: SQL Server (u otra que utilices)
- **Postman** (para probar las APIs)

## Configuración del Proyecto

### 1. Clonar el Repositorio

Clona este repositorio en tu máquina local:

```bash
git clone https://github.com/giovanniurbina/proyecto360
2. Instalación de Dependencias
Accede a la carpeta del proyecto e instala las dependencias necesarias:

bash
Copy code
cd proyecto360
npm install
3. Configuración de la Base de Datos
Asegúrate de tener una base de datos SQL Server configurada.
Crea una base de datos llamada GDA0037-OT-JONATHANURBINA (o la que prefieras) y las tablas necesarias para el proyecto.
Configura la conexión a la base de datos en el archivo config/database.js.
4. Variables de Entorno
Crea un archivo .env en la raíz del proyecto y agrega las siguientes variables:

env
Copy code
DB_HOST=localhost
DB_USER=usuario_db
DB_PASSWORD=contraseña_db
DB_NAME=GDA0037-OT-JONATHANURBINA
JWT_SECRET=tu_clave_secreta
Nota: Cambia los valores de la base de datos y la clave secreta del JWT según tu entorno.

5. Ejecución del Proyecto
Para iniciar el servidor, usa el siguiente comando:

bash
Copy code
npm start
El servidor correrá en http://localhost:3000.

Rutas de la API
1. Login (POST /api/login)
Genera un JWT de autenticación.

Requiere:

email: El correo electrónico del usuario.
password: La contraseña del usuario.
Ejemplo de cuerpo de solicitud en Postman:

json
Copy code
{
  "email": "usuario@ejemplo.com",
  "password": "mi_contraseña"
}
Respuesta de éxito:

json
Copy code
{
  "token": "jwt_token_aqui"
}
2. Clientes
2.1 Crear Cliente (POST /api/clientes)
Crea un nuevo cliente.

Requiere:

razon_social: Razón social del cliente.
nombre_comercial: Nombre comercial del cliente.
direccion_entrega: Dirección de entrega.
telefono: Número de teléfono.
email: Correo electrónico.
Ejemplo de cuerpo de solicitud en Postman:

json
Copy code
{
  "razon_social": "Empresa S.A.",
  "nombre_comercial": "Mi Empresa",
  "direccion_entrega": "Calle Ficticia 123, Ciudad",
  "telefono": "+50212345678",
  "email": "contacto@empresa.com"
}
Respuesta de éxito:

json
Copy code
{
  "message": "Cliente creado correctamente"
}
2.2 Actualizar Cliente (PUT /api/clientes/:idClientes)
Actualiza un cliente existente.

Requiere:

idClientes: ID del cliente a actualizar (en la URL).
razon_social: Nueva razón social.
nombre_comercial: Nuevo nombre comercial.
direccion_entrega: Nueva dirección de entrega.
telefono: Nuevo teléfono.
email: Nuevo correo electrónico.
Ejemplo de cuerpo de solicitud en Postman:

json
Copy code
{
  "razon_social": "Empresa S.A. Actualizada",
  "nombre_comercial": "Mi Empresa Actualizada",
  "direccion_entrega": "Calle Actualizada 456, Ciudad Ficticia",
  "telefono": "+50287654321",
  "email": "contacto_actualizado@empresa.com"
}
Respuesta de éxito:

json
Copy code
{
  "message": "Cliente actualizado correctamente"
}
2.3 Obtener Clientes (GET /api/clientes)
Obtén una lista de todos los clientes.

Respuesta de éxito:

json
Copy code
[
  {
    "idClientes": 1,
    "razon_social": "Empresa S.A.",
    "nombre_comercial": "Mi Empresa",
    "direccion_entrega": "Calle Ficticia 123, Ciudad",
    "telefono": "+50212345678",
    "email": "contacto@empresa.com"
  },
  ...
]
2.4 Eliminar Cliente (DELETE /api/clientes/:idClientes)
Elimina un cliente existente.

Requiere:

idClientes: ID del cliente a eliminar.
Respuesta de éxito:

json
Copy code
{
  "message": "Cliente eliminado correctamente"
}
3. Órdenes
3.1 Crear Orden (POST /api/ordenes)
Crea una nueva orden. (Aquí puedes incluir detalles específicos sobre cómo manejar las órdenes en la API).

3.2 Obtener Ordenes (GET /api/ordenes)
Obtén una lista de todas las órdenes.
