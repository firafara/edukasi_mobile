<?php

header("Access-Control-Allow-Origin: *");
include 'koneksi.php';

if($_SERVER['REQUEST_METHOD'] == "POST") {
    $response = array();
    
    $id = $_POST['id'];
    $username = $_POST['username'];
    $fullname = $_POST['fullname']; 
    $email = $_POST['email']; 

    $sql = "UPDATE users SET username = '$username', fullname = '$fullname', email = '$email' WHERE id = $id";
    $isSuccess = $koneksi->query($sql);

    if ($isSuccess) {
        $cek = "SELECT * FROM users WHERE id = $id";
        $result = mysqli_fetch_array(mysqli_query($koneksi, $cek));
        $response['is_success'] = true;
        $response['value'] = 1;
        $response['message'] = "User Berhasil di Edit";
        $response['username'] = $result['username'];
        $response['fullname'] = $result['fullname']; 
        $response['email'] = $result['email']; 
        $response['id'] = $result['id'];
    } else {
        $response['is_success'] = false;
        $response['value'] = 0;
        $response['message'] = "Gagal Edit User";
    }

    echo json_encode($response);
}

?>
