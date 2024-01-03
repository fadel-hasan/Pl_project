<?php

namespace App\Http\Controllers\API;

use App\Models\Medicine;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Company;

class CompanyController extends BaseController
{
    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        // Validate the request data
        $validate=$request->validate([
            'name' =>'required|string',
            'location' => 'required|string',
            'email' => 'string',
            'phone' => 'required',
            'desc' => 'required'
        ]);

        if(!$validate)
        {
            return $this->sendError("validation Error.",$validate->errors(),422);
        }
        else
        {
        $input = $request->all();
        $company = Company::create($input);
        if($company)
        {
            return $this->sendResponse($company,"Company added successfully",201);
        }
        else{
            return $this->sendError('error','Company added failed',400);
        }
    }
    }

    public function index(){
        $company = Company::all();
        if($company)
        {
            return $this->sendResponse($company,'',200);
        }
        else{
            return $this->sendError('not data found','',403);
        }
    }
}
