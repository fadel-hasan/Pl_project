<?php

namespace App\Http\Controllers\API;

use App\Models\User;
use App\Models\Category;
use App\Models\Medicine;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;

class MedicineController extends BaseController
{
    // ...

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        // Validate the request data
        $validate = $request->validate([
            'name' => 'required|string',
            'scientific_name' => 'required|string',
            'manufacturer_name' => 'required|string',
            'category_id' => 'required',
            'company_id' => 'required',
            'quantity' => 'required|integer',
            'price' => 'required|numeric',
            'expire_date' => 'required|date',
        ]);

        if (!$validate) {
            return $this->sendError("validation Error.", $validate->errors(), 422);
        } else {
            $input = $request->all();
            $medicine = Medicine::create($input);
            if ($medicine) {
                return $this->sendResponse($medicine, "Medicine added successfully", 201);
            } else {
                return $this->sendError('error', 'medicine added failed', 400);
            }
        }
    }
    /**
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $class = request('class');
        if (isset($class)) {
            $medicines = Medicine::where('category_id', $class)->get();
        } else {
            // Get all the medicines from the database
            $medicines = Medicine::with(['company', 'category'])->get();
        }
        foreach ($medicines as $medicine) {
            $user = Auth::user();
            $isFavorite = $user->preferredMedicines->contains($medicine);

            $medicine->isFavorite = $isFavorite;
        }
        // Return a JSON response with the medicines
        if (count($medicines) > 0) {
            return $this->sendResponse($medicines, 'Medicines retrieved successfully', 200);
        } else {
            return $this->sendError('not data found', []);
        }
    }

    public function search(Request $request)
    {

        $query = $request->input('query');
        $searchType = $request->input('searchType'); // 'name' or 'category'
        if (empty($query)) {
            return $this->sendError('No search term provided', [], 400);
        }
        if ($searchType === 'name') {
            $results = Medicine::where('name', 'like', '%' . $query . '%')->get();
        } else if ($searchType === 'category') {
            $results = Category::where('name', 'like', '%' . $query . '%')->with('medicines')->get();
        } else {
            // Handle invalid search type
            return $this->sendError('Invalid search type', [], 400);
        }

        if ($results) {
            return $this->sendResponse($results, 'ok');
        }
        return $this->sendError('Medicines not found', [], 404);
    }


    public function show($id)
    {
        // Get all the medicines from the database
        $medicine = Medicine::with(['company', 'category'])->find($id);

        if ($medicine) {
            return $this->sendResponse($medicine, 'ok');
        } else {
            return $this->sendError('not found', [], 404);
        }
    }



    public function addPreferredMedicine($id)
    {
        $user = User::find(Auth::id());
        $medicine = Medicine::find($id);
        if ($user->preferredMedicines->contains($medicine)) {
            return $this->sendError('has been added to preferred medicines', [],400);
        }
        $user->preferredMedicines()->attach($medicine);

        return $this->sendResponse($medicine,'ok');
    }

    public function getPreferredMedicines(){
        $user = Auth::user();

        $preferredMedicines = $user->preferredMedicines;
        if (count($preferredMedicines)>0)
        {

            return $this->sendResponse($preferredMedicines,'ok');
        }
        else
        {
            return $this->sendResponse('','preferred medicines not found');
        }

    }
}
