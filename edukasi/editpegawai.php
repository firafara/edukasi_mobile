<?php

header("Access-Control-Allow-Origin: *");

include 'koneksi.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Pastikan bahwa semua parameter yang diperlukan tersedia
    if (isset($_POST['id']) && isset($_POST['no_bp']) && isset($_POST['email']) && isset($_POST['no_hp'])) {
        $id = $_POST['id'];
        $noBp = $_POST['no_bp'];
        $email = $_POST['email'];
        $noHp = $_POST['no_hp'];

        $sql = "UPDATE pegawai SET no_bp='$noBp', email='$email', no_hp='$noHp' WHERE id='$id'";
        if ($koneksi->query($sql) === TRUE) {
            $response['isSuccess'] = true;
            $response['message'] = "Berhasil mengedit data pegawai";
        } else {
            $response['isSuccess'] = false;
            $response['message'] = "Gagal mengedit data pegawai: " . $koneksi->error;
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
