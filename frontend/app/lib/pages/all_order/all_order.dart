import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/cubit/cubit.dart';
import 'package:frontend/cubit/states.dart';

import '../details_order/details_order.dart';

class AllOrder extends StatelessWidget {
  const AllOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<AppCubit,AppState>(
      builder: (context,state){
          String checkStatus (String num){
            if(num == '0'){
              return "Send";
            }
            else if (num == '1'){
              return "Received";
            }

            return "On Preparing";
          }
        var listOrder = AppCubit.get(context).getAllOrderModel;
        if(state is LoadingOrderState){
          return Scaffold(body: Center(child: CircularProgressIndicator(),),);
        }
        else if (state is SuccessOrderState){
          return BlocBuilder<AppCubit,AppState>(
            builder: (context,state) {
              if(state is LoadingOrderState){
                return Scaffold(body: Center(child: CircularProgressIndicator(),),);
              }
              else if(state is SuccessOrderState){
                return Scaffold(
                  appBar: AppBar(
                    backgroundColor: Color(0xff17A4A1),
                    title: Text('All Order Pharmacy'),
                    actions: [
                      IconButton(
                        onPressed: () {
                          // showSearch(
                          //   context: context,
                          //   delegate: MySearchDelegate(),
                          // );
                        },
                        icon: const Icon(Icons.search),
                      ),
                    ],
                  ),
                  body: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: ListView.builder(
                      itemCount: listOrder.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            AppCubit.get(context).getOrderById(listOrder[index].id);
                            Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsOrderList()));
                          },
                          child: Card(
                            child: ListTile(
                              title: Text("Order ${listOrder[index].id}"),
                              subtitle: Text(listOrder[index].payment == 0? "Not Payment" : "Payment"),
                              trailing: Text(checkStatus(listOrder[index].status)),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                );
              }
              return Scaffold(
                appBar: AppBar(
                  backgroundColor: Color(0xff17A4A1),
                  title: Text('All Order Pharmacy'),
                  actions: [
                    IconButton(
                      onPressed: () {
                        // showSearch(
                        //   context: context,
                        //   delegate: MySearchDelegate(),
                        // );
                      },
                      icon: const Icon(Icons.search),
                    ),
                  ],
                ),
                body: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: ListView.builder(
                    itemCount: listOrder.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          AppCubit.get(context).getOrderById(listOrder[index].id);
                          Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsOrderList()));
                        },
                        child: Card(
                          child: ListTile(
                            title: Text("Order ${listOrder[index].id}"),
                            subtitle: Text(listOrder[index].payment == 0? "Not Payment" : "Payment"),
                            trailing: Text(checkStatus(listOrder[index].status)),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              );
            },

          );
        }
        return BlocBuilder<AppCubit,AppState>(
          builder: (context,state) {
            if(state is LoadingOrderState){
              return Scaffold(body: Center(child: CircularProgressIndicator(),),);
            }
            else if(state is SuccessOrderState){
              return Scaffold(
                appBar: AppBar(
                  backgroundColor: Color(0xff17A4A1),
                  title: Text('All Order Pharmacy'),
                  actions: [
                    IconButton(
                      onPressed: () {
                        // showSearch(
                        //   context: context,
                        //   delegate: MySearchDelegate(),
                        // );
                      },
                      icon: const Icon(Icons.search),
                    ),
                  ],
                ),
                body: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: ListView.builder(
                    itemCount: listOrder.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          AppCubit.get(context).getOrderById(listOrder[index].id);
                          Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsOrderList()));
                        },
                        child: Card(
                          child: ListTile(
                            title: Text("Order ${listOrder[index].id}"),
                            subtitle: Text(listOrder[index].payment == 0? "Not Payment" : "Payment"),
                            trailing: Text(checkStatus(listOrder[index].status)),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              );
            }
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Color(0xff17A4A1),
                title: Text('All Order Pharmacy'),
                actions: [
                  IconButton(
                    onPressed: () {
                      // showSearch(
                      //   context: context,
                      //   delegate: MySearchDelegate(),
                      // );
                    },
                    icon: const Icon(Icons.search),
                  ),
                ],
              ),
              body: Padding(
                padding: EdgeInsets.all(20.0),
                child: ListView.builder(
                  itemCount: listOrder.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        AppCubit.get(context).getOrderById(listOrder[index].id);
                        Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsOrderList()));
                      },
                      child: Card(
                        child: ListTile(
                          title: Text("Order ${listOrder[index].id}"),
                          subtitle: Text(listOrder[index].payment == 0? "Not Payment" : "Payment"),
                          trailing: Text(checkStatus(listOrder[index].status)),
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          },

        );
      },
    );
  }
}
