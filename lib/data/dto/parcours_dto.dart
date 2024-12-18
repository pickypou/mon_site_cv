class ParcoursDto {
  final String id;
  final String title;
  final String text;

  ParcoursDto({
    required this.id,
    required this.title,
    required this.text,
  });

  factory ParcoursDto.fromJson(Map<String, dynamic> json) {
    return ParcoursDto(
      id: json['id'],
      title: json['title'],
      text: json['text'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'text': text,
    };
  }

  @override
  String toString() {
    return 'AvisClientsDto{id: $id, title: $title, text: $text}';
  }
}
