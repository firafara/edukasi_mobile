<?php

header("Access-Control-Allow-Origin: header");
header("Access-Control-Allow-Origin: *");
include 'koneksi.php';

if($_SERVER['REQUEST_METHOD'] == "POST") {

    $response = array();
    $username = $_POST['username'];
    $email = $_POST['email'];
    $password = password_hash($_POST['password'], PASSWORD_BCRYPT); 
    $fullname = $_POST['fullname'];

    $cek = "SELECT * FROM users WHERE username = '$username' OR email = '$email'"; 
    $result = mysqli_query($koneksi, $cek);

    if(mysqli_num_rows($result) > 0){ 
        $response['value'] = 2;
        $response['message'] = "Username atau email telah digunakan";
        echo json_encode($response);
    } else {
        $insert = "INSERT INTO users (username, email, password, fullname, created_at) 
                   VALUES ('$username', '$email', '$password', '$fullname', NOW())";
        
        if(mysqli_query($koneksi, $insert)){
            $response['value'] = 1;
			$response['username'] = $username;
            $response['email'] = $email;
            $response['fullname'] = $fullname;
            $response['message'] = "Registrasi Berhasil";
            echo json_encode($response);
        } else {
            $response['value'] = 0;
            $response['message'] = "Gagal Registrasi";
            echo json_encode($response);
        }
    }
}

?>
