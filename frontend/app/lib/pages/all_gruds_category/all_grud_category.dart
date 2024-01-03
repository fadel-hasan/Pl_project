import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/cubit/cubit.dart';
import 'package:frontend/cubit/states.dart';
import 'package:provider/provider.dart';

import '../../order_provider.dart';
class AllGrudsCategory extends StatelessWidget {
  final String name;
  const AllGrudsCategory({super.key,required this.name});


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit,AppState>(
      builder: (context,state){
        var list = AppCubit.get(context).grudByCategory;
        if(state is LoadingAllGrudState){
          return Center(child: CircularProgressIndicator(),);
        }
        else if (state is SuccessAllGrudState) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xff17A4A1),
            title: Text('All Gruds Medecine in ${name}'),
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
            padding: const EdgeInsets.all(20.0),
            child: ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 28,
                      backgroundImage: AssetImage('assets/photo_2023-12-26_12-21-37.jpg',),
                    ),
                    title: Text(list[index].name),
                    subtitle: Text(list[index].nameCategory),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        var favoritesProvider =
                        Provider.of<FavoritesProvider>(context,
                            listen: false);

                        // if (favoritesProvider.favoriteMedicines
                        //     .contains(medicineNames[index])) {
                        //   favoritesProvider
                        //       .removeFromFavorites(medicineNames[index]);
                        // } else {
                        //   favoritesProvider
                        //       .addToFavorites(medicineNames[index]);
                        // }
                      },
                    ),
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => MedicineDetailsPage(
                      //         medicineName: list[index].name,
                      //         sientificName: list[index].scName,
                      //         medicineCategory: list[index].nameCategory,
                      //         manufactureCompany: list[index].manName,
                      //         quantity: list[index].quantity,
                      //         expirationDate: list[index].date,
                      //         price: list[index].price,
                      //         imagePath: medicineImages[index]),
                      //   ),
                      // );
                    },
                  ),
                );
              },
            ),
          ),
        );
        }

        return Container();
      },

    );
  }
}
