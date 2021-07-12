SELECT        b.nama_barang, a.quantity, SUM(b.harga_barang * a.quantity) AS Pendapatan,  5000000 AS target
FROM            fakta_pendapatan AS a INNER JOIN
                         dim_barang AS b ON a.id_barang = b.id_barang INNER JOIN
                         dim_pelanggan AS c ON a.id_pelanggan = c.id_pelanggan INNER JOIN
                         dim_waktu AS d ON a.id_waktu = d.id_waktu
GROUP BY b.nama_barang, a.quantity
