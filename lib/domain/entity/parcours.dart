class Parcours {
  final String id;
  final String title;
  final String text;

  Parcours({required this.id, required this.title, required this.text});

  factory Parcours.fromMap(Map<String, dynamic>? data, String id) {
    return Parcours(
      id: id,
      title: data?['title'] ?? '',
      text: data?['text'] ?? '',
    );
  }
}
