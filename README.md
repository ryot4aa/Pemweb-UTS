# Sistem Informasi Mahasiswa

## Cara Instalasi
1. Clone repo ini ke forlder _htdocs_ / _www_
``` bash
git clone https://github.com/amusfq/sistem-informasi-mahasiswa.git
```
2. Import file [_sql/db.sql_](sql/db.sql) ke database
3. Sesuaikan file [_config/db.php_](config/db.php) dengan konfigurasi anda

```php
<?php
  $dbHost = 'localhost'; // HOST DATABASE
  $dbName = 'sistem_informasi_mahasiswa'; // NAMA DATABASE
  $dbUser = 'root'; // USERNAME DATABASE
  $dbPass = ''; // PASSWORD DATABASE
  
  // Create Connection
  $connect = new mysqli($dbHost, $dbUser, $dbPass, $dbName);

  // Check Connection
  if ($connect->connect_error) {
    die("Connection failed: " . $connect->connect_error);
  }
?>
```
4. Aplikasi siap digunakan

## License
[MIT](https://choosealicense.com/licenses/mit/)