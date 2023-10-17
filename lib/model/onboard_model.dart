class OnboardModel {

 final String image;
 final String title;
 final String description;


  OnboardModel(
     { required this.image,
       required this.title,
       required this.description
       }
  );
}


final List<OnboardModel> onboard_data=[

 OnboardModel(image: 'images/onboard1.png',
     title: 'Want to eat\nHealthy Food?',
     description: "Nuor's recipes helps you prepare healthy meals based of your favorites."),

 OnboardModel(image: 'images/onboard2.png',
     title: 'Find healthy\nrecipes!',
     description: 'Search through thousands of healthy recipes from around the world.'),

 OnboardModel(image: 'images/onboard3.png',
     title: "And that's the\ncherry on top!",
     description: 'No food restrictions, and you can maintain, plan, enjoy, and stick to a healthy diet while eating your favourite delicious healthy foods that you want.'),

];