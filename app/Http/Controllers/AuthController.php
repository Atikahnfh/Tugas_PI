<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;

use App\Models\User;
use Illuminate\Http\Request;
use App\Traits\HttpResponses;
use App\Http\Requests\V1\StoreUserRequest;
use App\Http\Requests\V1\LoginUserRequest;
use Illuminate\Support\Facades\Hash;
use Auth;

class AuthController extends Controller
{
    use HttpResponses;
    

    public function login(LoginUserRequest $request){
        $request->validated($request->all());

        if(!Auth::attempt($request->only('email', 'password'))){
            return $this->error('', 'Credentials do not match', 401);
        }

         $user = User::where('email', $request->email)->first();

         return$this->success([
            'user' => $user,
            'token' => $user->createToken('Api Token of '. $user->name)->plainTextToken
         ]);

        // return "LOGIN TEST";
        // token akan expire selama 30 hari. ditentukan di file sanctum di config/sanctum sama di Console/Kernel untuk mendelete tokennya setiap 24 jam
    }

    public function register(StoreUserRequest $request){
        $request->validated($request->all());

        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => Hash::make($request->password)
        ]);

        return $this->success([
            'user' => $user,
            'token' => $user->createToken('API Token of ' . $user->name)->plainTextToken
        ]);

    }

    public function logout(){
        // return response()->json('WAsdasdasdaswsrgaerh');
        
        Auth::user()->currentAccessToken()->delete();
        
        return $this->success([
            'message' => 'You have succesfully logged out and your token has been deleted'
        ]);
        
    }
}
