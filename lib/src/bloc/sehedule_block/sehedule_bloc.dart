import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'sehedule_event.dart';
part 'sehedule_state.dart';

class SeheduleBloc extends Bloc<SeheduleEvent, SeheduleState> {
  SeheduleBloc() : super(SeheduleInitial()) {
    on<SeheduleEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
