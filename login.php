<?php 
session_start();
$error = false;

if (isset($_SESSION['id_user'])) {
    header("location: index.php");
    exit();
} else {
    if (isset($_POST['submit'])) {
        $username = trim($_POST['username'] ?? '');
        $password = trim($_POST['password'] ?? '');
        
        // Cek apakah username atau password kosong
        if (empty($username) || empty($password)) {
            $error = true;
            $errorText = "Username atau password tidak boleh kosong";
        } else {
            include_once('./config/db.php');
            
            // Ambil data user dari database
            $query = "SELECT users.id, users.password, roles.nama_role FROM users ";
            $query .= "LEFT JOIN roles ON roles.id = users.id_role ";
            $query .= "WHERE username = ?";
            
            $stmt = $connect->prepare($query);
            $stmt->bind_param("s", $username);
            $stmt->execute();
            $result = $stmt->get_result();
            
            if ($result->num_rows > 0) {
                $user = $result->fetch_assoc();
                $id_user = $user['id'];
                $hashedPassword = $user['password'];
                $role = $user['nama_role'];
                
                // Verifikasi password menggunakan MD5
                if (($password) === $hashedPassword) {
                    // Cek apakah akun aktif
                    $query = "SELECT nama_lengkap, status FROM biodata WHERE id_user = ?";
                    $stmt = $connect->prepare($query);
                    $stmt->bind_param("i", $id_user);
                    $stmt->execute();
                    $result = $stmt->get_result();
                    
                    if ($result->num_rows > 0) {
                        $biodata = $result->fetch_assoc();
                        
                        if ($biodata['status']) {
                            // Set session dan redirect ke halaman index
                            $_SESSION['id_user'] = $id_user;
                            $_SESSION['nama_lengkap'] = $biodata['nama_lengkap'];
                            $_SESSION['role'] = $role;
                            
                            // Data tambahan untuk mahasiswa
                            if ($role === 'mahasiswa') {
                                $query = "SELECT prodi.nama_prodi FROM mahasiswa ";
                                $query .= "LEFT JOIN prodi ON prodi.id = mahasiswa.id_prodi ";
                                $query .= "WHERE id_user = ?";
                                $stmt = $connect->prepare($query);
                                $stmt->bind_param("i", $id_user);
                                $stmt->execute();
                                $result = $stmt->get_result();
                                
                                if ($result->num_rows > 0) {
                                    $prodi = $result->fetch_assoc();
                                    $_SESSION['nama_prodi'] = $prodi['nama_prodi'];
                                }
                            }
                            
                            // Data tambahan untuk dosen
                            if ($role === 'dosen') {
                                $query = "SELECT dosen.nama_dosen, dosen.departemen FROM dosen ";
                                $query .= "WHERE id_user = ?";
                                $stmt = $connect->prepare($query);
                                $stmt->bind_param("i", $id_user);
                                $stmt->execute();
                                $result = $stmt->get_result();
                                
                                if ($result->num_rows > 0) {
                                    $dosen = $result->fetch_assoc();
                                    $_SESSION['nama_dosen'] = $dosen['nama_dosen'];
                                    $_SESSION['departemen'] = $dosen['departemen'];
                                }
                            }

                            // Redirect ke halaman utama (index.php)
                            header("location: index.php");
                            exit();
                        } else {
                            $error = true;
                            $errorText = "Akun ini tidak aktif, silahkan hubungi administrator";
                        }
                    }
                } else {
                    $error = true;
                    $errorText = "NIM atau password salah";
                }
            } else {
                $error = true;
                $errorText = "NIM atau password salah";
            }
        }
    }
}
?>

<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link href="./vendors/bootstrap-5.0.0-beta3-dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="./assets/css/style.css">
    <script defer src="./vendors/jQuery-3.6.0/jQuery.min.js"></script>
    <script defer src="./vendors/bootstrap-5.0.0-beta3-dist/js/bootstrap.bundle.min.js"></script>
    <script defer src="./vendors/fontawesome-free-5.15.3-web/js/all.min.js"></script>
    <script defer src="./assets/js/script.js"></script>
    <style>
      html, body { height: 100%; }
      .container-fluid, .row, .full-height { height: 100%; }
    </style>
    <title>Masuk - Sistem Informasi Mahasiswa</title>
  </head>
  <body>
    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-0 col-md-4 d-none d-md-block bg-primary full-height position-relative">
          <img class='w-75 exact-center' src="./assets/img/login.svg"/>
        </div>
        <div class="col-sm-12 col-md-8 full-height">
          <div class="p-5">
            <h3 class="fw-bold mb-4">Login</h3>
            <?php if ($error) { ?>
              <div class="alert alert-danger d-flex align-items-center" role="alert">
                <i class="fas fa-exclamation-triangle me-2"></i>
                <div><strong>Gagal!</strong> <?= $errorText ?></div>
              </div>
            <?php } ?>
            <form method="POST">
              <div class="mb-3">
                <label for="username" class="form-label">Username (NIM/NIP)</label>
                <input type="text" class="form-control" name="username" placeholder="Username (NIM/NIP)">
              </div>
              <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <input type="password" class="form-control" name="password" placeholder="*******">
              </div>
              <div class="d-grid mb-4">
                <button class="btn btn-primary" name='submit' type="submit">Masuk</button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
