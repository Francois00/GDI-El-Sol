

-- Tabla Empleado
CREATE DATABASE ElSol;
USE ElSol;

-- Tabla Empleado
CREATE TABLE Empleado (
 codigo_empleado CHAR(10) NOT NULL,
 nombre_empleado VARCHAR(45) NOT NULL,
 turno CHAR(5) NOT NULL,
 estado CHAR(8) NOT NULL,
 created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
 PRIMARY KEY (codigo_empleado)
);

-- Tabla Catalogo
CREATE TABLE Catalogo (
 codigo_catalogo CHAR(3) NOT NULL,
 version INT NOT NULL,
 tipo_de_productos VARCHAR(25) NOT NULL,
 fecha_ultima_modificacion DATE NOT NULL,
 stock INT NOT NULL,
 codigo_empleado CHAR(10) NOT NULL,
 created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
 PRIMARY KEY (codigo_catalogo),
 INDEX codigo_empleado_idx (codigo_empleado),
 FOREIGN KEY (codigo_empleado) REFERENCES Empleado(codigo_empleado)
);

-- Tabla Producto
CREATE TABLE Producto (
 codigo_producto CHAR(5) NOT NULL,
 nombre VARCHAR(25) NOT NULL,
 marca VARCHAR(25) NOT NULL,
 descripcion VARCHAR(45),
 precio DECIMAL(10,2) NOT NULL,
 tipo_de_producto VARCHAR(45) NOT NULL,
 codigo_catalogo CHAR(3) NOT NULL,
 created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
 PRIMARY KEY (codigo_producto),
 INDEX codigo_catalogo_idx (codigo_catalogo),
 FOREIGN KEY (codigo_catalogo) REFERENCES Catalogo(codigo_catalogo)
);

-- Tabla Proveedor
CREATE TABLE Proveedor (
 codigo_proveedor CHAR(10) NOT NULL,
 nombre_proveedor VARCHAR(45) NOT NULL,
 created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
 PRIMARY KEY (codigo_proveedor)
);

-- Tabla Pedido
CREATE TABLE Pedido (
 numero_pedido CHAR(5) NOT NULL,
 codigo_empleado CHAR(10) NOT NULL,
 codigo_proveedor CHAR(10) NOT NULL,
 created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
 PRIMARY KEY (numero_pedido),
 INDEX codigo_empleado_idx (codigo_empleado),
 INDEX codigo_proveedor_idx (codigo_proveedor),
 FOREIGN KEY (codigo_empleado) REFERENCES Empleado(codigo_empleado),
 FOREIGN KEY (codigo_proveedor) REFERENCES Proveedor(codigo_proveedor)
);

-- Tabla Distribuir_Productos
CREATE TABLE Distribuir_Productos (
 codigo_producto CHAR(5) NOT NULL,
 codigo_proveedor CHAR(10) NOT NULL,
 fecha_de_ingreso DATE NOT NULL,
 created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
 PRIMARY KEY (codigo_producto, codigo_proveedor),
 INDEX codigo_proveedor_idx (codigo_proveedor),
 FOREIGN KEY (codigo_producto) REFERENCES Producto(codigo_producto),
 FOREIGN KEY (codigo_proveedor) REFERENCES Proveedor(codigo_proveedor)
);

-- Tabla Incluir_Producto
CREATE TABLE Incluir_Producto (
 codigo_producto CHAR(5) NOT NULL,
 numero_pedido CHAR(5) NOT NULL,
 cantidad INT NOT NULL,
 created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
 PRIMARY KEY (codigo_producto, numero_pedido),
 INDEX numero_pedido_idx (numero_pedido),
 FOREIGN KEY (codigo_producto) REFERENCES Producto(codigo_producto),
 FOREIGN KEY (numero_pedido) REFERENCES Pedido(numero_pedido)
);

-- Tabla Proveedor_Telefonos
CREATE TABLE Proveedor_Telefonos (
 codigo_proveedor CHAR(10) NOT NULL,
 telefono VARCHAR(9) NOT NULL,
 created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
 PRIMARY KEY (codigo_proveedor, telefono),
 FOREIGN KEY (codigo_proveedor) REFERENCES Proveedor(codigo_proveedor)
);

-- Tabla Proveedor_Correos
CREATE TABLE Proveedor_Correos (
 codigo_proveedor CHAR(10) NOT NULL,
 correo VARCHAR(60) NOT NULL,
 created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
 PRIMARY KEY (codigo_proveedor, correo),
 FOREIGN KEY (codigo_proveedor) REFERENCES Proveedor(codigo_proveedor)
);

-- Tabla Empleado_Telefonos
CREATE TABLE Empleado_Telefonos (
 codigo_empleado CHAR(10) NOT NULL,
 telefono VARCHAR(9) NOT NULL,
 created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
 PRIMARY KEY (codigo_empleado, telefono),
 FOREIGN KEY (codigo_empleado) REFERENCES Empleado(codigo_empleado)
);



-------------------------------------------------------------------------------------------------

-- -------------------------------------------------
/************** Inserci�n Empleado ****************/
-- -------------------------------------------------
IINSERT INTO Empleado (codigo_empleado, nombre_empleado, turno, estado) 
VALUES 
('2014010012', 'Aurelio Valderrama Dueñas', 'Dia', 'Inactivo'),
('2014010078', 'Jose Manuel Múñoz', 'Dia', 'Inactivo'),
('2015020056', 'Guadalupe Oliva Blazquez', 'Tarde', 'Activo'),
('2015010018', 'Catalina Guzmán', 'Dia', 'Inactivo'),
('2015025040', 'Aurelio Peralta Borja', 'Tarde', 'Activo'),
('2015026039', 'María Cristina Polo', 'Tarde', 'Activo'),
('2016017039', 'Luís Pereira Talavera', 'Dia', 'Inactivo'),
('2016018038', 'Noelia Torres Muñoz', 'Dia', 'Activo'),
('2017119038', 'Pilar Leiva Martinez', 'Dia', 'Activo'),
('2017020038', 'Leonel Cortes Carrión', 'Tarde', 'Activo'),
('2017021037', 'Sonia Loida Girón Amaya', 'Tarde', 'Inactivo'),
('2018022037', 'Juan José Pinedo', 'Tarde', 'Inactivo'),
('2020023036', 'Andrés Felipe Gonzalez Cuesta', 'Tarde', 'Activo');

INSERT INTO Empleado_Telefonos (codigo_empleado, telefono) 
VALUES 
('2014010012', '979008272'),
('2014010078', '993765927'),
('2015020056', '997588710'),
('2015010018', '979461944'),
('2015025040', '971677336'),
('2015026039', '969445859'),
('2016017039', '980988338'),
('2016018038', '988439954'),
('2017119038', '986262582'),
('2017020038', '967148428'),
('2017021037', '975114806'),
('2018022037', '999143043'),
('2020023036', '981164905');

INSERT INTO Proveedor (codigo_proveedor, nombre_proveedor) 
VALUES 
('5420101010', 'Francisco Carlos Molina'),
('5420111015', 'Sonia Aguilar Caceres'),
('5420142020', 'Camila Zúñiga'),
('5420132025', 'Julio Oviedo Muñoz'),
('5420193035', 'Jorge Enrique Gutierrez'),
('5420103040', 'Graciela Gladys Grau'),
('5420113045', 'Isaac Saul Barrios'),
('5120181025', 'Sergio Tomas Garate'),
('5120181035', 'Rosa Beatriz Ballesteros'),
('5220001015', 'Grupo Solar'),
('5220001020', 'Benigna Marta Cespedes'),
('5220102025', 'Esther Rocio Villalba'),
('5220102035', 'Raquel Luisa Olmedo'),
('5320161055', 'Rosa Maria Chavez'),
('5320161045', 'Asunción Gomez'),
('1120011015', 'Grupo Zambrano'),
('1120011025', 'Grupo Diaz'),
('1120021035', 'Grupo San Agustin'),
('1120031045', 'Teresa Izaguirre de Ocampo'),
('1120061050', 'Maria Villanueva Benavides'),
('1120092060', 'Adelia Mercy Guzman Borja'),
('1120122065', 'Consuelo Candia Cervantes'),
('1120152070', 'Carmen Rosas Paredes'),
('1120192075', 'Maria Fernando Perez Morales'),
('1120192080', 'Anastasia Graciela Ugarte'),
('1120192090', 'Reynaldo Paul Valdes');

INSERT INTO Proveedor_Telefonos (codigo_proveedor, telefono) 
VALUES 
('5420101010', '954497769'),
('5420111015', '960744067'),
('5420142020', '979902373'),
('5420132025', '979673744'),
('5420193035', '985378919'),
('5420103040', '975194475'),
('5420113045', '950364965'),
('5120181025', '937556880'),
('5120181035', '951719788'),
('5220001015', '998388445'),
('5220001020', '936817036'),
('5220102025', '986776259'),
('5220102035', '975853581'),
('5320161055', '937482000'),
('5320161045', '996019020'),
('1120011015', '981265011'),
('1120011025', '955409093'),
('1120021035', '975910151'),
('1120031045', '960339837'),
('1120061050', '962101058'),
('1120092060', '970128509'),
('1120122065', '960518375'),
('1120152070', '970814970'),
('1120192075', '981718864'),
('1120192080', '970275827'),
('1120192090', '975297687');

INSERT INTO Proveedor_Correos (codigo_proveedor, correo) 
VALUES 
('5420101010', 'Francisco_13@gmail.com'),
('5420111015', 'Sonia_22@gmail.com'),
('5420142020', 'camila.31@gmail.com'),
('5420132025', 'Julio_2000@gmail.com'),
('5420193035', 'Jorge_Gut@gmail.com'),
('5420103040', 'Graciela_Grau@yahoo.com'),
('5420113045', 'Isaac_Barrios@yahoo.com'),
('5120181025', 'Sergio_1999@yahoo.com'),
('5120181035', 'Rosa_Ballesteros@yahoo.com'),
('5220001015', 'GSolar_city@tutanota.com'),
('5220001020', 'Benigna_Cespedes@tutanota.com'),
('5220102025', 'Esther_villalba@yahoo.com'),
('5220102035', 'Raquel_Olmedo23@yahoo.com'),
('5320161055', 'Rosa_Ballestero45@gmail.com'),
('5320161045', 'Asunción_31@gmail.com'),
('1120011015', 'GZambrano_@gmail.com'),
('1120011025', 'GDiaz_Lima@gmail.com'),
('1120021035', 'GSan_Agustin_Lima@yahoo.com'),
('1120031045', 'Teresa_Ocampo45@yahoo.com'),
('1120061050', 'Maria_Benavides33@yahoo.com'),
('1120092060', 'Adelia_20_Guzman@tutanota.com'),
('1120122065', 'ConsueloCandia_1980@gmail.com'),
('1120152070', 'Carmen_30@gmail.com'),
('1120192075', 'Maria_Perez2000@gmail.com'),
('1120192080', 'Anastasia_45@yahoo.com'),
('1120192090', 'Reynaldo_Valdez200@yahoo.com');

INSERT INTO Catalogo (codigo_catalogo, version, tipo_de_productos, fecha_ultima_modificacion, stock, codigo_empleado) 
VALUES 
('100', 1, 'MONTURA SOLAR', '2014-05-15', 158, '2014010012'),
('101', 2, 'MONTURA PARA NIÑOS', '2014-05-16', 150, '2014010078'),
('102', 3, 'MONTURA OFTALMOLÓGICA', '2014-05-30', 230, '2015020056'),
('103', 4, 'ACCESORIO', '2015-05-15', 301, '2015010018'),
('104', 5, 'MONTURA SOLAR', '2015-02-14', 288, '2015025040'),
('105', 6, 'MONTURA PARA NIÑOS', '2015-05-01', 284, '2015026039'),
('106', 7, 'MONTURA OFTALMOLÓGICA', '2016-03-10', 324, '2016017039'),
('107', 8, 'ACCESORIO', '2016-08-24', 285, '2016018038'),
('108', 9, 'MONTURA SOLAR', '2017-01-20', 270, '2017119038'),
('109', 10, 'MONTURA PARA NIÑOS', '2017-08-14', 224, '2017020038'),
('110', 11, 'MONTURA OFTALMOLÓGICA', '2017-11-25', 295, '2017021037'),
('111', 12, 'ACCESORIO', '2018-02-06', 270, '2018022037'),
('112', 13, 'MONTURA SOLAR', '2020-09-27', 216, '2020023036'),
('113', 14, 'MONTURA PARA NIÑOS', '2020-12-08', 192, '2020023036');
