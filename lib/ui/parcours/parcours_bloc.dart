import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mon_site_cv/domain/entity/parcours.dart';
import 'package:mon_site_cv/ui/parcours/parcours_event.dart';
import 'package:mon_site_cv/ui/parcours/parcours_interactor.dart';
import 'package:mon_site_cv/ui/parcours/parcours_state.dart';

class ParcoursBloc extends Bloc<ParcoursEvent, ParcoursState> {
  final ParcoursInteractor parcoursInteractor;

  ParcoursBloc(this.parcoursInteractor) : super(ParcoursSignUpInitialState()) {
    on<ParcoursEvent>((event, emit) async {
      if (event is ParcoursSignUpEvent) {
        emit(ParcoursSignUpLoadingState());
        try {
          final parcours = Parcours(
            id: event.id,
            title: event.title,
            text: event.text,
          );
          await parcoursInteractor.addAvisClients(parcours);
          emit(ParcoursSignUpSuccessState(parcoursId: event.id));
        } catch (error) {
          emit(ParcoursSignUpErrorState(error.toString()));
        }
      }
    });
  }
}
