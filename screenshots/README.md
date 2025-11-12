# Screenshots - UTS Pemrograman Mobile# Screenshots - UTS Pemrograman Mobile# Cara Mengambil Screenshot

Folder ini berisi tangkapan layar dari aplikasi Flutter UTS Pemrograman Mobile.

## Daftar ScreenshotsFolder ini berisi tangkapan layar dari aplikasi Flutter UTS Pemrograman Mobile.## Untuk Upload ke GitHub

1. **splash_screen.png** - Splash Screen dengan foto profil dan informasi mahasiswa

2. **biodata.png** - Halaman Biodata dengan form input lengkap

3. **daftar_kontak.png** - Halaman Daftar Kontak dengan search bar## Daftar ScreenshotsIkuti langkah-langkah berikut untuk mengambil screenshot dari setiap halaman aplikasi:

4. **kalkulator.png** - Halaman Kalkulator dengan design Neobrutalism

5. **cuaca.png** - Halaman Cuaca (tampilan utama)

6. **cuaca2.png** - Halaman Cuaca (dengan scroll ke bawah)

7. **berita.png** - Halaman Berita (tampilan list)1. **biodata.png** - Halaman Biodata dengan form input lengkap### 1. Jalankan Aplikasi di Emulator

8. **berita2.png** - Halaman Berita (dengan kategori filter)

9. **daftar_kontak.png** - Halaman Daftar Kontak dengan search bar

---

3. **kalkulator.png** - Halaman Kalkulator dengan design Neobrutalism```bash

Semua screenshot diambil menggunakan emulator Android dengan resolusi 1080x1920.

4. **cuaca.png** - Halaman Cuaca (tampilan utama)flutter run

5. **cuaca2.png** - Halaman Cuaca (dengan scroll ke bawah)```

6. **berita.png** - Halaman Berita (tampilan list)

7. **berita2.png** - Halaman Berita (dengan kategori filter)### 2. Ambil Screenshot untuk Setiap Halaman

---#### Windows (Android Emulator)

Semua screenshot diambil menggunakan emulator Android dengan resolusi 1080x1920.- Gunakan shortcut: `Ctrl + S` di emulator

- Atau klik icon camera di emulator toolbar
- Screenshot tersimpan otomatis

#### macOS (iOS Simulator)

- Command + S
- Atau File > Save Screen

#### Menggunakan Flutter DevTools

```bash
flutter run
# Tekan 's' untuk screenshot
```

### 3. Daftar Screenshot yang Diperlukan

Ambil screenshot dari halaman-halaman berikut:

1. **splash_screen.png** - Splash screen dengan NIM dan nama
2. **dashboard_biodata.png** - Dashboard halaman Biodata
3. **dashboard_kontak.png** - Dashboard halaman Kontak
4. **dashboard_kalkulator.png** - Dashboard halaman Kalkulator
5. **dashboard_cuaca.png** - Dashboard halaman Cuaca
6. **dashboard_berita.png** - Dashboard halaman Berita
7. **biodata_form.png** - Form biodata yang sudah diisi
8. **kontak_list.png** - List kontak
9. **kalkulator_usage.png** - Kalkulator dengan perhitungan
10. **cuaca_detail.png** - Detail informasi cuaca
11. **berita_list.png** - List berita
12. **berita_detail.png** - Dialog detail berita

### 4. Simpan Screenshot

- Simpan semua screenshot ke folder `screenshots/`
- Gunakan nama file yang sesuai dengan deskripsi di atas
- Format: PNG atau JPG
- Resolusi: Sesuai emulator (biasanya 1080x1920 atau 720x1280)

### 5. Update README.md

Setelah screenshot tersimpan, tambahkan ke README.md:

```markdown
## 📸 Screenshots

### Splash Screen

![Splash Screen](screenshots/splash_screen.png)

### Dashboard - Biodata

![Dashboard Biodata](screenshots/dashboard_biodata.png)

### Dashboard - Kontak

![Dashboard Kontak](screenshots/dashboard_kontak.png)

### Dashboard - Kalkulator

![Dashboard Kalkulator](screenshots/dashboard_kalkulator.png)

### Dashboard - Cuaca

![Dashboard Cuaca](screenshots/dashboard_cuaca.png)

### Dashboard - Berita

![Dashboard Berita](screenshots/dashboard_berita.png)

### Form Biodata

![Form Biodata](screenshots/biodata_form.png)

### List Kontak

![List Kontak](screenshots/kontak_list.png)

### Kalkulator

![Kalkulator](screenshots/kalkulator_usage.png)

### Informasi Cuaca

![Cuaca](screenshots/cuaca_detail.png)

### List Berita

![List Berita](screenshots/berita_list.png)

### Detail Berita

![Detail Berita](screenshots/berita_detail.png)
```

### 6. Commit ke GitHub

```bash
git add screenshots/
git add README.md
git commit -m "Menambahkan screenshots aplikasi"
git push
```

## Tips

- Pastikan semua data terisi dengan lengkap saat screenshot
- Gunakan emulator dengan resolusi yang baik
- Screenshot dalam mode portrait (vertical)
- Pastikan tidak ada error atau loading indicator saat screenshot
- Crop jika diperlukan untuk fokus pada konten

## Alternatif: Screen Recording

Selain screenshot, Anda juga bisa membuat video demo:

```bash
# Android
adb shell screenrecord /sdcard/demo.mp4

# Atau gunakan emulator recording feature
```

Upload video ke YouTube dan tambahkan link di README.md.
