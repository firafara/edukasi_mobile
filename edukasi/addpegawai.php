<?php

header("Access-Control-Allow-Origin: *");

include 'koneksi.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Pastikan bahwa semua parameter yang diperlukan tersedia
    if (isset($_POST['no_bp']) && isset($_POST['email']) && isset($_POST['no_hp'])) {
        $noBp = $_POST['no_bp'];
        $email = $_POST['email'];
        $noHp = $_POST['no_hp'];

        $sql = "INSERT INTO pegawai (no_bp, email, no_hp) VALUES ('$noBp', '$email', '$noHp')";
        if ($koneksi->query($sql) === TRUE) {
            $response['isSuccess'] = true;
            $response['message'] = "Berhasil menambahkan pegawai";
        } else {
            $response['isSuccess'] = false;
            $response['message'] = "Gagal menambahkan pegawai: " . $koneksi->error;
        }
    } else {
        $response['isSuccess'] = false;
        $response['message'] = "Parameter tidak lengkap";
    }
} else {
    $response['isSuccess'] = false;
    $response['message'] = "Metode yang diperbolehkan hanya POST";
}

echo json_encode($response);
?>
