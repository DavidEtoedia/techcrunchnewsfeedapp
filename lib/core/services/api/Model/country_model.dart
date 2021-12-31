class Country {
  final String? country;
  final String? countryId;
  final int? value;

  Country(this.country, this.countryId, this.value);
}

final List<Country> country = [
  Country("United State", "us", 1),
  Country("United Kingdom", "gb", 2),
  Country("Canada", "ca", 3),
  Country("Germany", "de", 4),
];
