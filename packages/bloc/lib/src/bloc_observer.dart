import 'package:meta/meta.dart';

import 'bloc.dart';
import 'change.dart';
import 'cubit.dart';
import 'transition.dart';

/// An interface for observing the behavior of [Bloc] and [Cubit] instances.
class BlocObserver {
  /// Called whenever a [Cubit] is instantiated.
  /// In many cases, a cubit may be lazily instantiated and
  /// [onCreate] can be used to observe exactly when the cubit
  /// instance is created.
  @protected
  @mustCallSuper
  void onCreate(Cubit cubit) {}

  /// Called whenever an [event] is `added` to any [bloc] with the given [bloc]
  /// and [event].
  @protected
  @mustCallSuper
  void onEvent(Bloc bloc, Object event) {}

  /// Called whenever a [Change] occurs in any [cubit]
  /// A [change] occurs when a new state is emitted.
  /// [onChange] is called before a cubit's state has been updated.
  @protected
  @mustCallSuper
  void onChange(Cubit cubit, Change change) {}

  /// Called whenever a transition occurs in any [bloc] with the given [bloc]
  /// and [transition].
  /// A [transition] occurs when a new `event` is `added` and `mapEventToState`
  /// executed.
  /// [onTransition] is called before a [bloc]'s state has been updated.
  @protected
  @mustCallSuper
  void onTransition(Bloc bloc, Transition transition) {}

  /// Called whenever an [error] is thrown in any [Bloc] or [Cubit].
  /// The [stackTrace] argument may be `null` if the state stream received
  /// an error without a [stackTrace].
  @protected
  @mustCallSuper
  void onError(Cubit cubit, Object error, StackTrace stackTrace) {}

  /// Called whenever a [Cubit] is closed.
  /// [onClose] is called just before the [Cubit] is closed
  /// and indicates that the particular instance will no longer
  /// emit new states.
  @protected
  @mustCallSuper
  void onClose(Cubit cubit) {}
}
