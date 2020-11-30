import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

abstract class BlockBase<Event, State> {
  final PublishSubject<Event> eventSubject = PublishSubject<Event>();
  BehaviorSubject<State> stateSubject;

  State get initialState;

  State get currentState => stateSubject.value;

  Stream<State> get state => stateSubject.stream;

  BlockBase() {
    stateSubject = BehaviorSubject<State>.seeded(initialState);
    bindStateSubject();
  }

  @mustCallSuper
  void dispose() {
    eventSubject.close();
    stateSubject.close();
  }

  void onError(Object err, StackTrace stackTrace) => null;

  void onEvent(Event event) => null;

  void dispatch(Event event) {
    try {
      eventSubject.sink.add(event);
    } catch (error) {
      handlerError(error);
    }
  }

  Stream<State> mapEventToState(Event event);

  void bindStateSubject() {
    transform(eventSubject, (Event event) {
      return mapEventToState(event).handleError(handlerError);
    }).forEach((State nextState) {
      if (currentState == nextState || stateSubject.isClosed) {
        return;
      }
      stateSubject.sink.add(nextState);
    });
  }

  void handlerError(Object err, [StackTrace stackTrace]) {
    onError(err, stackTrace);
  }

  Stream<State> transform(
      Stream<Event> events, Stream<State> next(Event event)) {
    return events.asyncExpand(next);
  }
}
