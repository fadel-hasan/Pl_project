<?php

namespace App\Http\Controllers\API;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use App\Http\Controllers\API\BaseController;
use Carbon\Carbon;
use Illuminate\Validation\Rules\Password;

class RegisterController extends BaseController
{
    /**
            * Register api
            *
            * @return \Illuminate\Http\Response
            */
            public function register(Request $request)
            {
                $validator = Validator::make($request->all(), [
                    'name' => ['required','min:3','max:50','string'],
                    'email' => ['required','numeric','unique:users'],
                    'password' => ['required','confirmed',Password::min(8)->mixedCase()->numbers()->symbols()],
                ],
            [
                'name.required' => 'name field is required',
                'name.min' => 'name field must be 3 character at latest',
                'name.max' => 'name field must be 50 at most',
                'name.string' => 'name must be string',
                'email.required' => 'email field is required',
                'email.email' => 'email is not regular email',
                'email.unique' => 'email has been found in system',
                'password.required' => 'password field is required',
                'password.confirmed' => 'password not match'
            ]);

                if($validator->fails()){
                    return $this->sendError('Validation Error.', $validator->errors(),422);
                }

                $input = $request->all();

                $input['password'] = bcrypt($input['password']);
                $user = User::create($input);
                if(!$user){
                    return $this->sendError('Registration failed');
                }
                $accessToken= $user->createToken('MyApp');
                $success['token'] = $accessToken->accessToken;
                $user->remember_token = $accessToken->accessToken;
                $success['name'] =  $user->name;


                return $this->sendResponse($success, 'User register successfully.');
            }

            /**
            * Login api
            *
            * @return \Illuminate\Http\Response
            */
            public function login(Request $request)
            {
                $validate = $request->validate([
                    'email'=> ['required','exists:users'],
                    'password'=>'required'
                ]);

                if(!$validate)
                {
                    return $this->sendError('Validation Error.',$validate->errors(),422);
                }

                if(Auth::attempt(['email' => $request->email, 'password' => $request->password])){
                    if ($request->email == env("email_warehouse"))
                    {
                        $success['type'] = 'warehouse';
                    }
                    else
                    {
                        $success['type'] = 'pharmacy';
                    }
                    $user = Auth::user();
                    $accessToken= $user->createToken('MyApp');
                    $success['token'] = $accessToken->accessToken;
                    $user['remember_token'] = $accessToken;
                    $success['name']  = $user->name;
                    if($request->remember_me)
                    {
                        $accessToken->token->expires_at = Carbon::now()->addMonth();
                        $accessToken->token->save();
                    }
                    $accessToken->token->save;
                    $success['expire_at']=Carbon::parse($accessToken->token->expires_at)->toDateTimeString();
                    return $this->sendResponse($success, 'User login successfully.');
                }
                else
                {
                    return $this->sendError('Unauthorized.', ['error'=>'Unauthorized'],403);
                }
            }

            /**
            * logout api
            *
            * @return \Illuminate\Http\Response
            */
            public function logout(){
                $accessToken = Auth::user()->token();
                $accessToken->revoke();
                return response()->json(["success"=>"logout success"],200);
            }

            /**
             * Login by phone number api
             *
             * @return \Illuminate\Http\Response
             */
            public function loginByPhone(Request $request)
            {
                $validate = $request->validate([
                    'phone' => ['required', 'exists:users'],
                    'password' => 'required'
                ]);

                if (!$validate) {
                    return $this->sendError('Validation Error.', $validate->errors(), 422);
                }

                if (Auth::attempt(['phone' => $request->phone, 'password' => $request->password])) {
                    $user = Auth::user();
                    $accessToken = $user->createToken('MyApp');
                    $success['token'] = $accessToken->accessToken;
                    $user['remember_token'] = $accessToken;
                    $success['name'] = $user->name;

                    if ($request->remember_me) {
                        $accessToken->token->expires_at = Carbon::now()->addMonth();
                        $accessToken->token->save();
                    }

                    $success['expire_at'] = Carbon::parse($accessToken->token->expires_at)->toDateTimeString();
                    return $this->sendResponse($success, 'User logged in successfully.');
                } else {
                    return $this->sendError('Unauthorized.', ['error' => 'Unauthorized'], 403);
                }
            }
}
