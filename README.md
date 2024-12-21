# introduce

<h5>API nasho learn di build menggunakan framework lumen versi 11 dengan versi php 8.2, jadi pastikan versi php anda sudah diatas versi >=7, (framework lumen adalah salah satu framwork api dari bahasa pemrograman php) </h5>

<h5>
aktifkan require module php yang dibutukan untuk menjalankan framework tersebut, beberapa modul yang di harus di aktifkan ialah pdo_mysqli, mysqli, xml  dan mbstring 
</h5>

# composer run

```Bash
composer install
```

# Start Local Development Server Ngandre API

```Bash
php -S localhost:8000 -t public || php artisan serve
```

# migrate table db

```Bash
php artisan migrate
# migrate refresh ketika ada update/perubahan schema column table
php artisan migrate:refresh
# jika ingin rollback table nya jalan kan perintah di bawah ini
php artisan migrate:rollback
```

# Base URL

```bash
#baseUrl
localhost:8000 -> sesuaikan dengan base url kalian
#ver
v1
```

# Endpoint Auth API

```Bash

#Login
{{base_url}}{{ver}}/user/auth/login ->POST
#register
{{base_url}}{{ver}}/user/auth/register ->POST
#logout
{{base_url}}{{ver}}/user/auth/logout ->POST


```

# Endpoint Profile API

```Bash

#Profile
{{base_url}}{{ver}}/user/profile ->GET

```

# Endpoint API USER

```Bash
#category and materi
{{base_url}}{{ver}}/user/category ->GET (List category)
{{base_url}}{{ver}}/user/category/:kategori_id/materi ->GET (List materi by category_id)
{{base_url}}{{ver}}/user/category/:category_id/status/:status_category ->PUT (Update status by users_id of exam,quis and status lock)
{{base_url}}{{ver}}/user/materi/:materi_id ->GET (Detail materi by materi_id)

#========== soal ===============
#quis
{{base_url}}{{ver}}/user/category/:category_id/materi/:materi_id/quis ->GET (List quis by materi_id and category_id)
{{base_url}}{{ver}}/user/category/:category_id/materi/:materi_id/quis/submit ->POST (submit jawaban quis by materi_id and category_id)
{{base_url}}{{ver}}/user/category/:category_id/materi/:materi_id/quis/result ->GET (result jawaban quis by materi_id and category_id)

#ujian
{{base_url}}{{ver}}/user/category/:category_id/exam?phase=1 ->GET (list exam by category_id and phase)
{{base_url}}{{ver}}/user/category/:category_id/exam/submit?phase=1 ->POST (submit exam by category_id and phase)
{{base_url}}{{ver}}/user/category/:category_id/exam/result?phase=2 ->GET (result exam by category_id and phase)

```

# Access Ke Endpoint API Yang Menggunakan Session

<h5>jika ingin mengakses api yang menggunakan session, maka anda harus mengirimkan 5 buah object/param seperti dibawah ini, kirim ketiga buah object tersebut melalui request header</h5>

<h5>Object param yang dikirim lewat request header</h5>

```JSON
{
    "Accept": "Application/json",
    "Authorization": "Bearer {{token}}",
    "X-PLATFORM-NASHO": "{{platform}}",
    "X-VERSION-NASHO": "{{version}}",
    "X-CLIENT-KEY-NASHO": "{{version}}",
}
```
