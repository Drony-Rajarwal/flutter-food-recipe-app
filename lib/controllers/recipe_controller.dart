import 'package:food_recipe/models/recipe.api.dart';
import 'package:food_recipe/models/recipe.dart';
import 'package:get/get.dart';

class RecipeController extends GetxController {
  var recipes = new List<Recipe>.empty(growable: true).obs;
  var isLoading = true.obs;

  Future<void> getRecipes() async {
    print("fetching data...");

    var _temp = await RecipeApi.getRecipe();
    recipes.addAll(_temp);
    print(recipes);

    print("Data fetched.");
    isLoading(false);
  }

  @override
  void onInit() async {
    super.onInit();
    await getRecipes();
  }
}
