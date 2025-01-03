USE [master]
GO
/****** Object:  Database [GDA0037-OT-JONATHANURBINA]    Script Date: 22/12/2024 23:50:41 ******/
CREATE DATABASE [GDA0037-OT-JONATHANURBINA]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GDA0037-OT-JONATHANURBINA', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\GDA0037-OT-JONATHANURBINA.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'GDA0037-OT-JONATHANURBINA_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\GDA0037-OT-JONATHANURBINA_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [GDA0037-OT-JONATHANURBINA] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GDA0037-OT-JONATHANURBINA].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GDA0037-OT-JONATHANURBINA] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GDA0037-OT-JONATHANURBINA] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GDA0037-OT-JONATHANURBINA] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GDA0037-OT-JONATHANURBINA] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GDA0037-OT-JONATHANURBINA] SET ARITHABORT OFF 
GO
ALTER DATABASE [GDA0037-OT-JONATHANURBINA] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [GDA0037-OT-JONATHANURBINA] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GDA0037-OT-JONATHANURBINA] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GDA0037-OT-JONATHANURBINA] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GDA0037-OT-JONATHANURBINA] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GDA0037-OT-JONATHANURBINA] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GDA0037-OT-JONATHANURBINA] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GDA0037-OT-JONATHANURBINA] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GDA0037-OT-JONATHANURBINA] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GDA0037-OT-JONATHANURBINA] SET  ENABLE_BROKER 
GO
ALTER DATABASE [GDA0037-OT-JONATHANURBINA] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GDA0037-OT-JONATHANURBINA] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GDA0037-OT-JONATHANURBINA] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GDA0037-OT-JONATHANURBINA] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GDA0037-OT-JONATHANURBINA] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GDA0037-OT-JONATHANURBINA] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [GDA0037-OT-JONATHANURBINA] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GDA0037-OT-JONATHANURBINA] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [GDA0037-OT-JONATHANURBINA] SET  MULTI_USER 
GO
ALTER DATABASE [GDA0037-OT-JONATHANURBINA] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GDA0037-OT-JONATHANURBINA] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GDA0037-OT-JONATHANURBINA] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GDA0037-OT-JONATHANURBINA] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [GDA0037-OT-JONATHANURBINA] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [GDA0037-OT-JONATHANURBINA] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [GDA0037-OT-JONATHANURBINA] SET QUERY_STORE = ON
GO
ALTER DATABASE [GDA0037-OT-JONATHANURBINA] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [GDA0037-OT-JONATHANURBINA]
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 22/12/2024 23:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos](
	[idProductos] [int] IDENTITY(1,1) NOT NULL,
	[CategoriaProductos_idCategoriaProductos] [int] NOT NULL,
	[usuarios_idusuarios] [int] NOT NULL,
	[nombre] [varchar](45) NULL,
	[marca] [varchar](45) NULL,
	[codigo] [varchar](45) NULL,
	[stock] [float] NULL,
	[estados_idestados] [int] NOT NULL,
	[precio] [float] NULL,
	[fecha_creacion] [datetime] NULL,
	[foto] [varbinary](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[idProductos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[Vista_Productos_Activos]    Script Date: 22/12/2024 23:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Vista_Productos_Activos] AS
SELECT 
    COUNT(*) AS Total_Productos_Activos
FROM [GDA0037-OT-JONATHANURBINA].[dbo].[Productos]
WHERE [stock] > 0 AND [estados_idestados] = 1; 
GO
/****** Object:  Table [dbo].[Orden]    Script Date: 22/12/2024 23:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orden](
	[idOrden] [int] IDENTITY(1,1) NOT NULL,
	[usuarios_idusuarios] [int] NOT NULL,
	[estados_idestados] [int] NOT NULL,
	[fecha_creacion] [datetime] NULL,
	[nombre_completo] [varchar](545) NULL,
	[direccion] [varchar](545) NULL,
	[telefono] [varchar](45) NULL,
	[correo_electronico] [varchar](45) NULL,
	[fecha_entrega] [date] NULL,
	[total_orden] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[idOrden] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Vista_Ordenes_Agosto_2024]    Script Date: 22/12/2024 23:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Vista_Ordenes_Agosto_2024] AS
SELECT 
    SUM(total_orden) AS Total_Quetzales_Agosto_2024
FROM [GDA0037-OT-JONATHANURBINA].[dbo].[Orden]
WHERE MONTH(fecha_entrega) = 8 AND YEAR(fecha_entrega) = 2024;
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 22/12/2024 23:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[idClientes] [int] IDENTITY(1,1) NOT NULL,
	[razon_social] [varchar](245) NOT NULL,
	[nombre_comercial] [varchar](345) NULL,
	[direccion_entrega] [varchar](45) NULL,
	[telefono] [varchar](45) NULL,
	[email] [varchar](45) NULL,
PRIMARY KEY CLUSTERED 
(
	[idClientes] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Top10ClientesMayorConsumo]    Script Date: 22/12/2024 23:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Top10ClientesMayorConsumo] AS
SELECT TOP 10
    c.idClientes,
    c.razon_social,
    c.nombre_comercial,
    SUM(o.total_orden) AS total_consumo
FROM
    [GDA0037-OT-JONATHANURBINA].[dbo].[Clientes] c
JOIN
    [GDA0037-OT-JONATHANURBINA].[dbo].[Orden] o
    ON c.idClientes = o.usuarios_idusuarios  
GROUP BY
    c.idClientes,
    c.razon_social,
    c.nombre_comercial
ORDER BY
    total_consumo DESC;
GO
/****** Object:  Table [dbo].[OrdenDetalles]    Script Date: 22/12/2024 23:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrdenDetalles](
	[idOrdenDetalles] [int] IDENTITY(1,1) NOT NULL,
	[Orden_idOrden] [int] NOT NULL,
	[Productos_idProductos] [int] NOT NULL,
	[cantidad] [int] NULL,
	[precio] [float] NULL,
	[subtotal] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[idOrdenDetalles] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Vista_Top10_Productos_Mas_Vendidos]    Script Date: 22/12/2024 23:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Vista_Top10_Productos_Mas_Vendidos] AS
SELECT TOP 10
    p.idProductos,
    p.nombre AS Producto,
    p.marca,
    SUM(od.cantidad) AS Total_Vendido
FROM 
    [GDA0037-OT-JONATHANURBINA].[dbo].[Productos] p
JOIN 
    [GDA0037-OT-JONATHANURBINA].[dbo].[OrdenDetalles] od ON p.idProductos = od.Productos_idProductos
JOIN 
    [GDA0037-OT-JONATHANURBINA].[dbo].[Orden] o ON od.Orden_idOrden = o.idOrden
GROUP BY 
    p.idProductos, p.nombre, p.marca
ORDER BY 
    Total_Vendido DESC;
GO
/****** Object:  Table [dbo].[AuditoriaErrores]    Script Date: 22/12/2024 23:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AuditoriaErrores](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fecha_error] [datetime] NULL,
	[procedimiento] [varchar](100) NULL,
	[mensaje_error] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CategoriaProductos]    Script Date: 22/12/2024 23:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoriaProductos](
	[idCategoriaProductos] [int] IDENTITY(1,1) NOT NULL,
	[usuarios_idusuarios] [int] NOT NULL,
	[estados_idestados] [int] NOT NULL,
	[nombre] [varchar](45) NULL,
	[fecha_creacion] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idCategoriaProductos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Estados]    Script Date: 22/12/2024 23:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estados](
	[idestados] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](45) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idestados] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rol]    Script Date: 22/12/2024 23:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rol](
	[idrol] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](45) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idrol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 22/12/2024 23:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[idusuarios] [int] IDENTITY(1,1) NOT NULL,
	[rol_idrol] [int] NOT NULL,
	[estados_idestados] [int] NOT NULL,
	[correo_electronico] [varchar](45) NULL,
	[nombre_completo] [varchar](45) NULL,
	[password] [varchar](45) NULL,
	[telefono] [varchar](45) NULL,
	[fecha_nacimiento] [date] NULL,
	[fecha_creacion] [datetime] NULL,
	[Clientes_idClientes] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idusuarios] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[correo_electronico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AuditoriaErrores] ADD  DEFAULT (getdate()) FOR [fecha_error]
GO
ALTER TABLE [dbo].[CategoriaProductos] ADD  DEFAULT (getdate()) FOR [fecha_creacion]
GO
ALTER TABLE [dbo].[Orden] ADD  DEFAULT (getdate()) FOR [fecha_creacion]
GO
ALTER TABLE [dbo].[Productos] ADD  DEFAULT (getdate()) FOR [fecha_creacion]
GO
ALTER TABLE [dbo].[Usuarios] ADD  DEFAULT (getdate()) FOR [fecha_creacion]
GO
ALTER TABLE [dbo].[CategoriaProductos]  WITH CHECK ADD FOREIGN KEY([estados_idestados])
REFERENCES [dbo].[Estados] ([idestados])
GO
ALTER TABLE [dbo].[CategoriaProductos]  WITH CHECK ADD FOREIGN KEY([usuarios_idusuarios])
REFERENCES [dbo].[Usuarios] ([idusuarios])
GO
ALTER TABLE [dbo].[Orden]  WITH CHECK ADD FOREIGN KEY([estados_idestados])
REFERENCES [dbo].[Estados] ([idestados])
GO
ALTER TABLE [dbo].[Orden]  WITH CHECK ADD FOREIGN KEY([usuarios_idusuarios])
REFERENCES [dbo].[Usuarios] ([idusuarios])
GO
ALTER TABLE [dbo].[OrdenDetalles]  WITH CHECK ADD FOREIGN KEY([Orden_idOrden])
REFERENCES [dbo].[Orden] ([idOrden])
GO
ALTER TABLE [dbo].[OrdenDetalles]  WITH CHECK ADD FOREIGN KEY([Productos_idProductos])
REFERENCES [dbo].[Productos] ([idProductos])
GO
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD FOREIGN KEY([CategoriaProductos_idCategoriaProductos])
REFERENCES [dbo].[CategoriaProductos] ([idCategoriaProductos])
GO
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD FOREIGN KEY([estados_idestados])
REFERENCES [dbo].[Estados] ([idestados])
GO
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD FOREIGN KEY([usuarios_idusuarios])
REFERENCES [dbo].[Usuarios] ([idusuarios])
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD FOREIGN KEY([Clientes_idClientes])
REFERENCES [dbo].[Clientes] ([idClientes])
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD FOREIGN KEY([estados_idestados])
REFERENCES [dbo].[Estados] ([idestados])
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD FOREIGN KEY([rol_idrol])
REFERENCES [dbo].[Rol] ([idrol])
GO
/****** Object:  StoredProcedure [dbo].[ObtenerProductos]    Script Date: 22/12/2024 23:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerProductos]
AS
BEGIN
    SELECT * FROM productos;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_ActualizarCategoria]    Script Date: 22/12/2024 23:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ActualizarCategoria]
    @idCategoriaProductos INT,
    @usuarios_idusuarios INT,
    @estados_idestados INT,
    @nombre NVARCHAR(255)
AS
BEGIN
    -- Verificar si la categoría existe
    IF EXISTS (SELECT 1 FROM CategoriaProductos WHERE idCategoriaProductos = @idCategoriaProductos)
    BEGIN
        -- Actualizar la categoría
        UPDATE CategoriaProductos
        SET
            usuarios_idusuarios = @usuarios_idusuarios,
            estados_idestados = @estados_idestados,
            nombre = @nombre,
            fecha_creacion = GETDATE()  -- Actualizamos la fecha de creación si es necesario
        WHERE idCategoriaProductos = @idCategoriaProductos;

        -- Devolver mensaje de éxito
        PRINT 'Categoría actualizada correctamente.';
    END
    ELSE
    BEGIN
        -- Devolver mensaje de error si no se encuentra la categoría
        PRINT 'La categoría con el ID especificado no existe.';
    END
END;

GO
/****** Object:  StoredProcedure [dbo].[sp_ActualizarCliente]    Script Date: 22/12/2024 23:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ActualizarCliente]
    @idClientes INT,
    @razon_social VARCHAR(255),
    @nombre_comercial VARCHAR(255),
    @direccion_entrega VARCHAR(255),
    @telefono VARCHAR(45),
    @email VARCHAR(45)
AS
BEGIN
    -- Actualizar el cliente con el id proporcionado
    UPDATE Clientes
    SET 
        razon_social = @razon_social,
        nombre_comercial = @nombre_comercial,
        direccion_entrega = @direccion_entrega,
        telefono = @telefono,
        email = @email
    WHERE idClientes = @idClientes;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_ActualizarPrecioProducto]    Script Date: 22/12/2024 23:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ActualizarPrecioProducto]
    @idProductos INT, -- Asegúrate de que el nombre sea correcto y consistente
    @nuevoPrecio FLOAT
AS
BEGIN
    -- Verificar si el producto existe
    IF EXISTS (SELECT 1 FROM Productos WHERE idProductos = @idProductos)
    BEGIN
        -- Actualizar el precio del producto
        UPDATE Productos
        SET precio = @nuevoPrecio
        WHERE idProductos = @idProductos; -- Asegúrate de usar el mismo nombre de variable aquí

        PRINT 'Precio actualizado correctamente.';
    END
    ELSE
    BEGIN
        PRINT 'El producto con el ID especificado no existe.';
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_ActualizarUsuario]    Script Date: 22/12/2024 23:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ActualizarUsuario]
    @idusuarios INT,
    @rol_idrol INT,
    @estados_idestados INT,
    @correo_electronico VARCHAR(45),
    @nombre_completo VARCHAR(45),
    @password VARCHAR(45),  -- Recibimos la contraseña encriptada
    @telefono VARCHAR(45),
    @fecha_nacimiento DATE,
    @Clientes_idClientes INT
AS
BEGIN
    UPDATE Usuarios
    SET rol_idrol = @rol_idrol,
        estados_idestados = @estados_idestados,
        correo_electronico = @correo_electronico,
        nombre_completo = @nombre_completo,
        password = @password,  -- Actualizamos con la nueva contraseña (encriptada)
        telefono = @telefono,
        fecha_nacimiento = @fecha_nacimiento,
        Clientes_idClientes = @Clientes_idClientes
    WHERE idusuarios = @idusuarios;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_CrearCategoria]    Script Date: 22/12/2024 23:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_CrearCategoria]
    @usuarios_idusuarios INT,
    @estados_idestados INT,
    @nombre NVARCHAR(255)
AS
BEGIN
    -- Insertar nueva categoría en la tabla
    INSERT INTO CategoriaProductos (usuarios_idusuarios, estados_idestados, nombre, fecha_creacion)
    VALUES (@usuarios_idusuarios, @estados_idestados, @nombre, GETDATE()); -- Fecha actual

    -- Devolver un mensaje de éxito
    PRINT 'Categoría creada correctamente.';
END;

GO
/****** Object:  StoredProcedure [dbo].[sp_InactivarProducto]    Script Date: 22/12/2024 23:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InactivarProducto]
    @idProductos INT,
    @estados_idestados INT
AS
BEGIN
    UPDATE Productos
    SET estados_idestados = @estados_idestados
    WHERE idProductos = @idProductos;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertarCliente]    Script Date: 22/12/2024 23:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertarCliente]
    @razon_social VARCHAR(255),
    @nombre_comercial VARCHAR(255),
    @direccion_entrega VARCHAR(255),
    @telefono VARCHAR(45),
    @email VARCHAR(45)
AS
BEGIN
    -- Insertar el nuevo cliente
    INSERT INTO Clientes (razon_social, nombre_comercial, direccion_entrega, telefono, email)
    VALUES (@razon_social, @nombre_comercial, @direccion_entrega, @telefono, @email);
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertarOrden]    Script Date: 22/12/2024 23:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertarOrden]
    @usuarios_idusuarios INT,
    @estados_idestados INT,
    @nombre_completo VARCHAR(545),
    @direccion VARCHAR(545),
    @telefono VARCHAR(45),
    @correo_electronico VARCHAR(45),
    @fecha_entrega DATE,
    @total_orden FLOAT
AS
BEGIN
    -- Insertar datos en la tabla Orden
    INSERT INTO Orden (
        usuarios_idusuarios, 
        estados_idestados, 
        fecha_creacion, 
        nombre_completo, 
        direccion, 
        telefono, 
        correo_electronico, 
        fecha_entrega, 
        total_orden
    )
    VALUES (
        @usuarios_idusuarios, 
        @estados_idestados, 
        GETDATE(),  -- Fecha y hora de la creación
        @nombre_completo, 
        @direccion, 
        @telefono, 
        @correo_electronico, 
        @fecha_entrega, 
        @total_orden
    );
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertarOrdenDetalle]    Script Date: 22/12/2024 23:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertarOrdenDetalle]
    @Orden_idOrden INT,
    @Productos_idProductos INT,
    @cantidad INT,
    @precio FLOAT,
    @subtotal FLOAT
AS
BEGIN
    INSERT INTO OrdenDetalles (
        Orden_idOrden, Productos_idProductos, cantidad, precio, subtotal
    )
    VALUES (
        @Orden_idOrden, @Productos_idProductos, @cantidad, @precio, @subtotal
    );
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertarProducto]    Script Date: 22/12/2024 23:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertarProducto]
    @CategoriaProductos_idCategoriaProductos INT,
    @usuarios_idusuarios INT,
    @nombre VARCHAR(45),
    @marca VARCHAR(45),
    @codigo VARCHAR(45),
    @stock FLOAT,
    @estados_idestados INT,
    @precio FLOAT,
    @foto VARBINARY(MAX)
AS
BEGIN
    INSERT INTO Productos (
        CategoriaProductos_idCategoriaProductos, usuarios_idusuarios, nombre, 
        marca, codigo, stock, estados_idestados, precio, fecha_creacion, foto
    )
    VALUES (
        @CategoriaProductos_idCategoriaProductos, @usuarios_idusuarios, @nombre, 
        @marca, @codigo, @stock, @estados_idestados, @precio, 
        GETDATE(), @foto
    );
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertarUsuario]    Script Date: 22/12/2024 23:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertarUsuario]
    @rol_idrol INT,
    @estados_idestados INT,
    @correo_electronico VARCHAR(45),
    @nombre_completo VARCHAR(45),
    @password VARCHAR(45),
    @telefono VARCHAR(45),
    @fecha_nacimiento DATE,
    @Clientes_idClientes INT
AS
BEGIN
    INSERT INTO Usuarios (
        rol_idrol, estados_idestados, correo_electronico, 
        nombre_completo, password, telefono, fecha_nacimiento, fecha_creacion, 
        Clientes_idClientes
    )
    VALUES (
        @rol_idrol, @estados_idestados, @correo_electronico, 
        @nombre_completo, @password, @telefono, @fecha_nacimiento, 
        GETDATE(), @Clientes_idClientes
    );
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_ObtenerCategorias]    Script Date: 22/12/2024 23:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ObtenerCategorias]
AS
BEGIN
    -- Seleccionamos todos los registros de la tabla CategoriaProductos
    SELECT * FROM CategoriaProductos;
END;
GO
USE [master]
GO
ALTER DATABASE [GDA0037-OT-JONATHANURBINA] SET  READ_WRITE 
GO
