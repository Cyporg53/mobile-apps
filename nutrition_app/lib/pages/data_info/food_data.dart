// add the list of all foods with their calories and images here
class FoodData {
  static Map<String, String> foodsWithImages = {
    'Naan':
        'https://hips.hearstapps.com/hmg-prod/images/211021-delish-seo-naan-horizontal-0128-eb-1635447725.jpg?crop=0.8896296296296295xw:1xh;center,top&resize=1200:*',
    'Palak Paneer':
        'https://shwetainthekitchen.com/wp-content/uploads/2023/02/Palak-paneer.jpg',
    'Vegetable Koorma':
        'https://myfoodstory.com/wp-content/uploads/2019/06/tastiest-vegetable-korma-curry-3.jpg',
    'Daal':
        'https://www.thespruceeats.com/thmb/_6NGaiLW2fW-mVKfB6bUlV-glr0=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/masala-daal-recipe-1957965_hero_01-d2db7c3935a0402396442d8703ae7ed6.jpg',
    'Samosa':
        'https://hips.hearstapps.com/hmg-prod/images/delish-091621-samosas-04-jg-1632847515.jpg?crop=0.888671875xw:1xh;center,top&resize=1200:*',
    'Lime Pickle':
        'https://chefsmandala.com/wp-content/uploads/2018/04/Indian-Lemon-Pickle.jpg',
    'Mango Pickle':
        'https://aahaaramonline.com/wp-content/uploads/2021/05/Avakai_Andhra_Mango_and_Mustard_Pickle-500x500.png',
    'Vegetable Biryani':
        'https://www.indianveggiedelight.com/wp-content/uploads/2020/04/veg-biryani-instant-pot.jpg',
    'Aloo Gobi':
        'https://niksharmacooks.com/wp-content/uploads/2022/11/AlooGobiDSC_5234.jpg',
    'Pav Bhaji':
        'https://www.cubesnjuliennes.com/wp-content/uploads/2020/07/Instant-Pot-Mumbai-Pav-Bhaji-Recipe.jpg',
    'Chole Bhature':
        'https://masalaandchai.com/wp-content/uploads/2021/02/Chole-Bhature.jpg',
    'Tamarind Rice':
        'https://www.saveur.com/uploads/2022/01/21/Tamarind-rice-india-saveur-linda-pugliese.jpg?auto=webp&auto=webp&optimize=high&quality=70&width=1440',
    'Paratha':
        'https://holycowvegan.net/wp-content/uploads/2023/03/paratha-recipe-12.jpg',
    'Chapati':
        'https://www.tasteofhome.com/wp-content/uploads/2018/01/Chapati-Breads_EXPS_FT20_136906_F_0721_1-2.jpg',
    'Raita':
        'https://www.cookrepublic.com/wp-content/uploads/2021/03/indian-raita-bowl.jpg',
  };

  static Map<String, int> foodWithCalories = {
    // MUST MANUALLY add food and corresponding calories b/c no API exists :-(
    'Naan': 78,
    'Palak Paneer': 350,
    'Vegetable Koorma': 330,
    'Daal': 264,
    'Samosa': 260,
    'Lime Pickle': 70,
    'Mango Pickle': 60,
    'Vegetable Biryani': 550,
    'Aloo Gobi': 330,
    'Pav Bhaji': 600,
    'Chole Bhature': 450,
    'Tamarind Rice': 415,
    'Paratha': 80,
    'Chapati': 27,
    'Raita': 112
  };
}
