import 'dart:ui';

import 'package:untitled1/utils/AppAssets.dart';
import 'package:untitled1/utils/AppColor.dart';

class OnboardingDM{
  String image;
  String title;
  String description;
  Color color;
  OnboardingDM({required this.image,required this.title,required this.description,required this.color});
  static List<OnboardingDM> onboardingList=[
    OnboardingDM(
        color: AppColor.black,
        image: AppAssets.avengers,
        title: "Find Your Next \nFavorite Movie Here",
        description: "Get access to a huge library of movies \nto suit all tastes. You will surely like it."
    ),
    OnboardingDM(
      color: Color(0xff084250),
        image: AppAssets.avengers,
        title: "Discover Movies",
        description: "Explore a vast collection of movies in \nall qualities and genres. Find your \nnext favorite film with ease."
    ),
    OnboardingDM(
        color: Color(0xff85210E),
        image: AppAssets.oppenheimer,
        title: "Explore All Genres",
        description: "Discover movies from every genre, in \nall available qualities. Find something \nnew and exciting to watch every day."
    ),
    OnboardingDM(
        color: Color(0xff4C2471),
        image: AppAssets.badBoys,
        title: "Create Watchlists",
        description: "Save movies to your watchlist to keep \ntrack of what you want to watch next. \nEnjoy films in various qualities and \ngenres."
    ),
    OnboardingDM(
        color: Color(0xff601321),
        image: AppAssets.doctorStrange,
        title: "Rate, Review, and Learn",
        description: "Share your thoughts on the movies \nyou've watched. Dive deep into film \ndetails and help others discover great \nmovies with your reviews."
    ),
    OnboardingDM(
        color: Color(0xff2A2C30),
        image: AppAssets.f1917,
        title: "Start Watching Now",
        description: ""
    )
  ];
}
