<?php
include 'funciones.php';

$config = include 'config.php';

$resultado = [
  'error' => false,
  'mensaje' => ''
];

try {
  // Configuración de conexión
  $dsn = 'mysql:host=' . $config['db']['host'] . ';dbname=' . $config['db']['name'];
  $conexion = new PDO($dsn, $config['db']['user'], $config['db']['pass'], $config['db']['options']);
  
  // Obtener el código del proveedor a eliminar
  $codigo_proveedor = $_GET['codigo_proveedor'];
  
  // Consulta para eliminar el proveedor
  $consultaSQL = "DELETE FROM Proveedor WHERE codigo_proveedor = :codigo_proveedor";

  // Preparar y ejecutar la consulta
  $sentencia = $conexion->prepare($consultaSQL);
  $sentencia->bindParam(':codigo_proveedor', $codigo_proveedor, PDO::PARAM_STR);
  $sentencia->execute();

  // Redirigir al índice después de eliminar
  header('Location: /index.php');
  exit;

} catch(PDOException $error) {
  $resultado['error'] = true;
  $resultado['mensaje'] = $error->getMessage();
}
?>

<?php require "templates/header.php"; ?>

<div class="container mt-2">
  <?php if ($resultado['error']): ?>
    <div class="row">
      <div class="col-md-12">
        <div class="alert alert-danger" role="alert">
          <?= $resultado['mensaje'] ?>
        </div>
      </div>
    </div>
  <?php endif; ?>
</div>

<?php require "templates/footer.php"; ?>
