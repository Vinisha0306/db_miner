class Quotes {
  int id;
  String text;
  String author;
  String category;
  String image;

  Quotes({
    required this.id,
    required this.text,
    required this.author,
    required this.category,
    this.image =
        'https://i.pinimg.com/564x/50/d5/f4/50d5f4e6d5656c0bbc57c0c32e90b6b5.jpg',
  });

  factory Quotes.fromJson(Map<String, dynamic> json) => Quotes(
        id: json["id"],
        text: json["text"],
        author: json["author"],
        category: json["category"],
        image: json["image"] ??
            "https://i.pinimg.com/564x/50/d5/f4/50d5f4e6d5656c0bbc57c0c32e90b6b5.jpg",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "text": text,
        "author": author,
        "category": category,
        "image": image,
      };
}
