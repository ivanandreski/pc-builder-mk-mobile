class StoreLocation {
  late final String slug;
  late final String name;
  late final double longitude;
  late final double latitude;

  StoreLocation({required this.slug, required this.name, required this.longitude, required this.latitude});

  Map<String, dynamic> toJson() =>
      {
        'name': name,
        'slug': slug,
        'longitude': longitude,
        'latitude': latitude
      };
}