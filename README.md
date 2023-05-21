# API Mahasiswa

## 👋🏻 Introduction
Selamat datang di Repository API Mahasiswa. API Mahasiswa ini dibangun menggunakan Framework Laravel v10.x dan TailwindCSS v3.3.2

## 🚀 Getting started with this workspace
Koleksi ini berisi dokumentasi menyeluruh dari API Mahasiswa. Mereka akan membantu Anda memahami kemampuan layanan yang kami miliki dan cara menggunakannya secara efektif.

### Authentication
pada proses autentikasi kami menyediakan tiga request

- **POST** Login
``` url
http://localhost:8000/api/login
```
   #### Request Headers
   ###### Accept dan Content-Type
   ``` value
   application/vnd.api+json
   ```
   #### Body
   ###### form-data
   ```
   email: example@gmail.com
   password: Test1234!
   ```
   
- **POST** Register
``` url
http://localhost:8000/api/register
```
   #### Request Headers
   ###### Accept dan Content-Type
   ``` value
   application/vnd.api+json
   ```
   #### Body
   ###### form-data
   ```
   name: Jhon Doe
   email: example@gmail.com
   password: Test1234!
   password_confirmation: Test1234!
   ```
