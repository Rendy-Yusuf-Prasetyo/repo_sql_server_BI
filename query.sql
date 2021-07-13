SELECT b.nama_barang, a.quantity, SUM(b.harga_barang * a.quantity) AS Pendapatan,  5000000 AS target
FROM fakta_pendapatan AS a INNER JOIN
dim_barang AS b ON a.id_barang = b.id_barang INNER JOIN
dim_pelanggan AS c ON a.id_pelanggan = c.id_pelanggan INNER JOIN
dim_waktu AS d ON a.id_waktu = d.id_waktu
GROUP BY b.nama_barang, a.quantity


SELECT b.nama_barang, a.quantity, SUM(b.harga_barang * a.quantity) AS Pendapatan, SUM((b.harga_barang * a.quantity) * 0.005) AS target, e.bulan
FROM fakta_pendapatan AS a INNER JOIN
dim_barang AS b ON a.id_barang = b.id_barang INNER JOIN
dim_pelanggan AS c ON a.id_pelanggan = c.id_pelanggan INNER JOIN
dim_waktu AS d ON a.id_waktu = d.id_waktu
JOIN dim_waktu AS e ON a.id_waktu = e.id_waktu
GROUP BY b.nama_barang, a.quantity, e.bulan

-- PERCOBAAN

select SUM(a.quantity * b.harga_barang) "PEMBELIAN BERSIH",
SUM(c.stok * b.harga_barang) "PERSEDIAAN AWAL",
SUM((c.stok * b.harga_barang) - ((c.stok - a.quantity) * b.harga_barang)) "PERSEDIAAN AKHIR"
from fakta_pengeluaran a 
JOIN dim_barang b ON a.ID_BARANG = b.iD_BARANG
JOIN dim_kain c ON a.ID_KAIN = c.ID_KAIN
JOIN dim_waktu d ON a.id_waktu = d.id_waktu

-- MUNGKIN BENER

select SUM(a.quantity * b.harga_barang) "BARANG YANG DIJUAL",
SUM(c.stok * b.harga_barang) "STOK AWAL",
SUM((c.stok * b.harga_barang) - (a.quantity * b.harga_barang)) "STOK AKHIR",
SUM((a.quantity * b.harga_barang) + (c.stok * b.harga_barang) - ((c.stok * b.harga_barang) - (a.quantity * b.harga_barang))) "HPP",
SUM(((a.quantity * b.harga_barang) + (c.stok * b.harga_barang) - ((c.stok * b.harga_barang) - (a.quantity * b.harga_barang))) * 0.005) "TARGET HPP"
from fakta_pengeluaran a 
JOIN dim_barang b ON a.ID_BARANG = b.iD_BARANG
JOIN dim_kain c ON a.ID_KAIN = c.ID_KAIN
JOIN dim_waktu d ON a.id_waktu = d.id_waktu

SELECT CASE WHEN c.rating >= 8 THEN 'SANGAT BAIK' WHEN c.rating >= 5 AND c.rating < 8 THEN 'CUKUP BAIK' ELSE 'SANGAT BURUK' END AS 'PENILAIAN', d.bulan
FROM fakta_layanan AS a INNER JOIN
dim_pelanggan AS b ON a.id_pelanggan = b.id_pelanggan INNER JOIN
dim_penilaian AS c ON a.id_penilaian = c.id_penilaian INNER JOIN
dim_waktu AS d ON a.id_waktu = d.id_waktu
ORDER BY d.bulan
