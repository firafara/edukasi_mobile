<?php

$koneksi = mysqli_connect("localhost", "root", "", "edukasi");

if($koneksi){

	// echo "Database berhasil Connect";
	
} else {
	echo "gagal Connect";
}

?>