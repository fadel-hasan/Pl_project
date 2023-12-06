<?php

namespace App\Http\Controllers\API;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use App\Http\Controllers\API\BaseController;
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
                    'name' => 'required',
                    'email' => 'required|email',
                    'password' => 'required',
                    'c_password' => 'required|same:password',
                ]);

                if($validator->fails()){
                    return $this->sendError('Validation Error.', $validator->errors());
                }

                $input = $request->except("c_password");

                $input['password'] = bcrypt($input['password']);
                try {
                    $user = User::create($input);
                    $success['token'] =  $user->createToken('MyApp')->accessToken;
                    $success['name'] =  $user->name;
                } catch (\Throwable $th) {
                    return response($th->getMessage());
                }

                return $this->sendResponse($success, 'User register successfully.');
            }

            /**
            * Login api
            *
            * @return \Illuminate\Http\Response
            */
            public function login(Request $request)
            {
                if(Auth::attempt(['email' => $request->email, 'password' => $request->password])){
                    $user = Auth::user();
                    $success['token'] = $user->createToken('MyApp')->accessToken;
                    $success['name']  = $user->name;

                    return $this->sendResponse($success, 'User login successfully.');
                }
                else
                {
                    return $this->sendError('Unauthorized.', ['error'=>'Unauthorized']);
                }
            }
}
