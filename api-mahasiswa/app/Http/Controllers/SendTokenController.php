<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Mail\SendToken;
use App\Models\TokenUser;
use Illuminate\Http\Request;
use App\Traits\HttpResponses;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Validator;

class SendTokenController extends Controller
{
    use HttpResponses;

    public function index() 
    {
        return view('generate-token');
    }

    public function sendToken(Request $request)
    {
        $validator = $request->validate([
            'email' => 'required|email:dns|unique:token_users',
            'name' => 'required|min:3|max:100',
            'purpose' => 'required|min:8'
        ]);

        $user = TokenUser::create([
            'user_id' => Auth::user()->id,
            'email' => $request->email,
            'name' => $request->name,
            'purpose' => $request->purpose
        ]);
        
        $data = [
            'message' => 'Token berhasil di-generate',
            'user' => $user,
            'token' => $user->createToken('API Token of ' . $user->name)->plainTextToken
        ];


        Mail::to($user->email)->send(new SendToken($data));

        return redirect('/generate-token')->with('success', 'Token berhasil dikirim ke email '.$user->email);
        
    }
}
