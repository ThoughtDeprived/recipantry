import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/db/app_database.dart';
import '../../domain/models/recipe.dart' as domain;
import '../../domain/models/recipe_ingredient.dart' as domain_ingredient;
import '../../domain/models/recipe_step.dart' as domain_step;
import '../../domain/repositories/recipe_repository.dart';

class DriftRecipeRepository implements RecipeRepository {
  final AppDatabase db;

  DriftRecipeRepository(this.db);

  // ── Seed data ──────────────────────────────────────────────────────────────

  static const List<_SeedRecipe> _sampleRecipes = [
    _SeedRecipe(
      title: 'Burgers',
      servings: 4,
      instructions: 'Form beef into patties, grill or pan-fry, assemble on buns with your favorite toppings.',
      ingredients: [
        _SeedIngr('ground_beef', 'Ground beef', qty: 1.5, unit: 'lb'),
        _SeedIngr('hamburger_buns', 'Hamburger buns', qty: 4),
        _SeedIngr('lettuce', 'Lettuce'),
        _SeedIngr('tomato', 'Tomato', qty: 1),
        _SeedIngr('cheddar_cheese', 'Cheddar cheese', qty: 4, unit: 'slices'),
        _SeedIngr('ketchup', 'Ketchup'),
        _SeedIngr('mustard', 'Mustard'),
      ],
      steps: [
        _SeedStep(1, 'Season ground beef with salt and pepper. Form into 4 patties.'),
        _SeedStep(2, 'Grill or pan-fry over medium-high heat, 4 minutes per side.'),
        _SeedStep(3, 'Assemble on buns with lettuce, tomato, cheese, and condiments.'),
      ],
    ),
    _SeedRecipe(
      title: 'Cheeseburgers',
      servings: 4,
      instructions: 'Classic cheeseburgers with a double layer of melted cheddar.',
      ingredients: [
        _SeedIngr('ground_beef', 'Ground beef', qty: 1.5, unit: 'lb'),
        _SeedIngr('hamburger_buns', 'Hamburger buns', qty: 4),
        _SeedIngr('cheddar_cheese', 'Cheddar cheese', qty: 8, unit: 'slices'),
        _SeedIngr('onion', 'Onion', qty: 0.5),
        _SeedIngr('tomato', 'Tomato', qty: 1),
        _SeedIngr('ketchup', 'Ketchup'),
        _SeedIngr('mayonnaise', 'Mayonnaise'),
      ],
      steps: [
        _SeedStep(1, 'Form ground beef into patties and season with salt and pepper.'),
        _SeedStep(2, 'Cook patties 3-4 minutes per side. Add 2 cheese slices in the last minute.'),
        _SeedStep(3, 'Serve on toasted buns with onion, tomato, ketchup, and mayo.'),
      ],
    ),
    _SeedRecipe(
      title: 'Steak',
      servings: 2,
      instructions: 'Pan-seared steak with garlic butter, rested and served medium.',
      ingredients: [
        _SeedIngr('steak', 'Steak', qty: 2, unit: 'pieces'),
        _SeedIngr('butter', 'Butter', qty: 2, unit: 'tbsp'),
        _SeedIngr('garlic', 'Garlic', qty: 3, unit: 'cloves'),
        _SeedIngr('salt', 'Salt', qty: 1, unit: 'tsp'),
        _SeedIngr('black_pepper', 'Black pepper', qty: 0.5, unit: 'tsp'),
        _SeedIngr('olive_oil', 'Olive oil', qty: 1, unit: 'tbsp'),
      ],
      steps: [
        _SeedStep(1, 'Pat steaks dry; season generously with salt and pepper on both sides.'),
        _SeedStep(2, 'Sear in a hot skillet with olive oil, 3–4 min per side for medium.'),
        _SeedStep(3, 'Add butter and garlic to pan, baste steak for 1 minute. Rest 5 minutes before serving.'),
      ],
    ),
    _SeedRecipe(
      title: 'Steak a la Mexicana',
      servings: 4,
      instructions: 'Sliced steak sautéed with tomatoes, jalapeños, and onions in the Mexican style.',
      ingredients: [
        _SeedIngr('steak', 'Steak', qty: 1.5, unit: 'lb'),
        _SeedIngr('tomato', 'Tomato', qty: 2),
        _SeedIngr('jalapeno', 'Jalapeño', qty: 1),
        _SeedIngr('onion', 'Onion', qty: 1),
        _SeedIngr('garlic', 'Garlic', qty: 2, unit: 'cloves'),
        _SeedIngr('salt', 'Salt', qty: 1, unit: 'tsp'),
        _SeedIngr('olive_oil', 'Olive oil', qty: 1, unit: 'tbsp'),
      ],
      steps: [
        _SeedStep(1, 'Slice steak thin. Dice tomato, jalapeño, and onion.'),
        _SeedStep(2, 'Sauté steak in hot oil until browned. Remove and set aside.'),
        _SeedStep(3, 'Sauté onion and jalapeño until softened, add garlic and tomato. Cook 3 minutes.'),
        _SeedStep(4, 'Return steak to pan, combine and season. Serve with rice or tortillas.'),
      ],
    ),
    _SeedRecipe(
      title: 'Beef Tacos',
      servings: 4,
      instructions: 'Seasoned ground beef in warm corn tortillas topped with fresh toppings.',
      ingredients: [
        _SeedIngr('ground_beef', 'Ground beef', qty: 1, unit: 'lb'),
        _SeedIngr('corn_tortillas', 'Corn tortillas', qty: 8),
        _SeedIngr('chili_powder', 'Chili powder', qty: 1, unit: 'tbsp'),
        _SeedIngr('cumin', 'Cumin', qty: 1, unit: 'tsp'),
        _SeedIngr('garlic_powder', 'Garlic powder', qty: 0.5, unit: 'tsp'),
        _SeedIngr('lettuce', 'Lettuce', qty: 2, unit: 'cups'),
        _SeedIngr('tomato', 'Tomato', qty: 1),
        _SeedIngr('cheddar_cheese', 'Cheddar cheese', qty: 0.5, unit: 'cup'),
        _SeedIngr('sour_cream', 'Sour cream'),
      ],
      steps: [
        _SeedStep(1, 'Brown ground beef; drain fat. Add chili powder, cumin, garlic powder, and a splash of water. Simmer 5 minutes.'),
        _SeedStep(2, 'Warm tortillas in a dry skillet or directly over a flame.'),
        _SeedStep(3, 'Fill tortillas with beef and top with lettuce, tomato, cheese, and sour cream.'),
      ],
    ),
    _SeedRecipe(
      title: 'Chicken Fajitas',
      servings: 4,
      instructions: 'Sizzling chicken strips with peppers and onions served in warm flour tortillas.',
      ingredients: [
        _SeedIngr('chicken_breast', 'Chicken breast', qty: 1.5, unit: 'lb'),
        _SeedIngr('bell_pepper', 'Bell pepper', qty: 2),
        _SeedIngr('onion', 'Onion', qty: 1),
        _SeedIngr('cumin', 'Cumin', qty: 1, unit: 'tsp'),
        _SeedIngr('paprika', 'Paprika', qty: 1, unit: 'tsp'),
        _SeedIngr('garlic_powder', 'Garlic powder', qty: 0.5, unit: 'tsp'),
        _SeedIngr('tortillas', 'Flour tortillas', qty: 8),
        _SeedIngr('sour_cream', 'Sour cream'),
        _SeedIngr('avocado', 'Avocado', qty: 1),
      ],
      steps: [
        _SeedStep(1, 'Slice chicken, peppers, and onion into strips. Season chicken with cumin, paprika, and garlic powder.'),
        _SeedStep(2, 'Cook chicken in a hot skillet with oil until cooked through. Set aside.'),
        _SeedStep(3, 'Sauté peppers and onion until softened. Return chicken to pan and toss together.'),
        _SeedStep(4, 'Serve in warm tortillas with sour cream and sliced avocado.'),
      ],
    ),
    _SeedRecipe(
      title: 'Chili Cheese Dogs',
      servings: 4,
      instructions: 'Hot dogs topped with bean chili and melted cheddar cheese.',
      ingredients: [
        _SeedIngr('sausage', 'Hot dogs', qty: 8),
        _SeedIngr('hot_dog_buns', 'Hot dog buns', qty: 8),
        _SeedIngr('black_beans', 'Black beans', qty: 1, unit: 'can'),
        _SeedIngr('chili_powder', 'Chili powder', qty: 1, unit: 'tbsp'),
        _SeedIngr('cumin', 'Cumin', qty: 0.5, unit: 'tsp'),
        _SeedIngr('cheddar_cheese', 'Cheddar cheese', qty: 1, unit: 'cup'),
        _SeedIngr('onion', 'Onion', qty: 0.5),
      ],
      steps: [
        _SeedStep(1, 'Simmer black beans with chili powder, cumin, and diced onion for 10 minutes.'),
        _SeedStep(2, 'Grill or pan-fry hot dogs until heated through.'),
        _SeedStep(3, 'Place dogs in buns, top with bean chili and shredded cheddar.'),
      ],
    ),
    _SeedRecipe(
      title: 'Tostadas',
      servings: 4,
      instructions: 'Crispy corn tostadas topped with beans, cheese, and fresh vegetables.',
      ingredients: [
        _SeedIngr('corn_tortillas', 'Corn tortillas (toasted)', qty: 8),
        _SeedIngr('black_beans', 'Black beans', qty: 1, unit: 'can'),
        _SeedIngr('lettuce', 'Lettuce', qty: 2, unit: 'cups'),
        _SeedIngr('tomato', 'Tomato', qty: 1),
        _SeedIngr('cheddar_cheese', 'Cheddar cheese', qty: 0.5, unit: 'cup'),
        _SeedIngr('sour_cream', 'Sour cream'),
        _SeedIngr('avocado', 'Avocado', qty: 1),
      ],
      steps: [
        _SeedStep(1, 'Heat tortillas in the oven at 400°F or in a skillet with a little oil until crispy.'),
        _SeedStep(2, 'Warm black beans; season with salt, cumin, and garlic powder.'),
        _SeedStep(3, 'Spread beans on tostadas and layer with lettuce, tomato, cheese, sour cream, and avocado.'),
      ],
    ),
    _SeedRecipe(
      title: 'Philly Cheesesteak',
      servings: 4,
      instructions: 'Shaved steak with sautéed peppers and onions smothered in melted provolone on a hoagie roll.',
      ingredients: [
        _SeedIngr('steak', 'Steak (thinly sliced)', qty: 1.5, unit: 'lb'),
        _SeedIngr('bell_pepper', 'Bell pepper', qty: 1),
        _SeedIngr('onion', 'Onion', qty: 1),
        _SeedIngr('mozzarella', 'Provolone or mozzarella', qty: 4, unit: 'slices'),
        _SeedIngr('hamburger_buns', 'Hoagie rolls', qty: 4),
        _SeedIngr('salt', 'Salt', qty: 0.5, unit: 'tsp'),
        _SeedIngr('black_pepper', 'Black pepper', qty: 0.5, unit: 'tsp'),
        _SeedIngr('olive_oil', 'Olive oil', qty: 2, unit: 'tbsp'),
      ],
      steps: [
        _SeedStep(1, 'Freeze steak 30 minutes then slice paper-thin against the grain.'),
        _SeedStep(2, 'Sauté sliced peppers and onion until caramelized. Remove from pan.'),
        _SeedStep(3, 'Cook steak in same pan, seasoning with salt and pepper.'),
        _SeedStep(4, 'Layer steak and vegetables on rolls, top with cheese. Broil 1 minute until melted.'),
      ],
    ),
    _SeedRecipe(
      title: 'Fish Tacos',
      servings: 4,
      instructions: 'Lightly seasoned tilapia in corn tortillas with cilantro, lime, and avocado crema.',
      ingredients: [
        _SeedIngr('tilapia', 'Tilapia fillets', qty: 1.5, unit: 'lb'),
        _SeedIngr('corn_tortillas', 'Corn tortillas', qty: 8),
        _SeedIngr('lime', 'Lime', qty: 2),
        _SeedIngr('cilantro', 'Cilantro', qty: 0.25, unit: 'cup'),
        _SeedIngr('avocado', 'Avocado', qty: 1),
        _SeedIngr('sour_cream', 'Sour cream', qty: 0.5, unit: 'cup'),
        _SeedIngr('garlic_powder', 'Garlic powder', qty: 0.5, unit: 'tsp'),
        _SeedIngr('paprika', 'Paprika', qty: 0.5, unit: 'tsp'),
      ],
      steps: [
        _SeedStep(1, 'Season tilapia with garlic powder, paprika, salt, and pepper.'),
        _SeedStep(2, 'Cook fish in a skillet with oil 3 minutes per side. Break into pieces.'),
        _SeedStep(3, 'Mash avocado with sour cream and lime juice for crema.'),
        _SeedStep(4, 'Fill warm tortillas with fish, crema, cilantro, and a squeeze of lime.'),
      ],
    ),
    _SeedRecipe(
      title: 'Cilantro Lime Rice',
      servings: 4,
      instructions: 'Fluffy jasmine rice brightened with fresh cilantro and lime juice.',
      ingredients: [
        _SeedIngr('jasmine_rice', 'Jasmine rice', qty: 1.5, unit: 'cups'),
        _SeedIngr('cilantro', 'Cilantro', qty: 0.5, unit: 'cup'),
        _SeedIngr('lime', 'Lime', qty: 1),
        _SeedIngr('butter', 'Butter', qty: 1, unit: 'tbsp'),
        _SeedIngr('salt', 'Salt', qty: 0.75, unit: 'tsp'),
      ],
      steps: [
        _SeedStep(1, 'Rinse rice and cook according to package directions.'),
        _SeedStep(2, 'Fluff with a fork; stir in butter, lime juice, and chopped cilantro.'),
        _SeedStep(3, 'Season with salt. Serve as a side dish.'),
      ],
    ),
    _SeedRecipe(
      title: 'Chicken Alfredo',
      servings: 4,
      instructions: 'Creamy homemade alfredo sauce over fettuccine with pan-seared chicken.',
      ingredients: [
        _SeedIngr('chicken_breast', 'Chicken breast', qty: 1, unit: 'lb'),
        _SeedIngr('pasta', 'Fettuccine', qty: 12, unit: 'oz'),
        _SeedIngr('heavy_cream', 'Heavy cream', qty: 1, unit: 'cup'),
        _SeedIngr('butter', 'Butter', qty: 2, unit: 'tbsp'),
        _SeedIngr('garlic', 'Garlic', qty: 3, unit: 'cloves'),
        _SeedIngr('mozzarella', 'Parmesan or mozzarella', qty: 0.75, unit: 'cup'),
        _SeedIngr('salt', 'Salt', qty: 0.5, unit: 'tsp'),
        _SeedIngr('black_pepper', 'Black pepper', qty: 0.25, unit: 'tsp'),
      ],
      steps: [
        _SeedStep(1, 'Cook pasta in salted water until al dente; reserve 1 cup pasta water.'),
        _SeedStep(2, 'Season and sear chicken in butter 4–5 minutes per side. Rest then slice.'),
        _SeedStep(3, 'In the same pan, sauté garlic 1 minute. Add cream and bring to a simmer.'),
        _SeedStep(4, 'Stir in cheese until melted. Toss pasta with sauce; top with chicken.'),
      ],
    ),
    _SeedRecipe(
      title: 'BBQ Chicken',
      servings: 4,
      instructions: 'Oven-baked chicken thighs glazed with BBQ sauce and roasted until sticky and caramelized.',
      ingredients: [
        _SeedIngr('chicken_thighs', 'Chicken thighs', qty: 8),
        _SeedIngr('bbq_sauce', 'BBQ sauce', qty: 1, unit: 'cup'),
        _SeedIngr('garlic_powder', 'Garlic powder', qty: 1, unit: 'tsp'),
        _SeedIngr('onion_powder', 'Onion powder', qty: 1, unit: 'tsp'),
        _SeedIngr('paprika', 'Paprika', qty: 1, unit: 'tsp'),
        _SeedIngr('salt', 'Salt', qty: 0.5, unit: 'tsp'),
        _SeedIngr('black_pepper', 'Black pepper', qty: 0.5, unit: 'tsp'),
      ],
      steps: [
        _SeedStep(1, 'Preheat oven to 400°F. Pat chicken dry; season with garlic powder, onion powder, paprika, salt, and pepper.'),
        _SeedStep(2, 'Place on a baking sheet and bake 30 minutes.'),
        _SeedStep(3, 'Brush generously with BBQ sauce; bake another 10–15 minutes until caramelized.'),
      ],
    ),
    _SeedRecipe(
      title: 'Quesadillas',
      servings: 4,
      instructions: 'Crispy flour tortillas filled with chicken, peppers, and melted cheese.',
      ingredients: [
        _SeedIngr('tortillas', 'Flour tortillas', qty: 8),
        _SeedIngr('shredded_cheese', 'Shredded cheese', qty: 2, unit: 'cups'),
        _SeedIngr('chicken_breast', 'Chicken breast (cooked, shredded)', qty: 2, unit: 'cups'),
        _SeedIngr('bell_pepper', 'Bell pepper', qty: 1),
        _SeedIngr('onion', 'Onion', qty: 0.5),
        _SeedIngr('sour_cream', 'Sour cream'),
      ],
      steps: [
        _SeedStep(1, 'Sauté diced peppers and onion until soft. Season shredded chicken with salt, pepper, and cumin.'),
        _SeedStep(2, 'Place cheese, chicken, and vegetables on one half of each tortilla; fold over.'),
        _SeedStep(3, 'Cook in a lightly oiled skillet 2–3 minutes per side until golden and cheese melts.'),
        _SeedStep(4, 'Slice into wedges and serve with sour cream.'),
      ],
    ),
    _SeedRecipe(
      title: 'Enchiladas',
      servings: 4,
      instructions: 'Corn tortillas filled with chicken and smothered in red sauce and melted cheese.',
      ingredients: [
        _SeedIngr('corn_tortillas', 'Corn tortillas', qty: 8),
        _SeedIngr('chicken_breast', 'Chicken breast (cooked, shredded)', qty: 2, unit: 'cups'),
        _SeedIngr('tomato_sauce', 'Tomato sauce', qty: 1, unit: 'can'),
        _SeedIngr('cheddar_cheese', 'Cheddar cheese', qty: 1, unit: 'cup'),
        _SeedIngr('onion', 'Onion', qty: 1),
        _SeedIngr('garlic', 'Garlic', qty: 2, unit: 'cloves'),
        _SeedIngr('cumin', 'Cumin', qty: 1, unit: 'tsp'),
        _SeedIngr('chili_powder', 'Chili powder', qty: 2, unit: 'tsp'),
      ],
      steps: [
        _SeedStep(1, 'Sauté onion and garlic. Add tomato sauce, cumin, and chili powder; simmer 10 minutes.'),
        _SeedStep(2, 'Warm tortillas; fill each with shredded chicken and a spoonful of sauce. Roll tightly.'),
        _SeedStep(3, 'Arrange seam-side down in a baking dish. Cover with remaining sauce and cheese.'),
        _SeedStep(4, 'Bake at 375°F for 20 minutes until bubbly.'),
      ],
    ),
    _SeedRecipe(
      title: 'Nachos',
      servings: 4,
      instructions: 'Loaded tortilla chips with beans, jalapeños, cheese, and all the toppings.',
      ingredients: [
        _SeedIngr('corn_tortillas', 'Tortilla chips', qty: 8, unit: 'oz'),
        _SeedIngr('cheddar_cheese', 'Cheddar cheese', qty: 2, unit: 'cups'),
        _SeedIngr('black_beans', 'Black beans', qty: 1, unit: 'can'),
        _SeedIngr('jalapeno', 'Jalapeño', qty: 2),
        _SeedIngr('sour_cream', 'Sour cream'),
        _SeedIngr('avocado', 'Avocado', qty: 1),
        _SeedIngr('tomato', 'Tomato', qty: 1),
      ],
      steps: [
        _SeedStep(1, 'Preheat oven to 375°F. Spread chips on a baking sheet.'),
        _SeedStep(2, 'Top with black beans, sliced jalapeños, and shredded cheese.'),
        _SeedStep(3, 'Bake 10–12 minutes until cheese melts. Top with sour cream, avocado, and diced tomato.'),
      ],
    ),
    _SeedRecipe(
      title: 'Hot Dogs',
      servings: 4,
      instructions: 'Classic grilled hot dogs in soft buns with your choice of toppings.',
      ingredients: [
        _SeedIngr('sausage', 'Hot dogs', qty: 8),
        _SeedIngr('hot_dog_buns', 'Hot dog buns', qty: 8),
        _SeedIngr('ketchup', 'Ketchup'),
        _SeedIngr('mustard', 'Mustard'),
        _SeedIngr('onion', 'Onion', qty: 0.5),
      ],
      steps: [
        _SeedStep(1, 'Grill or pan-fry hot dogs over medium heat until heated through with light char marks.'),
        _SeedStep(2, 'Place in buns and serve with ketchup, mustard, and diced onion.'),
      ],
    ),
    _SeedRecipe(
      title: 'Salmon',
      servings: 2,
      instructions: 'Pan-seared salmon fillets with lemon butter and herbs.',
      ingredients: [
        _SeedIngr('salmon', 'Salmon fillets', qty: 2),
        _SeedIngr('butter', 'Butter', qty: 2, unit: 'tbsp'),
        _SeedIngr('garlic', 'Garlic', qty: 2, unit: 'cloves'),
        _SeedIngr('lemon', 'Lemon', qty: 1),
        _SeedIngr('salt', 'Salt', qty: 0.5, unit: 'tsp'),
        _SeedIngr('black_pepper', 'Black pepper', qty: 0.25, unit: 'tsp'),
        _SeedIngr('olive_oil', 'Olive oil', qty: 1, unit: 'tbsp'),
      ],
      steps: [
        _SeedStep(1, 'Pat salmon dry; season with salt and pepper on both sides.'),
        _SeedStep(2, 'Sear skin-side down in olive oil over medium-high heat for 4 minutes. Flip and cook 2 more minutes.'),
        _SeedStep(3, 'Add butter and garlic to pan; baste salmon 1 minute. Serve with lemon wedges.'),
      ],
    ),
    _SeedRecipe(
      title: 'Tilapia',
      servings: 4,
      instructions: 'Oven-baked tilapia with paprika, garlic, and lemon butter.',
      ingredients: [
        _SeedIngr('tilapia', 'Tilapia fillets', qty: 4),
        _SeedIngr('butter', 'Butter', qty: 3, unit: 'tbsp'),
        _SeedIngr('garlic', 'Garlic', qty: 2, unit: 'cloves'),
        _SeedIngr('lemon', 'Lemon', qty: 1),
        _SeedIngr('paprika', 'Paprika', qty: 1, unit: 'tsp'),
        _SeedIngr('salt', 'Salt', qty: 0.5, unit: 'tsp'),
        _SeedIngr('black_pepper', 'Black pepper', qty: 0.25, unit: 'tsp'),
      ],
      steps: [
        _SeedStep(1, 'Preheat oven to 400°F. Melt butter with garlic and lemon juice.'),
        _SeedStep(2, 'Place tilapia on a baking sheet. Brush with lemon butter; sprinkle with paprika, salt, and pepper.'),
        _SeedStep(3, 'Bake 12–15 minutes until fish flakes easily with a fork.'),
      ],
    ),
    _SeedRecipe(
      title: 'Shrimp Alfredo',
      servings: 4,
      instructions: 'Plump shrimp in a rich creamy alfredo sauce tossed with fettuccine.',
      ingredients: [
        _SeedIngr('shrimp', 'Shrimp (peeled & deveined)', qty: 1, unit: 'lb'),
        _SeedIngr('pasta', 'Fettuccine', qty: 12, unit: 'oz'),
        _SeedIngr('heavy_cream', 'Heavy cream', qty: 1, unit: 'cup'),
        _SeedIngr('butter', 'Butter', qty: 3, unit: 'tbsp'),
        _SeedIngr('garlic', 'Garlic', qty: 3, unit: 'cloves'),
        _SeedIngr('mozzarella', 'Parmesan or mozzarella', qty: 0.75, unit: 'cup'),
        _SeedIngr('salt', 'Salt', qty: 0.5, unit: 'tsp'),
        _SeedIngr('black_pepper', 'Black pepper', qty: 0.25, unit: 'tsp'),
      ],
      steps: [
        _SeedStep(1, 'Cook pasta in salted water until al dente; drain and reserve pasta water.'),
        _SeedStep(2, 'Sauté shrimp in 1 tbsp butter with garlic; cook 2 minutes per side. Remove.'),
        _SeedStep(3, 'Add remaining butter and cream; simmer 3 minutes, stir in cheese until melted.'),
        _SeedStep(4, 'Toss pasta in sauce, top with shrimp, and serve immediately.'),
      ],
    ),
  ];

  @override
  Stream<List<domain.Recipe>> watchRecipes() {
    return db.select(db.recipes).watch().map(
          (rows) => rows
              .map(
                (r) => domain.Recipe(
                  id: r.id,
                  title: r.title,
                  servings: r.servings,
                  instructions: r.instructions,
                ),
              )
              .toList(),
        );
  }

  @override
  Stream<domain.Recipe?> watchRecipe(String id) {
    return (db.select(db.recipes)..where((t) => t.id.equals(id))).watchSingleOrNull().asyncMap((row) async {
      if (row == null) return null;
      return _toDomainRecipe(row);
    });
  }

  @override
  Future<domain.Recipe?> getRecipe(String id) async {
    final row = await (db.select(db.recipes)..where((t) => t.id.equals(id))).getSingleOrNull();
    if (row == null) return null;
    return _toDomainRecipe(row);
  }

  @override
  Future<void> addRecipe(domain.Recipe recipe) async {
    await db.transaction(() async {
      await db.into(db.recipes).insert(
        RecipesCompanion.insert(
          id: recipe.id,
          title: recipe.title,
          servings: Value(recipe.servings),
          instructions: recipe.instructions,
          createdAt: DateTime.now().millisecondsSinceEpoch,
          updatedAt: DateTime.now().millisecondsSinceEpoch,
        ),
      );
      await _saveRecipeRelations(recipe);
    });
  }

  @override
  Future<void> updateRecipe(domain.Recipe recipe) async {
    await db.transaction(() async {
      await (db.update(db.recipes)
            ..where((t) => t.id.equals(recipe.id)))
          .write(
        RecipesCompanion(
          id: Value(recipe.id),
          title: Value(recipe.title),
          servings: Value(recipe.servings),
          instructions: Value(recipe.instructions),
          updatedAt: Value(DateTime.now().millisecondsSinceEpoch),
        ),
      );
      await (db.delete(db.recipeIngredients)..where((t) => t.recipeId.equals(recipe.id))).go();
      await (db.delete(db.ingredientSubstitutes)..where((t) => t.recipeId.equals(recipe.id))).go();
      await (db.delete(db.recipeSteps)..where((t) => t.recipeId.equals(recipe.id))).go();
      await _saveRecipeRelations(recipe);
    });
  }

  @override
  Future<void> deleteRecipe(String id) async {
    await (db.delete(db.recipes)..where((t) => t.id.equals(id))).go();
  }

  @override
  Future<void> seedSampleRecipes() async {
    final existing = await db.select(db.recipes).get();
    final existingTitles = existing.map((r) => r.title.toLowerCase()).toSet();

    for (final seed in _sampleRecipes) {
      if (existingTitles.contains(seed.title.toLowerCase())) continue;

      final recipeId = const Uuid().v4();
      final now = DateTime.now().millisecondsSinceEpoch;

      await db.transaction(() async {
        await db.into(db.recipes).insert(RecipesCompanion.insert(
          id: recipeId,
          title: seed.title,
          servings: Value(seed.servings),
          instructions: seed.instructions,
          createdAt: now,
          updatedAt: now,
        ));

        for (var i = 0; i < seed.ingredients.length; i++) {
          final ing = seed.ingredients[i];
          await db.into(db.recipeIngredients).insert(
            RecipeIngredientsCompanion.insert(
              id: const Uuid().v4(),
              recipeId: recipeId,
              ingredientKey: ing.key,
              displayName: ing.name,
              quantity: Value(ing.qty),
              unit: Value(ing.unit),
              sortOrder: i,
            ),
          );
        }

        for (var i = 0; i < seed.steps.length; i++) {
          final step = seed.steps[i];
          await db.into(db.recipeSteps).insert(
            RecipeStepsCompanion.insert(
              id: const Uuid().v4(),
              recipeId: recipeId,
              stepNumber: step.num,
              instruction: step.instruction,
              sortOrder: i,
            ),
          );
        }
      });
    }
  }

  Future<void> _saveRecipeRelations(domain.Recipe recipe) async {
    for (final ingredient in recipe.ingredients) {
      final ingredientId = ingredient.id;
      await db.into(db.recipeIngredients).insert(
        RecipeIngredientsCompanion.insert(
          id: ingredientId,
          recipeId: recipe.id,
          ingredientKey: ingredient.ingredientKey,
          displayName: ingredient.displayName,
          quantity: Value(ingredient.quantity),
          unit: Value(ingredient.unit),
          note: Value(ingredient.note),
          sortOrder: ingredient.sortOrder,
        ),
      );

      for (final substitute in ingredient.substitutes) {
        await db.into(db.ingredientSubstitutes).insert(
          IngredientSubstitutesCompanion.insert(
            id: substitute.id,
            recipeId: recipe.id,
            recipeIngredientId: ingredientId,
            substituteIngredientKey: substitute.substituteIngredientKey,
            substituteDisplayName: substitute.substituteDisplayName,
            quantity: Value(substitute.quantity),
            unit: Value(substitute.unit),
            note: Value(substitute.note),
            sortOrder: substitute.sortOrder,
          ),
        );
      }
    }

    for (final step in recipe.steps) {
      await db.into(db.recipeSteps).insert(
        RecipeStepsCompanion.insert(
          id: step.id,
          recipeId: recipe.id,
          sectionName: Value(step.sectionName),
          stepNumber: step.stepNumber,
          instruction: step.instruction,
          timerMinutes: Value(step.timerMinutes),
          sortOrder: step.sortOrder,
        ),
      );
    }
  }

  Future<domain.Recipe> _toDomainRecipe(Recipe row) async {
    final ingredients = await (db.select(db.recipeIngredients)
          ..where((t) => t.recipeId.equals(row.id)))
        .get();
    final steps = await (db.select(db.recipeSteps)
          ..where((t) => t.recipeId.equals(row.id)))
        .get();

    final ingredientModels = <domain_ingredient.RecipeIngredient>[];
    for (final ingredient in ingredients) {
      final substitutes = await (db.select(db.ingredientSubstitutes)
            ..where((t) => t.recipeIngredientId.equals(ingredient.id)))
          .get();
      ingredientModels.add(
        domain_ingredient.RecipeIngredient(
          id: ingredient.id,
          recipeId: ingredient.recipeId,
          ingredientId: ingredient.ingredientId,
          ingredientKey: ingredient.ingredientKey,
          displayName: ingredient.displayName,
          quantity: ingredient.quantity,
          unit: ingredient.unit,
          note: ingredient.note,
          sortOrder: ingredient.sortOrder,
          substitutes: substitutes
              .map(
                (sub) => domain_ingredient.RecipeIngredientSubstitute(
                  id: sub.id,
                  recipeIngredientId: sub.recipeIngredientId,
                  substituteIngredientKey: sub.substituteIngredientKey,
                  substituteDisplayName: sub.substituteDisplayName,
                  quantity: sub.quantity,
                  unit: sub.unit,
                  note: sub.note,
                  sortOrder: sub.sortOrder,
                ),
              )
              .toList(),
        ),
      );
    }

    return domain.Recipe(
      id: row.id,
      title: row.title,
      servings: row.servings,
      instructions: row.instructions,
      ingredients: ingredientModels,
      steps: steps
          .map(
            (step) => domain_step.RecipeStep(
              id: step.id,
              recipeId: step.recipeId,
              sectionName: step.sectionName,
              stepNumber: step.stepNumber,
              instruction: step.instruction,
              timerMinutes: step.timerMinutes,
              sortOrder: step.sortOrder,
            ),
          )
          .toList(),
    );
  }
}

class _SeedIngr {
  final String key;
  final String name;
  final double? qty;
  final String? unit;

  const _SeedIngr(this.key, this.name, {this.qty, this.unit});
}

class _SeedStep {
  final int num;
  final String instruction;

  const _SeedStep(this.num, this.instruction);
}

class _SeedRecipe {
  final String title;
  final double servings;
  final String instructions;
  final List<_SeedIngr> ingredients;
  final List<_SeedStep> steps;

  const _SeedRecipe({
    required this.title,
    required this.servings,
    required this.instructions,
    required this.ingredients,
    required this.steps,
  });
}