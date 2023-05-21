<!-- <p align="center"><a href="#" target="_blank"><img src="=" width="400" alt="Logo"></a></p> -->

<p align="center">
<a href="https://github.com/Atikahnfh/Tugas_PI"><img src="https://img.shields.io/cirrus/github/Atikahnfh/Tubes_PI?label=test&logo=github" alt="Build Status"></a>
</p>

# API Mahasiswa

## 👋🏻 Introduction
Selamat datang di Repository API Mahasiswa. API Mahasiswa ini dibangun menggunakan Framework Laravel v10.x dan TailwindCSS v3.3.2

## 🚀 Getting started with this API
Koleksi ini berisi dokumentasi menyeluruh dari API Mahasiswa. Mereka akan membantu Anda memahami kemampuan layanan yang kami miliki dan cara menggunakannya secara efektif.

### Authentication
pada proses autentikasi kami menyediakan tiga request

- **POST** Login
``` url
http://localhost:8000/api/login
```
   #### Request Headers
   `Accept:` application/vnd.api+json  
   `Content-Type:` application/vnd.api+json  
   #### Body `form-data`
   `email:` example@gmail.com
   `password:` Test1234!
   
- **POST** Register
``` url
http://localhost:8000/api/register
```
   #### Request Headers
   `Accept:` application/vnd.api+json  
   `Content-Type:` application/vnd.api+json  
   #### Body `form-data`
   `name:` Jhon Doe
   `email:` example@gmail.com
   `password:` Test1234!
   `password_confirmation:` Test1234!
   
 - **POST** Logout
``` url
http://localhost:8000/api/logout
```
   #### Authorization `Bearer Token`
   `Token:` {{ API_TOKEN }} 
   #### Request Headers
   `Accept:` application/vnd.api+json  
   `Content-Type:` application/vnd.api+json 
  

### Mahasiswa
- **GET** Semua Mahasiswa
``` url
http://localhost:8000/api/mahasiswa
```
   #### Authorization `Bearer Token`
   `Token:` {{ API_TOKEN }} 
   #### Request Headers
   `Accept:` application/vnd.api+json  
   `Content-Type:` application/vnd.api+json
   
- **GET** Satu Mahasiswa
``` url
http://localhost:8000/api/mahasiswa/{nim}
```
   #### Authorization `Bearer Token`
   `Token:` {{ API_TOKEN }} 
   #### Request Headers
   `Accept:` application/vnd.api+json  
   `Content-Type:` application/vnd.api+json

