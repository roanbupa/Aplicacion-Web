use master;
go

if exists (select * from Sysdatabases where name='Periodico')
begin
	drop database Periodico
end

CREATE DATABASE Periodico
GO
USE Periodico
GO
CREATE TABLE Categoria (
	CodigoCat varchar (3) check(len(codigoCat)=3) primary key,
	PrecioBase money not null check (PrecioBase>=0),
	Nombre varchar (50) not null
)

CREATE TABLE Aviso (
	IdAviso int primary key identity (1,1),
	FechaPublicacion datetime not null check(FechaPublicacion >= getdate()),
	CodigoCat varchar (3) not null
		Foreign key (CodigoCat) references Categoria (CodigoCat)
)

CREATE TABLE Telefonos (
	IdAviso int,
	Telefono varchar(50)
	primary key (idAviso,Telefono)   
    foreign key (idaviso) references Aviso(Idaviso)
)

CREATE TABLE Comun (
	IdAviso int primary key
		Foreign key (IdAviso) references Aviso (IdAviso)
)

CREATE TABLE PalabrasClaves (
	IdAviso int, 
	PalabraClave varchar (50)
		Primary key (IdAviso, PalabraClave),
		Foreign key (IdAviso) references Comun (IdAviso)
)

CREATE TABLE Articulo (
	CodigoArt varchar(6)check(len(codigoArt)=6)primary key,
	Precio money check (Precio>=0) not null,
	Descripcion varchar (max) NOT NULL
)

CREATE TABLE Destacado (
	IdAviso int primary key
		Foreign key (IdAviso) references Aviso (IdAviso)
)

CREATE TABLE Posee (
	IdAviso int unique,
	CodigoArt varchar (6) primary key
		Foreign key (IdAviso) references Destacado (IdAviso),
		Foreign key (CodigoArt) references Articulo (CodigoArt) 
)
--------------------------------------------------------------------------------------------------------------------

USE Periodico
GO
INSERT INTO CATEGORIA (codigocat, PrecioBase, Nombre)
VALUES
	(111, 1500, 'Vehiculos'),
	(222, 350, 'juguetes'),
	(333, 1000, 'Informatica'),
	(444, 500, 'Jardineria'),
	(555, 350, 'Herramientas'),
	(666, 700, 'Alimentos'),
	(777, 450, 'Ropa'),
	(888, 150, 'Mascotas'),
	(999, 600, 'Muebles'),
	(112, 2000, 'Vivienda')

INSERT INTO Articulo (CodigoArt ,Precio, Descripcion)
VALUES
	('artic1',150,'celular economico'),
	('artic2',350,'juego de mesa'),
	('artic3', 200,'Barra de chocolate'),
	('artic4', 100,'Llave'),
	('artic5',300,'Celular alta gama'),
	('artic6',500,' lavarropa'),
	('artic7',700,'Moto de 4000cc ')
	
INSERT INTO Aviso (FechaPublicacion, CodigoCat)
VALUES 
	('1/10/2021', 111),
	('1/05/2022', 333),
	('05/10/2022', 444),
	('06/06/2021', 999),
	('04/04/2022', 222),
	('08/08/2021', 111),
	('09/09/2021', 444),
	('07/07/2021', 555),
	('1/11/2022', 888),
	('1/12/2023', 999),
	('1/05/2022', 666),
	('1/07/2021', 777)

INSERT INTO Comun (IdAviso)
VALUES 
	(1),
	(3),
	(5),
	(7),
	(9),
	(11)
INSERT INTO Destacado (Idaviso)
VALUES
	(2),
	(4),
	(6),
	(8),
	(10),
	(12)
INSERT INTO Posee(IdAVISO,Codigoart)
VALUES
	(2,'artic1'),
	(6,'artic2'),
	(8,'artic3'),
	(12,'artic4'),
	(4,'artic5'),
	(10,'artic7')
	
INSERT INTO Telefonos(IdAviso,Telefono)
VALUES 
	(1, '095579836'),
	(1, '095659875'),
	(2, '093579877'),
	(2, '093549527'),
	(2, '092879787'),
	(3, '093145556'),
	(3, '092135689'),
	(3, '098564237'),
	(4, '092579123'),
	(5, '098656321'),
	(5, '094569832'),
	(6, '098656424'),
	(7, '098656234'),
	(7, '093256565'),
	(8, '091579567'),
	(8, '098626665'),
	(9, '099579654'),
	(9, '099575663'),
	(9, '098564233'),
	(10,'099579775'),
	(11, '098579234'),
	(12, '096226462')

INSERT INTO PalabrasClaves 
VALUES 
	(1,'USADO'),
	(3,'POCOS KM'),
	(5,'NUEVO'),
	(7,'ELECTRICO')
------------------------------------------------------------------------------------------------------------------

USE Periodico
GO
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'sp_AgregarArt')
DROP PROCEDURE sp_AgregarArt
GO

CREATE PROC sp_AgregarArt
		@CodigoArt varchar(6), @Precio money, @Descripcion varchar(max)
AS
	begin try
		if exists (SELECT * FROM Articulo WHERE CodigoArt = @CodigoArt)
		begin
			print 'El codigo de articulo ya existe'
			return -1
		end
		if (@Precio<=0)
		begin
			print 'El precio debe ser mayor a 0'
			return -2
		end
		insert into Articulo(CodigoArt,Precio,Descripcion)
			values (@CodigoArt,@Precio,@Descripcion)
		return 1

	end try
	begin catch
	return @@error
	end catch
GO
-------------------------------------------------------------------------------------------------------------

USE Periodico
GO
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'sp_AgregarAvisoComun')
DROP PROCEDURE sp_AgregarAvisoComun
GO

create proc sp_AgregarAvisoComun @Fecha datetime, @CodigoCat varchar(3)
as
IF NOT EXISTS (SELECT * FROM Categoria WHERE CodigoCat = @CodigoCat)
	BEGIN
		PRINT 'El codigo de la categoria no existe'
		RETURN -1
	END
begin try
	begin tran
		declare @IdNuevo int
		insert into Aviso (FechaPublicacion, CodigoCat)
		values (@Fecha, @CodigoCat)
		set @IdNuevo = @@IDENTITY
		insert into Comun (IdAviso)
		values (@IdNuevo)
	commit tran
	print 'El aviso ha sido agregado correctamente'
	return @IdNuevo
end try

begin catch
	rollback tran
	return @@error
end catch
GO
-----------------------------------------------------------------------------------------------------------

USE Periodico
GO
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'sp_AgregarAvisoDestacado')
DROP PROCEDURE sp_AgregarAvisoDestacado
GO

create proc sp_AgregarAvisoDestacado @Fecha datetime, @CodigoCat varchar(3), @CodigoArt varchar(6)
as
IF NOT EXISTS (SELECT * FROM Categoria WHERE CodigoCat = @CodigoCat)
	BEGIN
		PRINT 'El codigo de la categoria no existe'
		RETURN -1
	END
IF NOT EXISTS (SELECT * FROM Articulo WHERE CodigoArt = @CodigoArt)
	BEGIN
		PRINT 'El codigo del articulo no existe'
		RETURN -2
	END

begin try
	begin tran
		declare @IdNuevo int
		insert into Aviso (FechaPublicacion, CodigoCat)
		values (@Fecha, @CodigoCat)
		set @IdNuevo = @@IDENTITY
		insert into Destacado (IdAviso)
		values (@IdNuevo)
		insert into Posee (IdAviso, CodigoArt)
		values (@IdNuevo, @CodigoArt)
	commit tran
	return @IdNuevo
end try

begin catch
	rollback tran
	return @@error
end catch
GO
-------------------------------------------------------------------------------------------------------------

USE Periodico
GO
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'sp_AgregarCategoria')
DROP PROCEDURE sp_AgregarCategoria
GO

CREATE PROC sp_AgregarCategoria
		@CodigoCat varchar(3), @PrecioBase money, @Nombre varchar(50)
AS
	begin try
		if(len(@CodigoCat)!=3)
		begin
			print 'El codigo debe de tener 3 caracteres'
			return -1
		end
		if exists (SELECT * FROM Categoria WHERE CodigoCat = @codigoCat)
		begin
			print 'El codigo de la categoria ya existe'
			return -2
		end
		if (@PrecioBase<=0)
		begin
			print 'El precio debe ser mayor a 0'
			return -3
		end
		insert into Categoria (CodigoCat,PrecioBase,Nombre)
			values (@CodigoCat,@PrecioBase,@Nombre)

		return 1

	end try
	begin catch
	return @@error
	end catch
GO
-----------------------------------------------------------------------------------------------------------

USE Periodico
GO
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'sp_AgregarPalabrasClaves')
DROP PROCEDURE sp_AgregarPalabrasClaves
GO

create proc sp_AgregarPalabrasClaves @IdAviso int, @PalabrasClave varchar(50)
as
begin try
	insert into PalabrasClaves(IdAviso, PalabraClave)
	values (@IdAviso, @PalabrasClave)

	return 1
end try

begin catch
	return -2
end catch
go
-----------------------------------------------------------------------------------------------------------------------

USE Periodico
GO
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'sp_AgregarTelefono')
DROP PROCEDURE sp_AgregarTelefono
GO

create proc sp_AgregarTelefono @IdAviso int, @Telefono varchar(50)
as
begin try
	insert into Telefonos (IdAviso, Telefono)
	values (@IdAviso, @Telefono)

	return 1
end try

begin catch
	return -2
end catch
go
--------------------------------------------------------------------------------------------------------------------

USE Periodico
GO
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'sp_BuscarArt')
DROP PROCEDURE sp_BuscarArt
GO
	
CREATE PROC sp_BuscarArt @CodigoArt varchar(6)
AS
if(len(@CodigoArt)!=6)
begin
	print 'El codigo debe de tener 6 caracteres'
	return -1
end
BEGIN TRY
IF NOT EXISTS (SELECT * FROM Articulo WHERE CodigoArt = @CodigoArt)
	BEGIN 
		PRINT 'No existe el articulo'
		RETURN -2
	END 
SELECT * FROM Articulo WHERE CodigoArt = @CodigoArt
RETURN 1
END TRY
BEGIN CATCH
	RETURN @@ERROR
END CATCH
GO
---------------------------------------------------------------------------------------------------

USE Periodico
GO
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'sp_BuscarArtPorIdAviso')
DROP PROCEDURE sp_BuscarArtPorIdAviso
GO
	
CREATE PROC sp_BuscarArtPorIdAviso @IdAviso int
AS

SELECT * FROM Articulo 
inner join Posee on Posee.CodigoArt = Articulo.CodigoArt
where @IdAviso = IdAviso
go
------------------------------------------------------------------------------------------------------------

USE Periodico
GO
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'sp_BuscarAvisoDestacadoPorArticulo')
DROP PROCEDURE sp_BuscarAvisoDestacadoPorArticulo
GO
CREATE PROC sp_BuscarAvisoDestacadoPorArticulo @CodigoArt varchar(6)
AS
Select * FROM Destacado
INNER JOIN Aviso on Aviso.IdAviso = Destacado.IdAviso
INNER JOIN Posee ON Destacado.IdAviso = Posee.IdAviso
WHERE Posee.CodigoArt = @CodigoArt
GO
---------------------------------------------------------------------------------------------------------------

USE Periodico
GO
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'sp_BuscarCategoria')
DROP PROCEDURE sp_BuscarCategoria
GO

CREATE PROC sp_BuscarCategoria
	@CodigoCat varchar(3)
AS
if(len(@CodigoCat)!=3)
begin
	print 'El codigo debe de tener 3 caracteres'
	return -1
end
IF NOT EXISTS (SELECT * FROM Categoria WHERE CodigoCat = @CodigoCat)
	BEGIN
		PRINT 'El codigo de la categoria no existe'
		RETURN -2
	END
Select * From Categoria Where @CodigoCat = CodigoCat
return 1
GO
-----------------------------------------------------------------------------------------------------------

USE Periodico
GO
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'sp_EditarCat')
DROP PROCEDURE sp_EditarCat
GO

CREATE PROC sp_EditarCat @CodigoCat varchar(3), @PrecioBase money, @Nombre varchar(50)
AS
	IF NOT EXISTS (SELECT * FROM Categoria WHERE CodigoCat = @CodigoCat)
			BEGIN 
				PRINT 'No existe la categoria'
				RETURN -1
			END
	IF (@PrecioBase <=0)
		BEGIN 
			PRINT 'El precio debe ser mayor a 0'
			RETURN -2
		END
	BEGIN TRY
		update Categoria set PrecioBase = @PrecioBase , Nombre = @Nombre
		where CodigoCat = @CodigoCat
	END TRY
	BEGIN CATCH
		RETURN @@ERROR
	END CATCH
GO
-----------------------------------------------------------------------------------------------------------

USE Periodico
GO
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'sp_EliminarCat')
DROP PROCEDURE sp_EliminarCat
GO

CREATE PROC sp_EliminarCat @CodigoCat varchar(3)
AS
	IF exists ( select * from Aviso where CodigoCat = @CodigoCat)
	begin
		print 'No se puede eliminar... Tiene avisos asociados'
		return -1
	end
	BEGIN TRY
		DELETE Categoria WHERE CodigoCat = @CodigoCat
		PRINT 'Categoria eliminada'
		return 1
	END TRY
	BEGIN CATCH
		 return @@error
	END CATCH
GO
---------------------------------------------------------------------------------------------------------------

USE Periodico
GO
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'sp_ListarArt')
DROP PROCEDURE sp_ListarArt
GO

CREATE PROC sp_ListarArt
AS
SELECT * FROM Articulo
WHERE NOT CodigoArt IN (SELECT CodigoArt FROM Posee)
GO
----------------------------------------------------------------------------------------------------------------

USE Periodico
GO
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'sp_ListarArticulosUsados')
DROP PROCEDURE sp_ListarArticuloUsados
GO

CREATE PROC sp_ListarArticulosUsados
AS
SELECT * FROM Articulo
WHERE CodigoArt IN (SELECT CodigoArt FROM Posee)
GO
------------------------------------------------------------------------------------------------------------

USE Periodico
GO
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'sp_ListarAvisoComun')
DROP PROCEDURE sp_ListarAvisoComun
GO

CREATE PROC sp_ListarAvisoComun
AS
SELECT * FROM Aviso
inner join Comun on Aviso.IdAviso = Comun.IdAviso
GO
----------------------------------------------------------------------------------------------------
USE Periodico
GO
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'sp_ListarAvisoComunXCat')
DROP PROCEDURE sp_ListarAvisoComunXCat
GO

CREATE PROC sp_ListarAvisoComunXCat @CodigoCat varchar(3)
AS
IF NOT EXISTS (SELECT * FROM Categoria WHERE CodigoCat = @CodigoCat)
	BEGIN
		PRINT 'El codigo de la categoria no existe'
		RETURN -1
	END
SELECT * FROM Comun
inner join Aviso on Aviso.IdAviso = Comun.IdAviso
WHERE @CodigoCat = CodigoCat
GO
----------------------------------------------------------------------------------------------------

USE Periodico
GO
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'sp_ListarAvisoDestacado')
DROP PROCEDURE sp_ListarAvisoDestacado
GO

CREATE PROC sp_ListarAvisoDestacado
AS
SELECT * FROM Aviso
inner join Destacado on Aviso.IdAviso = Destacado.IdAviso
GO 
---------------------------------------------------------------------------------------------------------

USE Periodico
GO
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'sp_ListarAvisoDestacadoXCat')
DROP PROCEDURE sp_ListarAvisoDestacadoXCat
GO

CREATE PROC sp_ListarAvisoDestacadoXCat @CodigoCat varchar(3)
AS
IF NOT EXISTS (SELECT * FROM Categoria WHERE CodigoCat = @CodigoCat)
	BEGIN
		PRINT 'El codigo de la categoria no existe'
		RETURN -1
	END
SELECT * FROM Destacado
inner join Aviso on Aviso.IdAviso = Destacado.IdAviso
WHERE @CodigoCat = CodigoCat
GO
-------------------------------------------------------------------------------------------------------------

USE Periodico
GO
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'sp_ListarCategoria')
DROP PROCEDURE sp_ListarCategoria
GO

CREATE PROC sp_ListarCategoria
AS
SELECT * FROM Categoria
GO
----------------------------------------------------------------------------------------------------------

USE Periodico
GO
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'sp_ListarPalabrasClaves')
DROP PROCEDURE sp_ListarPalabrasCLaves
GO

CREATE PROC sp_ListarPalabrasClaves @IdAviso int
AS
SELECT * FROM PalabrasClaves
WHERE IdAviso = @IdAviso
GO
-------------------------------------------------------------------------------------------------------------

USE Periodico
GO
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'sp_ListarTelefono')
DROP PROCEDURE sp_ListarTelefono
GO

CREATE PROC sp_ListarTelefono @IdAviso int
AS
SELECT * FROM Telefonos
WHERE IdAviso = @IdAviso
GO

