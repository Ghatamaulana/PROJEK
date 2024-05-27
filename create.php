<?php
$conn = mysqli_connect('localhost', 'root', '', 'bukutamu_mobile');
$username = $_POST['username'];
$komentar = $_POST['komentar'];
$data = mysqli_query($conn, "INSERT INTO bkutamu SET username = '$username', komentar = '$komentar'");
if ($data) {
    echo json_encode([
        'pesan' => 'Sukses'
    ]);
} else {
    echo json_encode([
        'pesan' => 'gagal'
    ]);
}
