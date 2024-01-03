import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/cubit/cubit.dart';
import 'package:frontend/cubit/states.dart';

class DetailsOrderList extends StatelessWidget {
  const DetailsOrderList({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<AppCubit,AppState>(
      builder: (context,state){
        var listDetails = AppCubit.get(context).detailsOrderModel;
        if(state is LoadingOrderIdState){
          return Scaffold(body: Center(child: CircularProgressIndicator(),),);
        }
        else if (state is SuccessOrderIdState){
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Color(0xff17A4A1),
              title: Text('Details Order'),
            ),
            body: Padding(
              padding: const EdgeInsets.all(20),
              child: ListView.builder(
                itemCount: listDetails.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {

                    },
                    child: Card(
                      child: ListTile(
                        title: Text(listDetails[index].name),
                        subtitle: Text(listDetails[index].type),
                        trailing: Text(listDetails[index].quantity.toString()),
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
            title: Text('Details Order'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: ListView.builder(
              itemCount: listDetails.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {

                  },
                  child: Card(
                    child: ListTile(
                      title: Text(listDetails[index].name),
                      subtitle: Text(listDetails[index].type),
                      trailing: Text(listDetails[index].quantity.toString()),
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
}
