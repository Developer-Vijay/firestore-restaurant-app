class CategoriesFood {
  String title;
  String image;
  int index;

  CategoriesFood({this.image, this.title, this.index});
}

List<CategoriesFood> categoriesData = [
  CategoriesFood(
      image:
          "https://media.gettyimages.com/photos/burger-with-french-fries-picture-id1211425123?k=6&m=1211425123&s=612x612&w=0&h=TTc0b9eNLNPk3uYgyIYlDTsb1aRJsO9z6qyEvN6jG2I=",
      title: "Burgers",
      index: 0),
  CategoriesFood(
      image:
          "https://media.gettyimages.com/photos/high-angle-view-of-butter-chicken-curry-picture-id679705476?k=6&m=679705476&s=612x612&w=0&h=onauzlUeiwOEeZeZS5J-qHZ92MQ6eUhH2QfFeNQCxZg=",
      title: "North Indian",
      index: 1),
  CategoriesFood(
      image:
          "https://media.gettyimages.com/photos/dosa-with-curry-dahal-and-coconut-chutney-picture-id1058909176?k=6&m=1058909176&s=612x612&w=0&h=6LG39NuPRpCDfYJGKCs6bq3v5adpv3UGMtBSrqxKKT0=",
      title: "South Indian",
      index: 2),
  CategoriesFood(
      image:
          "https://media.gettyimages.com/photos/shanghai-style-meat-dumplings-picture-id640354996?k=6&m=640354996&s=612x612&w=0&h=nZl3b0YziXgULOjUB9NTjIyzcv6f0ikzONgDbi-YshQ=",
      title: "Chinese",
      index: 3)
];

List<CategoriesFood> popularData = [
  CategoriesFood(
      image:
          "https://media.gettyimages.com/photos/closeup-of-stack-against-black-background-picture-id1208752640?k=6&m=1208752640&s=612x612&w=0&h=IZ9XenTrKEp-6KVS-nRatwtWWtnF6dbOmxX6fUxKNjs=",
      index: 0,
      title: "Burgers"),
  CategoriesFood(
      image:
          "https://media.gettyimages.com/photos/high-angle-view-of-chole-bhature-served-on-table-in-restaurant-picture-id707558035?k=6&m=707558035&s=612x612&w=0&h=4-5Uro7jxIj45JZ2C02c1nAsFsLqjqjRfL4RX5RbS6w=",
      index: 1,
      title: "Chole Bhature")
];

class OfferRestaurants {
  String image;
  String title;
  String subtitle;
  String vegSymbol;
  String rating;
  String offertitle;
  String offerPercentage;
  String priceForOne;

  OfferRestaurants(
      {this.image,
      this.offerPercentage,
      this.offertitle,
      this.priceForOne,
      this.rating,
      this.subtitle,
      this.title,
      this.vegSymbol});
}
