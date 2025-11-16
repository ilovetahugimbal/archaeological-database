-- Aktivitas Ekspedisi
SELECT 
    DATE_FORMAT(tanggal_mulai, '%Y-%m') as bulan,
    COUNT(*) as jumlah_ekspedisi
FROM ekspedisi 
--WHERE YEAR(tanggal_mulai) = 2023
GROUP BY DATE_FORMAT(tanggal_mulai, '%Y-%m')
ORDER BY bulan;

-- Analisis Laboratorium Terbaru
SELECT 
    a.nama as artefak,
    hl.hasil,
    hl.tanggal_analisis,
    s.nama_situs,
    DATEDIFF(CURDATE(), hl.tanggal_analisis) as hari_sejak_analisis
FROM hasil_laboratorium hl
JOIN artefak a ON hl.id_artefak = a.id_artefak
JOIN lokasi l ON a.id_lokasi = l.id_lokasi
JOIN situs_arkeologi s ON l.id_situs = s.id_situs
ORDER BY hl.tanggal_analisis DESC;

-- Arkeolog Terprodukitf/Aktif
SELECT 
    ar.nama,
    ar.institusi,
    COUNT(e.id_ekspedisi) as jumlah_ekspedisi,
    COUNT(DISTINCT ae.id_artefak) as artefak_ditemukan
FROM arkeolog ar
LEFT JOIN ekspedisi e ON ar.id_arkeolog = e.id_arkeolog
LEFT JOIN artefak_ekspedisi ae ON e.id_ekspedisi = ae.id_ekspedisi
GROUP BY ar.id_arkeolog, ar.nama, ar.institusi
ORDER BY jumlah_ekspedisi DESC, artefak_ditemukan DESC;

-- Distribusi Artefak per Budaya
SELECT 
    b.nama_budaya,
    b.periode,
    COUNT(a.id_artefak) as jumlah_artefak
FROM budaya b
LEFT JOIN artefak a ON b.id_budaya = a.id_budaya
GROUP BY b.id_budaya, b.nama_budaya, b.periode
ORDER BY jumlah_artefak DESC;

-- Overview Statistik Utama
SELECT 
    (SELECT COUNT(*) FROM artefak) as total_artefak,
    (SELECT COUNT(*) FROM ekspedisi) as total_ekspedisi,
    (SELECT COUNT(*) FROM situs_arkeologi) as total_situs,
	(SELECT COUNT(*) FROM arkeolog) as total_arkeolog;

-- Temuan Artefak Terbaru
SELECT 
    a.nama as nama_artefak,
    a.deskripsi,
    a.tanggal_ditemukan,
    s.nama_situs,
    l.nama_lokasi,
    b.nama_budaya,
    ar.nama as penemuan_oleh
FROM artefak a
JOIN lokasi l ON a.id_lokasi = l.id_lokasi
JOIN situs_arkeologi s ON l.id_situs = s.id_situs
JOIN budaya b ON a.id_budaya = b.id_budaya
JOIN artefak_ekspedisi ae ON a.id_artefak = ae.id_artefak
JOIN ekspedisi e ON ae.id_ekspedisi = e.id_ekspedisi
JOIN arkeolog ar ON e.id_arkeolog = ar.id_arkeolog
ORDER BY a.tanggal_ditemukan DESC
LIMIT 10;

-- Status Ekspedisi Terkini
SELECT 
    e.nama_ekspedisi,
    ar.nama as arkeolog,
    s.nama_situs,
    e.tanggal_mulai,
    e.tanggal_selesai,
    CASE 
        WHEN e.tanggal_selesai < CURDATE() THEN 'Selesai'
        WHEN e.tanggal_mulai <= CURDATE() AND e.tanggal_selesai >= CURDATE() THEN 'Sedang Berjalan'
        ELSE 'Belum Dimulai'
    END as status,
    DATEDIFF(e.tanggal_selesai, e.tanggal_mulai) as durasi_hari
FROM ekspedisi e
JOIN arkeolog ar ON e.id_arkeolog = ar.id_arkeolog
JOIN situs_arkeologi s ON e.id_situs = s.id_situs
ORDER BY e.tanggal_mulai DESC;

-- Top 5 Situs Paling Produktif/Aktif
SELECT 
    s.nama_situs,
    s.lokasi,
    COUNT(e.id_ekspedisi) as jumlah_ekspedisi,
    COUNT(DISTINCT a.id_artefak) as jumlah_artefak
FROM situs_arkeologi s
LEFT JOIN ekspedisi e ON s.id_situs = e.id_situs
LEFT JOIN lokasi l ON s.id_situs = l.id_situs
LEFT JOIN artefak a ON l.id_lokasi = a.id_lokasi
GROUP BY s.id_situs, s.nama_situs, s.lokasi
ORDER BY jumlah_ekspedisi DESC, jumlah_artefak DESC
LIMIT 5;