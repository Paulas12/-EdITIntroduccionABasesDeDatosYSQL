#3.2.1
SELECT IDCLIENTE, NOMBRECOMPANIA, CONCAT(DIRECCION, ' - ', CIUDAD, ' - ', PAIS) AS UBICACION 
FROM CLIENTES_NEPTUNO;
#2
SELECT IDCLIENTE, NOMBRECOMPANIA, CONCAT_WS(' - ',DIRECCION, CIUDAD, PAIS) AS UBICACION 
FROM CLIENTES_NEPTUNO;
#3
SELECT UPPER(NOMBRECOMPANIA) Empresa FROM CLIENTES_NEPTUNO; 
#4
SELECT LOWER(IDCLIENTE) CODIGO FROM CLIENTES_NEPTUNO;
#5
SELECT FECHA, LEFT(SEXO, 1) AS SEXO, LEFT(TIPO_PARTO, 1) AS TIPO FROM NACIMIENTOS;
#6
SELECT *, UPPER(CONCAT(LEFT(CIUDAD, 1), LEFT(PAIS,1), RIGHT(PAIS, 2))) 
AS CODIGO FROM CLIENTES_NEPTUNO;
#7
SELECT SEXO, FECHA, TIPO_PARTO, ATENC_PART, LOCAL_PART, SUBSTRING(FECHA, 4, 2) AS MES
FROM NACIMIENTOS ORDER BY MES; 
#8
SELECT SEXO, FECHA, TIPO_PARTO, REPLACE(NACIONALIDAD, 'Chilena', 'Ciudadana') AS NACIONALIDAD 
FROM NACIMIENTOS; 

#3.3.1
SELECT * FROM PEDIDOS_NEPTUNO WHERE YEAR(FECHAPEDIDO) = 1998;
#2
SELECT * FROM PEDIDOS_NEPTUNO WHERE MONTH(FECHAPEDIDO) BETWEEN 8 AND 9 AND YEAR(FECHAPEDIDO) = 1997;
#3
SELECT * FROM PEDIDOS_NEPTUNO WHERE DAY(FECHAPEDIDO) = 1;
#4
SELECT *, DATEDIFF(CURDATE(), FECHAPEDIDO) AS 'DIAS TRANSCURRIDOS' 
FROM PEDIDOS_NEPTUNO;
#5
SELECT *, DATEDIFF(CURDATE(), FECHAPEDIDO) AS 'DIAS TRANSCURRIDOS', 
DAYNAME(FECHAPEDIDO) AS 'DIA' FROM PEDIDOS_NEPTUNO;
#6
SELECT *, DATEDIFF(CURDATE(), FECHAPEDIDO) AS 'DIAS TRANSCURRIDOS', 
DAYNAME(FECHAPEDIDO) AS 'DIA',
DAYOFYEAR(FECHAPEDIDO) AS 'DIA DEL NIÑO' FROM PEDIDOS_NEPTUNO;
#7
SELECT *, DATEDIFF(CURDATE(), FECHAPEDIDO) AS 'DIAS TRANSCURRIDOS', 
DAYNAME(FECHAPEDIDO) AS 'DIA',
DAYOFYEAR(FECHAPEDIDO) AS 'DIA DEL NIÑO', 
MONTHNAME(FECHAPEDIDO) AS MES FROM PEDIDOS_NEPTUNO;
#8
SELECT *, DATEDIFF(CURDATE(), FECHAPEDIDO) AS 'DIAS TRANSCURRIDOS', 
DAYNAME(FECHAPEDIDO) AS 'DIA',
DAYOFYEAR(FECHAPEDIDO) AS 'DIA DEL NIÑO',
MONTHNAME(FECHAPEDIDO) AS 'MES',
ADDDATE(FECHAPEDIDO, INTERVAL 30 DAY)  AS 'PRIMER VENCIMIENTO' FROM PEDIDOS_NEPTUNO;
#9
SELECT *, DATEDIFF(CURDATE(), FECHAPEDIDO) AS 'DIAS TRANSCURRIDOS', 
DAYNAME(FECHAPEDIDO) AS 'DIA',
DAYOFYEAR(FECHAPEDIDO) AS 'DIA DEL NIÑO',
MONTHNAME(FECHAPEDIDO) AS 'MES',
ADDDATE(FECHAPEDIDO, INTERVAL 30 DAY)  AS 'PRIMER VENCIMIENTO', 
ADDDATE(FECHAPEDIDO, INTERVAL 90 DAY)  AS 'SEGUNDO VENCIMIENTO' FROM PEDIDOS_NEPTUNO;

#3.4.1
SELECT *, ROUND(CARGO*21/100, 2) AS 'IVA' FROM PEDIDOS_NEPTUNO;
#2
SELECT *, ROUND(CARGO*21/100, 2) AS 'IVA', 
ROUND(CARGO + 1.21, 2) AS 'NETO' FROM PEDIDOS_NEPTUNO;
#3
SELECT *, ROUND(CARGO*21/100, 2) AS 'IVA', 
ROUND(CARGO + 1.21, 2) AS 'NETO', 
FLOOR(ROUND(CARGO * 1.21, 2)) AS 'REDONDEO A FAVOR DEL CLIENTE' FROM PEDIDOS_NEPTUNO;
#4
SELECT *, ROUND(CARGO*21/100, 2) AS 'IVA', 
ROUND(CARGO + 1.21, 2) AS 'NETO', 
FLOOR(ROUND(CARGO * 1.21, 2)) AS 'REDONDEO A FAVOR DEL CLIENTE',
CEIL(ROUND(CARGO * 1.21, 2)) AS 'REDONDEO A FAVOR DE LA EMPRESA' FROM PEDIDOS_NEPTUNO;

#3.5.1
SELECT COUNT(*) FROM PEDIDOS_NEPTUNO;
#2
SELECT COUNT(TRANSPORTISTA) AS 'ENTREGAS SPEEDY EXPRESS' 
FROM PEDIDOS_NEPTUNO WHERE TRANSPORTISTA LIKE '%SPEEDY EXPRESS';
#3
SELECT COUNT(EMPLEADO) AS 'VENTAS' FROM PEDIDOS_NEPTUNO WHERE EMPLEADO LIKE 'C%'; 
#4
SELECT ROUND(AVG(PRECIOUNIDAD), 2) AS 'PRECIO PROMEDIO' FROM PRODUCTOS_NEPTUNO; 
#5
SELECT ROUND(AVG(PRECIOUNIDAD), 2) AS 'PRECIO PROMEDIO',
MIN(PRECIOUNIDAD) 'PRECIO INFERIOR' FROM PRODUCTOS_NEPTUNO;
#6
SELECT ROUND(AVG(PRECIOUNIDAD), 2) AS 'PRECIO PROMEDIO',
MIN(PRECIOUNIDAD) AS 'PRECIO INFERIOR',
MAX(PRECIOUNIDAD) AS 'PRECIO MAXIMO' FROM PRODUCTOS_NEPTUNO;
#7
SELECT NOMBRECATEGORIA AS CATEGORIA, MAX(PRECIOUNIDAD) AS 'PRECIO MAXIMO' 
FROM PRODUCTOS_NEPTUNO GROUP BY 'CATEGORIA';
#8
SELECT TRANSPORTISTA, COUNT(IDPEDIDO) AS ENTREGAS 
FROM PEDIDOS_NEPTUNO GROUP BY TRANSPORTISTA;
#9

