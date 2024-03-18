<?php

header("Access-Control-Allow-Origin: header");
header("Access-Control-Allow-Origin: *");

include 'koneksi.php';

// if($_SERVER['REQUEST_METHOD'] == "POST") {
//     $response = array();
//     $username = $_POST['username'];
//     $password = $_POST['password'];

//     $cek = "SELECT * FROM users WHERE username = '$username'";
//     $result = mysqli_query($koneksi, $cek);

//     if($result && $row = mysqli_fetch_assoc($result)){
//         if(password_verify($password, $row['password'])){
//             $response['value'] = 1;
// 			$response['id'] = $row['id'];
//             $response['username'] = $row['username'];
//             $response['fullname'] = $row['fullname'];
// 			$response['message'] = "Login Berhasil";
//             echo json_encode($response);
//         } else {
//             $response['value'] = 0;
//             $response['message'] = "Gagal login: Password salah";
//             echo json_encode($response);
//         }
//     } else {
//         $response['value'] = 0;
//         $response['message'] = "Gagal login: Username tidak ditemukan";
//         echo json_encode($response);
//     }
// }
function kirimResponse($sukses, $status, $pesan, $data = null) {
    $response = [
        'sukses' => $sukses,
        'status' => $status,
        'pesan' => $pesan
    ];

    if ($data !== null) {
        $response['data'] = $data;
    }

    header('Content-Type: application/json');
    echo json_encode($response);
}

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['login'])) {
    include 'koneksi.php';
    $username = $_POST['username'];
    $password = $_POST['password'];

    $result = loginUser($koneksi, $username, $password);
    echo $result;
}
function loginUser($koneksi, $username, $password) {
    $query = "SELECT * FROM users WHERE username='$username'";
    $result = mysqli_query($koneksi, $query);

    if (mysqli_num_rows($result) == 1) {
        $row = mysqli_fetch_assoc($result);
        if (password_verify($password, $row['password'])) {
            $response = [
                'sukses' => true,
                'status' => 200,
                'pesan' => 'Login berhasil',
                'data' => $row
            ];
        } else {
            $response = [
                'sukses' => false,
                'status' => 401,
                'pesan' => 'Login gagal, username atau password salah',
                'data'=> null
            ];
        }
    } else {
        $response = [
            'sukses' => false,
            'status' => 401,
            'pesan' => 'Login gagal, username atau password salah',
            'data'=> null
        ];
    }

    return json_encode($response);
}
?>
