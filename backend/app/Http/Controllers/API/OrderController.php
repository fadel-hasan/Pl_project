<?php

namespace App\Http\Controllers\API;

use App\Models\Order;
use App\Models\Medicine;
use App\Models\OrderDetail;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;

class OrderController extends BaseController
{
    public function create(Request $request)
    {
        // Create a new order
        $order = Order::create([
            'user_id' => Auth::id()
        ]);

        foreach ($request->medicines as $medicineData) {
            $medicine = Medicine::find($medicineData['id']);
            $quantity = $medicineData['quantity'];
            if($medicine->quantity < $quantity)
            {
                $order->orderDetails()->delete();
                $order->Delete();
                return $this->sendError('The required quantity is not available, try again',[],400);
            }
            $orderDetail = OrderDetail::create([
                'order_id' => $order->id,
                'medicine_id' => $medicine->id,
                'quantity' => $quantity,
            ]);
        }


        return $this->sendResponse($order,'Order created successfully.');
    }

    public function index(){
        $orders = Order::with('user')->where('status', '<>', 2)
                ->get();

        return $this->sendResponse($orders, 'ok');
    }

    public function show($id)
    {
        $order = Order::find($id);
        if($order)
        {
        $orderDetails = $order->orderDetails;
        foreach ($orderDetails as $orderDetail) {
        $medicine = Medicine::find($orderDetail->medicine_id);
        $orderDetail->medicine_name = $medicine->name;
        }
        return $this->sendResponse($orderDetails,'ok');
        }
        else{
            return $this->sendError('not found order',[]);
        }
    }

    public function pharmacistOrders()
    {
        // Retrieve orders for the authenticated pharmacist
        $pharmacistId = Auth::id();
        $orders = Order::where('user_id', $pharmacistId)->get();
        return $this->sendResponse($orders,'ok');
    }

    public function updateStatus($orderId, Request $request)
    {

        // Update the status of the order
        $order = Order::find($orderId);

        if (!$order) {
            return $this->sendError('order not found',[]);
        }
        if ($request->status == 1) {
            $orderDetails =$order->orderDetails;
            foreach ($orderDetails as $orderDetail) {
                $medicine = Medicine::find($orderDetail->medicine_id);
                $medicine->quantity -= $orderDetail->quantity;
                $medicine->save();
            }
        }
        $order->update(['status' => $request->input('status')]);

        return $this->sendResponse($order, 'Order status updated successfully.');
    }

    public function warehouseOrders()
    {
        // Retrieve all orders
        $orders = Order::all();

        return response()->json(['orders' => $orders]);
    }


    public function updatePaymentStatus($orderId, Request $request)
    {

        // Update the payment status of the order
        $order = Order::find($orderId);

        if (!$order) {
            return $this->sendError('Order not found.',[]);
        }


        $order->update(['payment_status' => $request->input('status')]);
        return $this->sendResponse($order,'Payment status updated successfully.');
    }
}
