# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Item.delete_all
Category.delete_all
Provider.delete_all
Source.delete_all


sources = Source.create([
    { name: 'Groceries online',
      description: "We believe ordering groceries online is generally the healthiest easy choice; if you have good food in the fridge, you'll be less tempted by bad options when you're hungry."},
    { name: 'Order in'},
    { name: 'Eat out'},
    { name: 'Store'},
    { name: 'Farmers’ market',
      description: "Farmers' markets are great sources of the freshest food, and can provide unpasteurised dairy options not available elsewhere. (We do not recommend unpasteurised dairy if you are pregnant or immune-impaired.)"}
  ])

ocado = Provider.create(name: 'Ocado', website: "http://www.ocado.com")
laverstokepark = Provider.create(name: 'Laverstoke Park Farm', website: "http://www.laverstokepark.co.uk")
sources.first.providers << ocado
sources.first.providers << laverstokepark

categories = Category.create([
  { name: 'Vegetables'},
  { name: 'Dairy'},
  { name: 'Eggs'},
  { name: 'Fish'},
  { name: 'Meat'},
  { name: 'Nuts'},
  { name: 'Oils and fats'}])

categories.each do |c|
  c.providers << ocado
end
categories.third.providers << laverstokepark

organic_veg_tooltip = "Organic vegetables contain fewer potentially harmful chemicals"
organic_dairy_tooltip = "Grass-fed organic dairy products generally have higher omega-3 content and fewer potentially harmful chemicals"

items = Item.create([
  { name: 'Asparagus', 
    link: "http://www.ocado.com/webshop/product/Ocado-Asparagus/62195011", 
    tooltip: organic_veg_tooltip, 
    cooking_link: "http://www.bbc.co.uk/food/techniques/how_to_cook_asparagus", 
    category_id: categories.first.id, 
    provider_id: ocado.id},  
  { name: 'Broccoli', 
    link: "http://www.ocado.com/webshop/product/Organic-Broccoli-Waitrose/23770011", 
    tooltip: organic_veg_tooltip, 
    cooking_link: "http://www.bbc.co.uk/food/broccoli", 
    category_id: categories.first.id, 
    provider_id: ocado.id},
  { name: 'Carrots', 
    link: "http://www.ocado.com/webshop/product/Ocado-Organic-Carrots/65353011", 
    tooltip: organic_veg_tooltip, 
    cooking_link: "http://paleogrubs.com/roasted-carrots", 
    category_id: categories.first.id, 
    provider_id: ocado.id},
  { name: 'Lettuce', 
    link: "http://www.ocado.com/webshop/product/Organic-Little-Gems-British-Waitrose/26751011", 
    tooltip: organic_veg_tooltip, 
    cooking_link: nil, 
    category_id: categories.first.id, 
    provider_id: ocado.id},
  { name: 'Onions', 
    link: "http://www.ocado.com/webshop/product/Organic-Onions-Waitrose/18913011", 
    tooltip: organic_veg_tooltip, 
    cooking_link: "http://www.splendidtable.org/recipes/classic-oven-roasted-onions", 
    category_id: categories.first.id, 
    provider_id: ocado.id},
  { name: 'Spinach', 
    link: "http://www.ocado.com/webshop/product/Organic-Spinach-Waitrose/25256011", 
    tooltip: organic_veg_tooltip, 
    cooking_link: "http://www.foodnetwork.com/recipes/ina-garten/garlic-sauteed-spinach-recipe.html", 
    category_id: categories.first.id, 
    provider_id: ocado.id},
  { name: 'Butter', 
    link: "http://www.ocado.com/webshop/product/Rachels-Organic-Butter/23610011", 
    tooltip: organic_dairy_tooltip, 
    cooking_link: nil, 
    category_id: categories.second.id, 
    provider_id: ocado.id},
  { name: 'Cheese', 
    link: "http://www.ocado.com/webshop/product/Duchy-From-Waitrose-Organic-Farmhouse-Cheddar/46066011",
    tooltip: organic_dairy_tooltip, 
    cooking_link: nil, 
    category_id: categories.second.id, 
    provider_id: ocado.id},
  { name: 'Cream', 
    link: "http://www.ocado.com/webshop/product/Yeo-Valley-Organic-Double-Cream/27251011", 
    tooltip: organic_dairy_tooltip, 
    cooking_link: nil, 
    category_id: categories.second.id, 
    provider_id: ocado.id},
  { name: "Grass-fed organic cow's milk", 
    link: "http://www.ocado.com/webshop/product/Rachels-Organic-Fresh-Whole-Milk/26988011", 
    tooltip: organic_dairy_tooltip, 
    cooking_link: nil, 
    category_id: categories.second.id, 
    provider_id: ocado.id},
  { name: "Grass-fed buffalo milk", 
    link: "http://www.ocado.com/webshop/product/Laverstoke-Park-Buffalo-Milk-Unhomogenised/44179011", 
    tooltip: "Grass-fed buffalo milk generally has higher omega-3 content than cow's milk and lower carbohydrates", 
    cooking_link: nil, 
    category_id: categories.second.id, 
    provider_id: ocado.id},             
  { name: "Yoghurt", 
    link: "http://www.ocado.com/webshop/product/Yeo-Valley-Organic-Greek-Style-Natural-Yogurt/27866011",
    tooltip: organic_dairy_tooltip, 
    cooking_link: nil, 
    category_id: categories.second.id, 
    provider_id: ocado.id},
  { name: "Pastured eggs", 
    link: "http://www.laverstokepark.co.uk/from-the-dairy-eggs/laverstoke-park-farm/six-organic-free-range-dark-maran-eggs_ct589bd190pd1860.htm", 
    tooltip: "We think these have the best natural omega 3 to omega 6 ratio (not from flaxseed supplements), raised with the environment and diet that they would naturally prefer and producing fewer eggs per year than most commercial flocks.", 
    cooking_link: "http://recipes.sparkpeople.com/recipe-detail.asp?recipe=1725001", 
    category_id: categories.third.id, 
    provider_id: laverstokepark.id},
  { name: "Organic eggs", 
    link: "http://www.ocado.com/webshop/product/Duchy-From-Waitrose-Organic-Free-Range-Medium-Eggs/21465011", 
    tooltip: "Organic eggs contain fewer potentially harmful chemicals.", 
    cooking_link: "http://recipes.sparkpeople.com/recipe-detail.asp?recipe=1725001", 
    category_id: categories.third.id, 
    provider_id: ocado.id},
  { name: "Wild-caught salmon", 
    link: "http://www.ocado.com/webshop/product/2-Wild-Alaskan-Sockeye-Salmon-Fillets-Waitrose/33848011",
    tooltip: "Wild-caught salmon has higher ratios of omega-3 and probably fewer infections because farmed salmon do not consume their natural diet and live in close proximity.", 
    cooking_link: "http://www.foodnetwork.com/recipes/giada-de-laurentiis/salmon-baked-in-foil-recipe.html", 
    category_id: categories.fourth.id, 
    provider_id: ocado.id},          
  { name: "Grass-fed lamb", 
    link: "http://www.ocado.com/webshop/product/Duchy-From-Waitrose-Organic-Half-Leg-of-Lamb/23542011", 
    tooltip: "Grass-fed organic lamb is raised on its natural diet.  It has higher levels of omega 3 and fewer potentially harmful chemicals.", 
    cooking_link: "http://www.bbcgoodfood.com/recipes/1094/sevenhour-lamb", 
    category_id: categories.fifth.id, 
    provider_id: ocado.id},        
  { name: "Grass-fed beef", 
    link: "http://www.ocado.com/webshop/product/Laverstoke-Park-Organic-Beef-Roasting-Joint/64839011", 
    tooltip: "Grass-fed organic beef is raised on its natural diet.  It has higher levels of omega 3 and fewer potentially harmful chemicals.", 
    cooking_link: "http://www.jamieoliver.com/recipes/beef-recipes/perfect-roast-beef/", 
    category_id: categories.fifth.id, 
    provider_id: ocado.id},   
  { name: "Organic cashew nuts", 
    link: "http://www.ocado.com/webshop/product/Tree-of-Life-Organic-Whole-Cashews/245711011", 
    tooltip: "Cashew nuts in moderation contain healthy fats and other nutrients.", 
    cooking_link: nil, 
    category_id: Category.find_by_name("Nuts").id, 
    provider_id: ocado.id},  
  { name: "Organic cashew nuts", 
    link: "http://www.ocado.com/webshop/product/Organic-Hazelnuts-Waitrose-Love-Life/25090011", 
    tooltip: "Hazelnuts in moderation contain healthy fats and other nutrients.", 
    cooking_link: nil, 
    category_id: Category.find_by_name("Nuts").id, 
    provider_id: ocado.id}, 
  { name: "Organic walnuts", 
    link: "http://www.ocado.com/webshop/product/Organic-Walnuts-Waitrose-Love-Life/27952011", 
    tooltip: "Walnuts in moderation contain healthy fats and other nutrients.", 
    cooking_link: nil, 
    category_id: Category.find_by_name("Nuts").id, 
    provider_id: ocado.id},        
  { name: "Organic coconut oil", 
    link: "http://www.ocado.com/webshop/product/Biona-Organic-Virgin-Coconut-Oil/51011011", 
    tooltip: "This is a great oil for cooking because the fat can tolerate high cooking temperatures without being damaged.", 
    cooking_link: nil, 
    category_id: categories.last.id, 
    provider_id: ocado.id},             
  { name: "Organic olive oil", 
    link: "http://www.ocado.com/webshop/product/Mr-Organic-Extra-Virgin-Olive-Oil/73529011", 
    tooltip: "Great for salad dressings; we do not recommend cooking with it because it is damaged by high temperature.  We believe coconut oil or clarified grass-fed butter (in moderation) are better for cooking.", 
    cooking_link: nil, 
    category_id: categories.last.id, 
    provider_id: ocado.id}
  ])  
      