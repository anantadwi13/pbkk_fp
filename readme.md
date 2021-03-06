# dengar.in

Final Project PBKK
- Ananta Dwi Prasetya Purna Yuda (05111740000029)
- Rangga Kusuma Dinata (05111740000120)

Dokumen dapat diakses pada link [berikut](https://drive.google.com/open?id=11_iBtilxZVfGXaKVnP7TtUzZLTIn_p7M)

## Installation

1. Clone or download this project
2. Install dependencies
    ```shell script
    composer install
    ```
3. Migrate `migration.sql`
4. Setup environment by copying `.env` file from `.env.example`
5. Done! 

---
## Daftar Use Case
### Umum
| No | Deskripsi | Check
| --- | --- | ---
| 1. | User (Admin, Sound, Amplifier) dapat login ke aplikasi | <ul><li>[x] </li></ul>
| 2. | User (Admin, Sound, Amplifier) dapat logout dari aplikasi | <ul><li>[x] </li></ul>
| 3. | User (Sound dan Amplifier) dapat register ke aplikasi | <ul><li>[x] </li></ul>
| 4. | User Admin dapat melakukan verifikasi user Sound dan Amplifier | <ul><li>[x] </li></ul>
| 5. | User (Admin, Sound, Amplifier) dapat mencari user (Sound dan Amplifier) lain | <ul><li>[x] </li></ul>
| 6. | User (Admin, Sound, Amplifier) dapat melihat portofolio (profil) user (Sound dan Amplifier) lain | <ul><li>[x] </li></ul>
| 7. | User (Sound dan Amplifier) dapat menambahkan user (Sound dan Amplifier) lain | <ul><li>[x] </li></ul>
| 8. | User Admin dapat memblokir user (Sound dan Amplifier) | <ul><li>[x] </li></ul>
### Ananta Dwi P P Y
| No | Deskripsi | Check
| --- | --- | ---
| 9. | User Sound dapat melihat jadwal miliknya | <ul><li>[x] </li></ul>
| 10. | User Sound dapat menambahkan acara pada jadwal miliknya | <ul><li>[x] </li></ul>
| 11. | User Sound dapat menghapus acara pada jadwal miliknya | <ul><li>[x] </li></ul>
| 12. | User Sound dapat mengedit acara pada jadwal miliknya | <ul><li>[x] </li></ul>
| 13. | User Amplifier dapat melihat jadwal kosong user Sound | <ul><li>[x] </li></ul>
| 14. | User Amplifier dapat membuat jadwal collab dengan user Sound | <ul><li>[x] </li></ul>
| 15. | User Sound dapat menanggapi (menerima/menolak) jadwal collab dari user Amplifier | <ul><li>[x] </li></ul>
| 16. | User (Sound dan Amplifier) dapat memberikan rating ke user (Sound dan Amplifier) lain setelah melakukan collab | <ul><li>[x] </li></ul>
### Rangga K D
| No | Deskripsi | Check
| --- | --- | ---
| 9. | User Admin dapat membuat kompetisi dengan kerjasama dengan pihak ketiga | <ul><li>[x] </li></ul>
| 10. | User Admin dapat mengedit kompetisi dengan kerjasama dengan pihak ketiga | <ul><li>[x] </li></ul>
| 11. | User Admin dapat menghapus kompetisi | <ul><li>[x] </li></ul>
| 12. | User Admin dapat melihat submisi - submisi user Sound | <ul><li>[x] </li></ul>
| 13. | User Sound dapat melihat kompetisi yang tersedia | <ul><li>[x] </li></ul>
| 14. | User Sound dapat mengirim submisi karya ke kompetisi | <ul><li>[x] </li></ul>
| 15. | User Sound dapat mengganti submisi karya ke kompetisi | <ul><li>[x] </li></ul>
| 16. | User Sound dapat membatalkan submisi karya ke kompetisi | <ul><li>[x] </li></ul>
| 17. | User Admin dapat membatalkan submisi karya terindikasi plagiarisme | <ul><li>[x] </li></ul>
