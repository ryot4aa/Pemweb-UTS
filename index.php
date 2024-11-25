<?php
session_start();
if (!isset($_SESSION['id_user'])) {
  header("location: login.php");
  exit();
}
include_once('./config/db.php');
?>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Google Font -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@300;400;500;600;700&display=swap" rel="stylesheet">

    <!-- Bootstrap CSS -->
    <link href="./vendors/bootstrap-5.0.0-beta3-dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Style CSS -->
    <link rel="stylesheet" href="./assets/css/style.css">

    <!-- jQuery 3.6.0 -->
    <script defer src="./vendors/jQuery-3.6.0/jQuery.min.js"></script>
    <!-- Bootstrap Bundle with Popper -->
    <script defer src="./vendors/bootstrap-5.0.0-beta3-dist/js/bootstrap.bundle.min.js"></script>
    <!-- FontAwesome -->
    <script defer src="./vendors/fontawesome-free-5.15.3-web/js/all.min.js"></script>
    <!-- Script JS -->
    <script defer src="./assets/js/script.js"></script>

    <?php   
      $page = @$_GET['page'];
      $action = @$_GET['action'];
      $file = '';
      $title = '';
      $script = '';
      
      if (isset($page)) {
        // ROUTE ADMIN
        if ($_SESSION['role'] == 'admin') {
          if ($page === '') {
            $file = 'admin/dashboard.php';
            $title = 'Dashboard - ';
          } else if ($page === 'mahasiswa') {
            $script = '<script src="vendors/sweetalert/sweetalert.min.js"></script>';
            if ($action === '') {
              $file = 'admin/mahasiswa.php';
              $title = 'Data Mahasiswa - ';
              $script .= '<script src="assets/js/mahasiswa.js"></script>';
            } else if ($action === 'edit') {
              $file = 'admin/edit_mahasiswa.php';
              $title = 'Ubah Data Mahasiswa - ';
              $script .= '<script src="assets/js/edit_mahasiswa.js"></script>';
            } else if ($action === 'add') {
              $file = 'admin/add_mahasiswa.php';
              $title = 'Tambah Data Mahasiswa - ';
              $script .= '<script src="assets/js/add_mahasiswa.js"></script>';
            } else {
              $file = 'admin/mahasiswa.php';
              $title = 'Data Mahasiswa - ';
              $script .= '<script src="assets/js/mahasiswa.js"></script>';
            }
          } else if ($page === 'matkul') {
            $file = 'admin/matkul.php';
            $title = 'Mata Kuliah - ';
            $script = '<script src="vendors/sweetalert/sweetalert.min.js"></script>';
            $script .= '<script src="assets/js/matkul.js"></script>';
          } else if ($page === 'jadwal') {
            $file = 'admin/jadwal.php';
            $title = 'Jadwal Kuliah - ';
            $script = '<script src="vendors/sweetalert/sweetalert.min.js"></script>';
            $script .= '<script src="assets/js/jadwal.js"></script>';
          } else if ($page === 'pengumuman') {
            $file = 'admin/pengumuman.php';
            $title = 'Pengumuman - ';
            $script = '<script src="vendors/sweetalert/sweetalert.min.js"></script>';
            $script .= '<script src="assets/js/pengumuman.js"></script>';
          } else if ($page === 'profile') {
            $file = 'profile.php';
            $title = 'Data Pribadi - ';
            $script = '<script src="assets/js/profile.js"></script>';
          } else {
            $file = '404.php';
            $title = '404 Not Found - ';
          }
        }

        // ROUTE MAHASISWA
        if ($_SESSION['role'] == 'mahasiswa') {
          if ($page === '') {
            $file = 'dashboard.php';
            $title = 'Dashboard - ';
          } else if ($page === 'matkul') {
            $file = 'mahasiswa/matkul.php';
            $title = 'Mata Kuliah - ';
          } else if ($page === 'khs') {
            $file = 'khs.php';
            $title = 'Laporan KHS - ';
          } else if ($page === 'profile') {
            $file = 'profile.php';
            $title = 'Data Pribadi - ';
            $script = '<script src="assets/js/profile.js"></script>';
          } else {
            $file = '404.php';
            $title = '404 Not Found - ';
          }
        }
      } else {
        if ($_SESSION['role'] == 'admin') {
          $file = 'admin/dashboard.php';
        } else {
          $file = 'dashboard.php';
        }
        $title = 'Dashboard - ';
      }
    ?>
    <title><?= $title ?>Sistem Informasi Mahasiswa</title>
  </head>
  <body>
    <div class="wrapper">
      <!-- Sidebar  -->
      <?php include('./components/sidebar.php'); ?>
      <!-- Page Content  -->
      <div id="main">
        <!-- Navbar -->
        <?php include('./components/navbar.php'); ?>
        <!-- Userinfo -->
        <div class='py-3 px-4 bg-warning text-light fs-5'>
          Selamat datang <?= $_SESSION['nama_lengkap'] ?> <?= $_SESSION['role'] == 'mahasiswa' ? '| Prodi: ' . $_SESSION['nama_prodi']: ''?>
        </div>
        <!-- Content -->
        <div id="content">
          <?php
            include('./pages/' . $file);
          ?>
        <!-- End div content -->
        </div>
      <!-- End div main -->
      </div>
    <!-- End div wrapper -->
    </div>
    <!-- Script -->
    <?= $script ?>
  </body>
</html>
