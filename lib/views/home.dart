import 'package:flutter/material.dart';
import 'package:food_recipe/controllers/recipe_controller.dart';
import 'package:food_recipe/views/widgets/recipe_card.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  RecipeController _recipeController = Get.put(RecipeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.restaurant_menu),
            SizedBox(width: 10),
            Text('Food Recipes'),
          ],
        ),
      ),
      body: Obx(
        () => _recipeController.isLoading.value
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: _recipeController.recipes.length,
                itemBuilder: (context, index) {
                  return RecipeCard(
                      title: _recipeController.recipes[index].name,
                      cookTime: _recipeController.recipes[index].totalTime,
                      rating:
                          _recipeController.recipes[index].rating.toString(),
                      thumbnailUrl: _recipeController.recipes[index].images);
                },
              ),
      ),
    );
  }
}
