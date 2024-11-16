import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

extension CustomExtension<NotifierT extends StateNotifier<StateT>, StateT> on StateNotifierProvider<NotifierT, StateT> {
  /// Create a widget that watches the state provided by [StateNotifierProvider] and rebuilds when it changes.
  /// This extension simplifies the process of watching the provider's state and building widgets based on its value.
  ///
  /// ```dart
  /// myStateProvider.watch((value) {
  ///   return Text('Generated: ${value.randomName}');
  /// })
  /// ```

  Widget watch(
    Widget Function(StateT value) builder,
  ) {
    return Consumer(
      builder: (context, ref, _) {
        final value = ref.watch(this);
        return builder(value);
      },
    );
  }
}

extension AutoDisposeStateNotifierProviderExtension<T> on AutoDisposeStateNotifierProvider<StateNotifier<T>, T> {
  /// This extension is used to watch the state of an AutoDisposeStateNotifierProvider
  ///
  /// ``` dart
  /// myAutoDisposeProvider.watch((value){
  ///   return value.when(
  ///     data: (data) => ListWidget(data),
  ///     loading: () => LoadingWidget(),
  ///     error: (error, stack) => ErrorWidget(error),
  ///   );
  /// })
  /// ```
  ///

  Widget watch(Widget Function(T value) builder) {
    return Consumer(
      builder: (context, ref, _) {
        final asyncData = ref.watch(this);
        return builder(asyncData);
      },
    );
  }
}

extension StateNotifierProviderExtension<T, N extends StateNotifier<T>> on StateNotifierProvider<N, T> {
  Widget consume(Function(WidgetRef ref, StateNotifierProvider<StateNotifier<T>, T> p, N notifier) builder) {
    return Consumer(
      builder: (context, ref, _) {
        final notifier = ref.read(this.notifier);
        return builder(ref, this, notifier);
      },
    );
  }

  Widget watchOn<R>(R Function(T) listen, Widget Function(R value, N notifier) builder) {
    return Consumer(
      builder: (context, ref, _) {
        final asyncData = ref.watch(select((value) => listen(value)));
        final notifier = ref.read(this.notifier);
        return builder(asyncData, notifier);
      },
    );
  }
}

extension AutoDisposeStateNotifierProviderExtension2<T, N extends StateNotifier<T>>
    on AutoDisposeStateNotifierProvider<N, T> {
  Widget watchX(Widget Function(T value, N notifier) builder) {
    return Consumer(
      builder: (context, ref, _) {
        final asyncData = ref.watch(this);
        final notifier = ref.read(this.notifier);
        return builder(asyncData, notifier);
      },
    );
  }

  Widget watchOn<R>(R Function(T) listen, Widget Function(R value, N notifier) builder) {
    return Consumer(
      builder: (context, ref, _) {
        final asyncData = ref.watch(select((value) => listen(value)));
        final notifier = ref.read(this.notifier);
        return builder(asyncData, notifier);
      },
    );
  }

  /// Extension for consuming an AutoDisposeStateNotifierProvider within a Consumer widget.
  ///
  /// This extension simplifies the usage of AutoDisposeStateNotifierProvider within a Consumer widget
  /// by providing a method called `consume`. This method allows you to access the provider
  /// within the context of a Consumer widget and use it to access its state and provide updates to the UI.
  ///
  /// Example usage:
  /// ```dart
  /// homeStateProvider.consume((ref, provider) {
  ///   final title = ref.watch(provider.select((value) => value.title));
  ///   return Text(title ?? '-');
  /// })
  /// ```
  ///
  /// Parameters:
  /// - `builder`: A function that takes two parameters:
  ///   - `ref`: A WidgetRef object that provides access to watch and read providers within the Consumer.
  ///   - `p`: An AutoDisposeStateNotifierProvider<StateNotifier<T>, T> object, representing the provider to consume.
  ///
  /// Returns a Widget.
  ///
  Widget consume(Function(WidgetRef ref, AutoDisposeStateNotifierProvider<StateNotifier<T>, T> p, N notifier) builder) {
    return Consumer(
      builder: (context, ref, _) {
        final notifier = ref.read(this.notifier);
        return builder(ref, this, notifier);
      },
    );
  }
}

extension AutoDisposeStateNotifierProviderFamilyExtension<T, N extends StateNotifier<T>, P>
    on AutoDisposeStateNotifierProviderFamily<N, T, P> {
  Widget watchX(P param, Widget Function(T value, N notifier) builder) {
    return Consumer(
      builder: (context, ref, _) {
        final asyncData = ref.watch(this(param));
        final N notifier = ref.read(this(param).notifier);
        return builder(asyncData, notifier);
      },
    );
  }
}