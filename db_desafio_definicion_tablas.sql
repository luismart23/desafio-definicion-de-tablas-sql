--1. Crear una base de datos llamada películas y reparto.

--2. Cargar ambos archivos a su tabla correspondiente.

DROP TABLE IF EXISTS REPARTO;
DROP TABLE IF EXISTS PELICULAS;

CREATE TABLE PELICULAS (
ID INT PRIMARY KEY,
NOMBRE_PELICULA VARCHAR(100),
ANIO_ESTRENO INT,
DIRECTOR VARCHAR(50)
);

CREATE TABLE REPARTO (
ID INT PRIMARY KEY,
ACTOR VARCHAR(50)
);

COPY PELICULAS
FROM 'C:\14-desafio-definicion-de-tablas/peliculas.csv'
DELIMITER ','
CSV HEADER;

COPY REPARTO
FROM 'C:\14-desafio-definicion-de-tablas/reparto.csv'
DELIMITER ','
CSV HEADER;

-- 3. Obtener el ID de la película “Titanic”.
SELECT ID FROM PELICULAS WHERE NOMBRE_PELICULA = 'Titanic';

-- 4. Listar a todos los actores que aparecen en la película "Titanic".
SELECT REPARTO.ACTOR FROM REPARTO 
JOIN PELICULAS ON REPARTO.ID = PELICULAS.ID
WHERE PELICULAS.NOMBRE_PELICULA = 'Titanic';

-- 5. Consultar en cuántas películas del top 100 participa Harrison Ford.
SELECT COUNT(*) FROM REPARTO 
JOIN PELICULAS ON REPARTO.ID = PELICULAS.ID
WHERE REPARTO.ACTOR = 'Harrison Ford'
AND PELICULAS.ID <= 100;

-- 6. Indicar las películas estrenadas entre los años 1990 y 1999 ordenadas por título de manera ascendente.
SELECT NOMBRE_PELICULA, ANIO_ESTRENO FROM PELICULAS 
WHERE ANIO_ESTRENO BETWEEN 1990 AND 1999
ORDER BY NOMBRE_PELICULA ASC;

-- 7. Hacer una consulta SQL que muestre los títulos con su longitud, la longitud debe ser nombrada para la consulta como “longitud_titulo”.
SELECT NOMBRE_PELICULA, LENGTH(NOMBRE_PELICULA) AS longitud_titulo FROM PELICULAS;

-- 8. Consultar cuál es la longitud más grande entre todos los títulos de las películas.
SELECT MAX(LENGTH(NOMBRE_PELICULA)) AS longitud_maxima FROM PELICULAS;


SELECT * FROM PELICULAS;
SELECT * FROM REPARTO;

