class Shopping {
  late dynamic id, price;
  late String title, description, category, image;
  late Rating rating;

  Shopping(
      {required this.id,
      required this.price,
      required this.title,
      required this.description,
      required this.category,
      required this.image,
      required this.rating});

  factory Shopping.fromJson(Map m1) {
    return Shopping(
        id: m1['id'],
        price: m1['price'],
        title: m1['title'],
        description: m1['description'],
        category: m1['category'],
        image: m1['image'],
        rating: Rating.fromJson(m1['rating']));
  }
}

class Rating {
  late dynamic rate, count;

  Rating({required this.rate, required this.count});

  factory Rating.fromJson(Map m1) {
    return Rating(rate: m1['rate'], count: m1['count']);
  }
}
