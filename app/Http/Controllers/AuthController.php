<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;

use App\Models\User;
use App\Models\Level;
use App\Models\Userlevel;
use Laravel\Sanctum\PersonalAccessToken;
use Illuminate\Http\Request;
use App\Traits\HttpResponses;
use App\Http\Requests\V1\UpdateUserlevelRequest;
use App\Http\Requests\V1\StoreUserRequest;
use App\Http\Requests\V1\LoginUserRequest;
use Illuminate\Support\Facades\Hash;
use Auth;

class AuthController extends Controller
{
    use HttpResponses;
    
    public function registoken(Request $request){
        $validator = $request->validate([
            'email' => 'required|email:dns|unique:users',
            'name' => 'required|min:3|max:100',
            'purpose' => 'required|min:8'
        ]);

        //masukkan ke table user
        $makeuser = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => Hash::make("1")
        ]);

        if(!$makeuser){
            return "User gagal dibuat. Token gagal dibuat.";
        }
        //buat token
        $gettoken = $makeuser->createToken($request->purpose, ['none'])->plainTextToken;

        $data = array(
            'tokenget' => $gettoken,
        );

        return view('generate-token')->with($data);
    }
    
    
    
    public function login(LoginUserRequest $request){
        $request->validated($request->all());

        if(!Auth::attempt($request->only('email', 'password'))){
            return $this->error('', 'Credentials do not match', 401);
        }

        $user = User::where('email', $request->email)->first();
        $level = Userlevel::where('user_id' , '=', $user->id)->first();
        
        if($level->level_id == 1){
            return$this->success([
                'user' => $user,
                'token' => $user->createToken('Api Token of '. $user->name)->plainTextToken
            ]);
        }elseif($level->level_id == 2){
            return$this->success([
                'user' => $user,
                'token' => $user->createToken('Api Token of '. $user->name, ["none"])->plainTextToken
            ]);
        }
        
        

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
        //klo yang $user ga berhasil maka ..
        if(!$user){
            return $this->error([
                'message' => 'Failed to make user level.'
            ]);
        }
        //klo $user berhasil maka buat level user vv
        $getid = User::where('email', '=', $request->email)->first();          
        $createlevel = Userlevel::create([
            'user_id' => $getid->id,
            'level_id' => 2
        ]);
        //klo $createlevel ga berhasil maka
        if(!$createlevel){
            return $this->error([
                'message' => 'Failed to make user level.'
            ]);
        }
        //klo $createlevel berhasil maka

        return $this->success([
            'user' => $user,
            'token' => $user->createToken('API Token of ' . $user->name, ['none'])->plainTextToken
        ]);

    }

    public function logout(){
        // return response()->json('WAsdasdasdaswsrgaerh');
        
        Auth::user()->currentAccessToken()->delete();
        
        return $this->success([
            "message" => "You have successfully logged out and your token has been deleted"
        ]);
        
    }

    public function changeuserlevel(UpdateUserlevelRequest $request, User $userid){
        
        $ceklevel = Level::find($request->levelId);
        $cekuser = User::where('id', $userid->id)->first();
        
        if(!$ceklevel){
            return response()->json("Level user gagal diganti. level id salah");
        }
        if(!$cekuser){
            return response()->json("Level user gagal diganti. user id tidak ditemukan");
        }
        
        
        $hasil = Userlevel::where('user_id', $userid->id)->update(['level_id' => $request->levelId]);
        if($hasil){
            PersonalAccessToken::where('tokenable_id', $userid->id)->delete();
            return response()->json("Level user berhasil diganti dan token telah diupdate! User tersebut harus melakukan login kembali.");
        }else{
            return response()->json("Level user gagal diganti.");
        }
        // $userid->update($request->all());
    }
}
