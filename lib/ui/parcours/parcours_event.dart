abstract class ParcoursEvent {}

class ParcoursSignUpEvent extends ParcoursEvent {
  final String id;
  final String title;
  final String text;
  final Function navigateToAccount;

  ParcoursSignUpEvent({
    required this.id,
    required this.title,
    required this.text,
    required this.navigateToAccount,
  });
}
