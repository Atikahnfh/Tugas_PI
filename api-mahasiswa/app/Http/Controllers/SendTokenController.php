<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use App\Traits\HttpResponses;
use Illuminate\Support\Facades\Hash;
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
        
        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => Hash::make($request->email)
        ]);

        return $this->success([
            'user' => $user,
            'token' => $user->createToken('API Token of ' . $user->name)->plainTextToken
        ]);
    }
}
