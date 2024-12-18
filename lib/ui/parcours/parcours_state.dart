abstract class ParcoursState {
  const ParcoursState();
}

class ParcoursSignUpInitialState extends ParcoursState {}

class ParcoursSignUpLoadingState extends ParcoursState {}

class ParcoursSignUpSuccessState extends ParcoursState {
  final String parcoursId;
  ParcoursSignUpSuccessState({required this.parcoursId});
}

class ParcoursSignUpErrorState extends ParcoursState {
  final String error;
  ParcoursSignUpErrorState(this.error);
}
