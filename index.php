<?php
include "koneksi.php";
$query = mysqli_query($conn, "SELECT * FROM data_buku");
?>

<!DOCTYPE html>
<html lang="id">
<head>
<meta charset="UTF-8">
<title>Perpustakaan Digital Modern</title>

<style>
body {
    font-family: 'Segoe UI', Tahoma, sans-serif;
    background: linear-gradient(to right, #74ebd5, #9face6);
    margin: 0;
}

.container {
    max-width: 900px;
    margin: 40px auto;
    background: white;
    padding: 25px;
    border-radius: 15px;
    box-shadow: 0 10px 25px rgba(0,0,0,0.2);
}

h1 {
    text-align: center;
}

.wadah-pencarian {
    display: flex;
    margin-bottom: 20px;
    gap: 10px;
}

input {
    flex-grow: 1;
    padding: 12px;
    border-radius: 8px;
    border: 1px solid #ccc;
}

button {
    padding: 12px;
    border: none;
    border-radius: 8px;
    background: #6c63ff;
    color: white;
    cursor: pointer;
}

table {
    width: 100%;
    border-collapse: collapse;
}

th {
    background: #6c63ff;
    color: white;
    padding: 12px;
}

td {
    padding: 12px;
    text-align: center;
}

tr:nth-child(even) {
    background: #f2f2f2;
}
</style>
</head>

<body>

<div class="container">

<h1>📚 Sistem Informasi Perpustakaan</h1>

<div class="wadah-pencarian">
    <input type="text" id="searchInput" placeholder="Cari buku...">
    <button onclick="cariBuku()">Cari</button>
</div>

<table id="tabelBuku">
<tr>
    <th>No</th>
    <th>Judul Buku</th>
    <th>Penulis</th>
    <th>Tahun</th>
    <th>Kategori</th>
</tr>

<?php
$no = 1;
while ($row = mysqli_fetch_assoc($query)) {
?>
<tr>
    <td><?= $no++; ?></td>
    <td><?= $row['judul_buku']; ?></td>
    <td><?= $row['penulis']; ?></td>
    <td><?= $row['tahun']; ?></td>
    <td><?= $row['kategori']; ?></td>
</tr>
<?php } ?>

</table>

</div>

<script>
function cariBuku() {
    let input = document.getElementById("searchInput").value.toLowerCase();
    let baris = document.querySelectorAll("#tabelBuku tr");

    for (let i = 1; i < baris.length; i++) {
        let teks = baris[i].innerText.toLowerCase();
        baris[i].style.display = teks.includes(input) ? "" : "none";
    }
}
</script>

</body>
</html>