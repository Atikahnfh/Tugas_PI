@component('mail::message')
    
Ini adalah token Anda: {{ $data['token'] }}

Harap tambahkan ke semua permintaan API Mahasiswa
{{-- Harap tambahkan ke semua permintaan API Anda. Klik URL berikut ini untuk mengaktifkan token Anda <a href="www.google.com">Aktivasi Token</a> --}}

{{-- @component('mail::button', ['url' => 'www.google.com' ])
Aktivasi Token
@endcomponent --}}

Jika Anda tidak membuat permintaan ini, abaikan email ini.
@endcomponent