<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use App\Traits\HttpResponses;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Validator;

class SendTokenController extends Controller
{
    use HttpResponses;

    public function index() 
    {
        return view('get-token');
    }

    public function viewData(Request $request)
    {

        $validator = $request->validate([
            'email' => 'required|email:dns|unique:users',
            'name' => 'required|min:3|max:100',
            'purpose' => 'required|min:8'
        ]);

        $user = Http::withHeaders([
                        'Accept' => 'application/vnd.api+json',
                        'Content-Type' => 'application/vnd.api+json'])
                    ->post('https://api-mahasiswa.scholarfy.site/register', [
                        'name' => $request->name,
                        'email' => $request->email,
                        'password' => $request->email,
                        'password_confirmation' => $request->email])->json();
        
        return $user;
    }
}
