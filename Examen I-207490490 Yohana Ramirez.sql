/*  UNIVERSIDAD TÉCNICA NACIONAL
	ISW-413 APLICACIÓN DE BASES DE DATOS
	PRIMER EXAMEN PARCIAL


	PORCENTAJE: 35%
	TIEMPO ESTIMADO: 3 HORAS
	PUNTOS: 50

	Instrucciones:  Lea y analice cada ejercicio que se le presenta a continuación
	debe colocar la respuesta donde se le indica.  No debe cambiar el nombre de los
	objetos.  Dentro de cada enunciado aparecerá lo siguiente SUCEDULA que deberá 
	ser cambiado por su número de cédula.  

	Importante: Si un ejercicio no compila no será revisado del todo y se
	perderán los puntos*/


-- Ejecute el siguiente enunciado
	
CREATE DATABASE [ExamenParcial2021] 
USE ExamenParcial2021

--Ejecute las instrucciones de creación e inserción

Create Table Cliente
(
ID int not null,
Nombre varchar(20),
Direccion varchar(200),
TotalVenta Float null,
PorcDescuento float null
)

Create table EncFactura
(
ID int not null,
IDCliente int not null,
Impuesto float not null,
Descuento float not null,
Monto float not null
)

Create Table producto 
(
ID int not null,
Nombre varchar(200)
)

Create table DetFactura
(
IDEncFactura int not null,
IDProducto int not null,
Cantidad int not null,
Precio int not null,
Descuento float not null
)

Create table CXC
(
IDEncFactura int not null,
IDCliente int,
Vencimiento smalldatetime,
Monto Float,
Saldo Float
)

-------------------------------------------------------------
-- Modificación de tablas - Llaves Primarias (PK)
-------------------------------------------------------------

ALTER TABLE cliente ADD CONSTRAINT pk_IDcliente PRIMARY KEY (ID)
ALTER TABLE EncFactura ADD CONSTRAINT pk_IDEncFactura PRIMARY KEY (ID)
ALTER TABLE producto ADD CONSTRAINT pk_IDProducto PRIMARY KEY (ID)
ALTER TABLE DetFactura ADD CONSTRAINT pk_IDDetFacturaIDProducto PRIMARY KEY (IDEncFactura, IDProducto)
ALTER TABLE CXC ADD CONSTRAINT pk_CXC PRIMARY KEY (IDEncFactura)

-------------------------------------------------------------
-- Modificación de tablas - Llaves Foráneas (FK)
-------------------------------------------------------------

ALTER TABLE EncFactura ADD CONSTRAINT FK_ClienteEncFactura FOREIGN KEY (IDCliente) REFERENCES Cliente(ID)
ALTER TABLE DetFactura ADD CONSTRAINT FK_EncFaturaDetFactura FOREIGN KEY (IDEncFactura) REFERENCES EncFactura(ID)
ALTER TABLE DetFactura ADD CONSTRAINT FK_ProductoDetFactura FOREIGN KEY (IDProducto) REFERENCES Producto(ID)
ALTER TABLE CXC ADD CONSTRAINT FK_ClienteCXC FOREIGN KEY (IDCliente) REFERENCES Cliente(ID)
 
-------------------------------------------------------------
-- Inserción de datos en las tablas - Insert
-------------------------------------------------------------

insert into Cliente values (1,'Cliente #1','Dirección #1',10,10);
insert into Cliente values (2,'Cliente #2','Dirección #2',11,11);
insert into Cliente values (3,'Cliente #3','Dirección #3',12,12);
insert into Cliente values (4,'Cliente #4','Dirección #4',13,13);
insert into Cliente values (5,'Cliente #5','Dirección #5',14,14);
insert into Cliente values (6,'Cliente #6','Dirección #6',15,15);
insert into Cliente values (7,'Cliente #7','Dirección #7',16,16);
insert into Cliente values (8,'Cliente #8','Dirección #8',17,17);
insert into Cliente values (9,'Cliente #9','Dirección #9',18,18);

insert into Producto values (1,'Producto #1');
insert into Producto values (2,'Producto #2');
insert into Producto values (3,'Producto #3');
insert into Producto values (4,'Producto #4');
insert into Producto values (5,'Producto #5');
insert into Producto values (6,'Producto #6');
insert into Producto values (7,'Producto #7');

insert into EncFactura values (1,1,100,10,190);
insert into EncFactura values (2,2,200,20,1280);
insert into EncFactura values (3,3,300,30,1270);
insert into EncFactura values (4,4,400,40,1360);
insert into EncFactura values (5,5,500,50,1450);
insert into EncFactura values (6,6,600,60,5140);
insert into EncFactura values (7,7,700,70,1630);
insert into EncFactura values (8,8,800,80,1720);
insert into EncFactura values (9,1,900,90,1810);

insert into DetFactura values (1,1,1,100,10);
insert into DetFactura values (1,2,2,200,20);
insert into DetFactura values (1,3,3,300,30);
insert into DetFactura values (1,4,4,400,40);
insert into DetFactura values (1,5,5,500,50);
insert into DetFactura values (1,6,6,600,60);
insert into DetFactura values (1,7,7,700,70);

insert into DetFactura values (2,1,10,1000,100);
insert into DetFactura values (2,2,20,2000,200);
insert into DetFactura values (2,3,30,3000,300);
insert into DetFactura values (2,4,40,4000,400);
insert into DetFactura values (2,5,50,5000,500);
insert into DetFactura values (2,6,60,6000,600);
insert into DetFactura values (2,7,70,7000,700);

insert into DetFactura values (3,1,15,1500,150);
insert into DetFactura values (3,2,25,2500,250);
insert into DetFactura values (3,3,35,3500,350);
insert into DetFactura values (3,4,45,4500,450);
insert into DetFactura values (3,5,55,5500,550);
insert into DetFactura values (3,6,65,6500,650);
insert into DetFactura values (3,7,75,7500,750);

insert into DetFactura values (4,1,16,1600,160);
insert into DetFactura values (4,2,26,2600,260);
insert into DetFactura values (4,3,36,3600,360);
insert into DetFactura values (4,4,46,4600,460);
insert into DetFactura values (4,5,56,5600,560);
insert into DetFactura values (4,6,66,6600,660);
insert into DetFactura values (4,7,76,7600,760);

insert into DetFactura values (5,1,17,1700,170);
insert into DetFactura values (5,2,27,2700,270);
insert into DetFactura values (5,3,37,3700,370);
insert into DetFactura values (5,4,47,4700,470);
insert into DetFactura values (5,5,57,5700,570);
insert into DetFactura values (5,6,67,6700,670);
insert into DetFactura values (5,7,77,7700,770);

insert into CXC values (1,1,Getdate()-5,7700,770);
insert into CXC values (2,2,Getdate()-4,7700,770);
insert into CXC values (3,3,Getdate()-3,7700,770);
insert into CXC values (4,4,Getdate()-2,7700,770);
insert into CXC values (5,5,Getdate()-1,7700,770);
insert into CXC values (6,6,Getdate()+1,7700,770);
insert into CXC values (7,7,Getdate()+2,7700,770);
insert into CXC values (8,8,Getdate()+3,7700,770);
insert into CXC values (9,9,Getdate()+4,7700,770);


/* Primera parte (Valor 14 ptos)
Diseñe un procedimiento almacenado llamado paSUCEDULA que reciba como parámetro de entrada
la identificación de un cliente.  El procedimiento debe calcular la sumatoria de los montos
que dicho cliente tiene en sus facturas y compararlo con el total de ventas.  En caso de
que ambas cantidades sean diferentes, se deberá actualizar el campo totalventa a la sumatoria
de los montos de las facturas de dicho cliente.  Debe manejar el control de errores para que
si ocurre algún error durante la actualización, no se realice la operación.

Escriba la solución del ejercicio a continuación*/

CREATE PROCEDURE pa_207490490
	@id_cliente int
AS
BEGIN TRY
	DECLARE @sumatoria float
	SET @sumatoria = (SELECT SUM(Monto) FROM EncFactura WHERE IDCliente = @id_cliente)
	
	IF (@sumatoria != (SELECT TotalVenta FROM Cliente WHERE ID = @id_cliente))
		BEGIN
		UPDATE Cliente SET TotalVenta = @sumatoria WHERE ID = @id_cliente
		END
END TRY

BEGIN CATCH
	PRINT 'Error en procedimiento'
END CATCH

select * from Cliente
EXEC pa_207490490 1
select * from Cliente


/*Segunda parte (Valor 14 ptos)
Diseñe una función llamada fnSUCEDULA que reciba como parámetro de entrada la identificación
de un cliente.  Esta función debe retornar para ese cliente, la cantidad de facturas en cuentas por cobrar
que el cliente no ha terminado de pagar y si el parámetro recibido es un cero retorne la cantidad
de todas las facturas vencidas de CXC

Escriba la solución del ejercicio a continuación*/

Create function fn207490490
(
	@id_cliente int
)
	returns int
AS

BEGIN
	DECLARE @contador int
	IF (@id_cliente = 0)
		BEGIN
			SET @contador = (SELECT COUNT(IDEncFactura) FROM CXC WHERE Vencimiento < GETDATE())
		END
	ELSE BEGIN
		SET @contador = (SELECT COUNT(IDEncFactura) FROM CXC WHERE IDCliente = @id_cliente)
	END

	RETURN @contador;
END

--Se ejecuta
PRINT dbo.fn207490490(0)
SELECT * FROM CXC

/*Tercera parte (Valor 12 ptos)
Diseñe un trigger llamado trSUCEDULA, el cual no permita insertar en la tabla encfactura
un registro si el impuesto, que es del 13% sobre el monto total está mal calculado o
si el monto que se va a insertar es igual a cero

Escriba la solución del ejercicio a continuación*/

CREATE TRIGGER tr207490490
ON EncFactura
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON
	DECLARE @CALC float
	SET @CALC = (SELECT monto FROM inserted) * 0.13
	IF (((SELECT Monto FROM inserted) = 0) OR @CALC != (SELECT Impuesto FROM inserted))
	begin
		print 'Monto no válido para insertar'
		Rollback
	end
END

--Se ejecuta
Insert into	EncFactura values (11, 1, 13, 10, 100)

/*Cuarta parte (Valor 10 ptos)
Diseñe un cursor llamado cSUCEDULA que recorra la tabla la detfactura y le sume un 10% a todos
los campos de descuento de dicha tabla y actualice.

Escriba la solución del ejercicio a continuación*/

SELECT * FROM DetFactura
DECLARE @id_EncFactura int,
		@id_Producto int,
		@descuento float
DECLARE c207490490 CURSOR
FOR SELECT IDEncFactura,IDProducto,Descuento FROM DetFactura
OPEN c207490490
FETCH c207490490 into @id_EncFactura,@id_Producto,@descuento
WHILE (@@FETCH_STATUS = 0 )
BEGIN
	UPDATE DetFactura SET Descuento = @descuento + 10 WHERE ((IDEncFactura = @id_EncFactura) AND (IDProducto = @id_Producto))
    FETCH c207490490 into @id_EncFactura,@id_Producto,@descuento
END
Close c207490490
Deallocate c207490490

SELECT * FROM DetFactura