class StoreLocation {
  late final String slug;
  late final String name;

  StoreLocation({required this.slug, required this.name});

  Map<String, dynamic> toJson() =>
      {
        'name': name,
        'slug': slug,
      };
}