-- Crear base de datos
CREATE DATABASE inmobiliaria;
USE inmobiliaria;

-- Crear tabla
CREATE TABLE inmuebles (
    id_inmueble INT AUTO_INCREMENT PRIMARY KEY,
    inmueble VARCHAR(100) NOT NULL,
    compra DECIMAL(10,2) NOT NULL,
    reforma DECIMAL(10,2) NOT NULL,
    otros_gastos DECIMAL(10,2) NOT NULL,
    venta DECIMAL(10,2) NOT NULL,
    meses_operacion INT NOT NULL
);

-- Insertar datos
INSERT INTO inmuebles (inmueble, compra, reforma, otros_gastos, venta, meses_operacion) VALUES
('Madrid', 110000, 25000, 10000, 185000, 6),
('Toledo', 95000, 20000, 8000, 160000, 8),
('Sevilla', 120000, 30000, 12000, 195000, 12),
('Valencia', 105000, 22000, 9000, 175000, 7),
('Barcelona', 130000, 40000, 15000, 210000, 14),
('Málaga', 115000, 28000, 11000, 190000, 9),
('Zaragoza', 90000, 18000, 7000, 150000, 6),
('Bilbao', 125000, 35000, 13000, 205000, 13),
('Salamanca', 85000, 20000, 6000, 145000, 10),
('Granada', 100000, 24000, 9000, 170000, 8);

-- Beneficio por inmueble
SELECT 
    inmueble,
    (venta - compra - reforma - otros_gastos) AS beneficio
FROM inmuebles;

-- Rentabilidad
SELECT 
    inmueble,
    ROUND(
        (venta - compra - reforma - otros_gastos) / 
        (compra + reforma + otros_gastos) * 100, 
    2) AS rentabilidad_porcentaje
FROM inmuebles;

-- Ranking de rentabilidad
SELECT 
    inmueble,
    ROUND(
        (venta - compra - reforma - otros_gastos) / 
        (compra + reforma + otros_gastos) * 100, 
    2) AS rentabilidad_porcentaje
FROM inmuebles
ORDER BY rentabilidad_porcentaje DESC;

-- Rentabilidad anualizada
SELECT 
    inmueble,
    meses_operacion,
    ROUND(
        (venta - compra - reforma - otros_gastos) / 
        (compra + reforma + otros_gastos) * 100, 
    2) AS rentabilidad_porcentaje,
    ROUND(
        ((venta - compra - reforma - otros_gastos) / 
        (compra + reforma + otros_gastos)) * (12 / meses_operacion) * 100,
    2) AS rentabilidad_anualizada
FROM inmuebles
ORDER BY rentabilidad_anualizada DESC;

-- Resumen final
SELECT 
    COUNT(*) AS total_inmuebles,
    ROUND(AVG(venta - compra - reforma - otros_gastos), 2) AS beneficio_medio,
    ROUND(AVG(((venta - compra - reforma - otros_gastos) / (compra + reforma + otros_gastos)) * 100), 2) AS rentabilidad_media,
    ROUND(AVG(((venta - compra - reforma - otros_gastos) / (compra + reforma + otros_gastos)) * (12 / meses_operacion) * 100), 2) AS rentabilidad_anual_media
FROM inmuebles;