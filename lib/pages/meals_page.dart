import 'package:flutter/material.dart';
import 'package:flutter_food_app/models/Meal.dart';
import 'package:flutter_food_app/service/api.dart';

class MealsPage extends StatelessWidget {
  final String category;

  const MealsPage({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 11, 178, 187),
        title: Text('$category Meals'),
      ),
      body: FutureBuilder<List<Meal>>(
        future: Api().getMeals(category),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No meals available.'));
          }
          List<Meal> meals = snapshot.data!;
          return ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemCount: meals.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Image.network(
                        meals[index].image ??
                            "https://t4.ftcdn.net/jpg/04/70/29/97/360_F_470299797_UD0eoVMMSUbHCcNJCdv2t8B2g1GVqYgs.jpg",
                        width: 150,
                        height: 150,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(meals[index].name ?? "No name"),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
