<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Category;
use Illuminate\Http\Request;

class CategoryController extends BaseController
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
            'desc' => 'required'
        ]);

        if(!$validate)
        {
            return $this->sendError("validation Error.",$validate->errors(),422);
        }
        else
        {
        $input = $request->all();
        $cat = Category::create($input);
        if($cat)
        {
            return $this->sendResponse($cat,"category added successfully",201);
        }
        else{
            return $this->sendError('error','category added failed',400);
        }
    }
    }

    public function index(){
        $cat = Category::all();
        if($cat)
        {
            return $this->sendResponse($cat,'',200);
        }
        else{
            return $this->sendError('not data found','',403);
        }
    }
}
