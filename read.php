<?php
$conn = mysqli_connect('localhost', 'root', '', 'bukutamu_mobile');
$query = mysqli_query($conn, "SELECT * FROM bkutamu");
$data = mysqli_fetch_all($query, MYSQLI_ASSOC);
echo json_encode($data);
?>