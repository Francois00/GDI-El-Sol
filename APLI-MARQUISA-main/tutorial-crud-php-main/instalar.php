<?php

$config = include 'config.php';

try {
  $conexion = new PDO('mysql:host=' . $config['db']['host'], $config['db']['user'], $config['db']['pass'], $config['db']['options']);
  
  // Crear la base de datos si no existe
  $conexion->exec("CREATE DATABASE IF NOT EXISTS " . $config['db']['name']);
  $conexion->exec("USE " . $config['db']['name']);
  
  // Cargar el archivo SQL
  $sql = file_get_contents(__DIR__ . "/data/Script_ElSol_vf.sql");
  
  if ($sql === false) {
    throw new Exception("No se pudo cargar el archivo Script_ElSol_vf.sql.");
  }
  
  // Ejecutar el script SQL
  $conexion->exec($sql);

  echo "La base de datos se ha creado con éxito.";
} catch (Exception $error) {
  echo "Error: " . $error->getMessage();
}
