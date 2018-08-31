

class Activity {

  String name;
  String profilePicture;
  String id;

  String title;
  int newRate;
  int oldRate;
  List<Policy> policies;
  List<String> highlights;
  int totalRating;
  List<Review> reviews;




  /*get profilePictureUrl =>
      getMediumPictureUrl((profilePicture != null ? profilePicture : ""));

  Actor.fromJson(Map jsonMap)
      : character = jsonMap['character'],
        name = jsonMap['name'],
        profilePicture = jsonMap['profile_path'],
        id = jsonMap['id'];*/
}

class Policy{
  String id;
  String icon;
  String url;

}

class Review{
  String name;
  String date;
  int rating;
  String comment;
  String image;
}