import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Beranda());
  }
}

class Beranda extends StatelessWidget {
  const Beranda({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0F172A),
      appBar: AppBar(
        backgroundColor: Color(0xFF1E293B),
        elevation: 0,
        title: Text(
          'Profil Mahasiswa',
          style: TextStyle(
            color: Color(0xFFF59E0B),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            // ===== Header profil: foto kiri, teks kanan =====
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Color(0xFF1E293B),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Color(0xFFF59E0B), width: 1.5),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Color(0xFFF59E0B),
                            width: 2,
                          ),
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            'assets/images/hilal.png',
                            width: 90,
                            height: 90,
                            fit: BoxFit.cover,
                            errorBuilder: (c, e, s) {
                              print('EROR FOTO: $e');
                              return Container(
                                width: 90,
                                height: 90,
                                color: Color(0xFF0F172A),
                                child: Icon(
                                  Icons.person,
                                  size: 50,
                                  color: Color(0xFFF59E0B),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Fitriadita Hilal Majid',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 6),
                            Text(
                              'NPM: 25670033',
                              style: TextStyle(
                                color: Color(0xFF94A3B8),
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 14,
                                vertical: 5,
                              ),
                              decoration: BoxDecoration(
                                color: Color(0xFFF59E0B),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                'INFORMATIKA',
                                style: TextStyle(
                                  color: Color(0xFF0F172A),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  letterSpacing: 1,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 18),
                  Divider(color: Color(0xFF94A3B8).withOpacity(0.3)),
                  SizedBox(height: 10),
                  Text(
                    'Kegagalan bukan akhir, hanya jalan memutar menuju keberhasilan.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF94A3B8),
                      fontSize: 14,
                      fontStyle: FontStyle.italic,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 25),

            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Informasi Profil',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            SizedBox(height: 15),

            // ===== Menu grid 2 kolom =====
            Row(
              children: [
                Expanded(
                  child: tombolProfil(
                    context,
                    Icons.person_outline,
                    'Tentang Saya',
                    TentangSaya(),
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: tombolProfil(
                    context,
                    Icons.school_outlined,
                    'Pendidikan',
                    Pendidikan(),
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: tombolProfil(
                    context,
                    Icons.code,
                    'Keterampilan',
                    Keterampilan(),
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: tombolProfil(
                    context,
                    Icons.contact_mail_outlined,
                    'Kontak',
                    Kontak(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ================= TOMBOL MENU (kartu grid) =================
Widget tombolProfil(
  BuildContext context,
  IconData ikon,
  String judul,
  Widget halaman,
) {
  return Material(
    color: Color(0xFF1E293B),
    borderRadius: BorderRadius.circular(18),
    child: InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => halaman),
        );
      },
      child: Padding(
        padding: EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Color(0xFFF59E0B).withOpacity(0.15),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(ikon, color: Color(0xFFF59E0B), size: 28),
            ),
            SizedBox(height: 16),
            Text(
              judul,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            SizedBox(height: 6),
            Row(
              children: [
                Text(
                  'Lihat',
                  style: TextStyle(color: Color(0xFF94A3B8), fontSize: 12),
                ),
                SizedBox(width: 4),
                Icon(Icons.arrow_forward, size: 14, color: Color(0xFFF59E0B)),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

// ================= HALAMAN-HALAMAN =================
class TentangSaya extends StatelessWidget {
  const TentangSaya({super.key});

  @override
  Widget build(BuildContext context) {
    return halamanProfil(
      context,
      'Tentang Saya',
      'Halo, saya Fitriadita Hilal Majid mahasiswa Program Studi Informatika.'
          'Saya tertarik dengan dunia teknologi, terutama'
          'pengembangan aplikasi mobile. '
          'Saat ini saya sedang belajar Flutter dan membuat aplikasi profil mahasiswa'
          ' ini sebagai bagian dari praktikum.'
          'Saya senang mempelajari hal baru, suka mencoba dan memperbaiki kesalahan,'
          'dan percaya bahwa proses belajar yang konsisten akan membawa hasil yang baik.'
          'Ke depan, saya ingin terus mengembangkan kemampuan agar bisa berkarya lewat teknologi.',
      Icons.person,
    );
  }
}

class Pendidikan extends StatelessWidget {
  const Pendidikan({super.key});

  @override
  Widget build(BuildContext context) {
    return halamanProfil(
      context,
      'Pendidikan',
      'Universitas: Universitas PGRI Semarang\n\n'
          'Program Studi: Informatika\n\n'
          'NPM: 25670033\n\n'
          'Semester: 3',
      Icons.school,
    );
  }
}

class Keterampilan extends StatelessWidget {
  const Keterampilan({super.key});

  @override
  Widget build(BuildContext context) {
    return halamanProfil(
      context,
      'Keterampilan',
      'Dasar Pemrograman\n\n'
          'Flutter\n\n'
          'Basis Data\n\n'
          'Kerja Sama Tim',
      Icons.code,
    );
  }
}

class Kontak extends StatelessWidget {
  const Kontak({super.key});

  @override
  Widget build(BuildContext context) {
    return halamanProfil(
      context,
      'Kontak',
      'Email: fitriaditahm23@email.com\n\n'
          'Telepon: 081225146642\n\n'
          'Lokasi: Semarang, Jawa Tengah, Indonesia',
      Icons.contact_mail,
    );
  }
}

// ================= TEMPLATE HALAMAN ISI =================
Widget halamanProfil(
  BuildContext context,
  String judul,
  String isi,
  IconData ikon,
) {
  return Scaffold(
    backgroundColor: Color(0xFF0F172A),
    appBar: AppBar(
      backgroundColor: Color(0xFF1E293B),
      elevation: 0,
      iconTheme: IconThemeData(color: Color(0xFFF59E0B)),
      title: Text(
        judul,
        style: TextStyle(color: Color(0xFFF59E0B), fontWeight: FontWeight.bold),
      ),
    ),
    body: SingleChildScrollView(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          // Bagian atas: ikon besar + judul
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 28),
            decoration: BoxDecoration(
              color: Color(0xFFF59E0B),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Color(0xFF0F172A),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(ikon, size: 44, color: Color(0xFFF59E0B)),
                ),
                SizedBox(height: 14),
                Text(
                  judul,
                  style: TextStyle(
                    color: Color(0xFF0F172A),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 16),

          // Kartu isi
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(22),
            decoration: BoxDecoration(
              color: Color(0xFF1E293B),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              isi,
              style: TextStyle(color: Colors.white, fontSize: 15, height: 1.7),
            ),
          ),

          SizedBox(height: 20),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFF59E0B),
                foregroundColor: Color(0xFF0F172A),
                padding: EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back),
              label: Text('Kembali'),
            ),
          ),
        ],
      ),
    ),
  );
}
