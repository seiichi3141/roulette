import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'roulette_controller.freezed.dart';

@freezed
class RouletteState with _$RouletteState {
  const factory RouletteState.stop({
    required String title,
    @Default(0) double value,
  }) = RouletteStateStop;
  const factory RouletteState.running({
    required String title,
    required double value,
  }) = RouletteStateRunning;
}

final rouletteControllerProvider =
    StateNotifierProvider<RouletteController, RouletteState>(
        (ref) => RouletteController());

class RouletteController extends StateNotifier<RouletteState> {
  RouletteController()
      : super(RouletteState.stop(title: "GOLDEN SCORE DECISION CONTEST"));

  Timer? timer;

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void setValue(double value) {
    state = state.copyWith(value: value);
  }

  void start() {
    state = RouletteState.running(
      title: state.title,
      value: state.value,
    );

    // 12秒間ルーレットを回転する
    final seconds = 12;

    final valueListenable = ValueNotifier<double>(0);
    final animation = TweenSequence([
      // 1秒間のアニメーション
      TweenSequenceItem(
        tween: Tween(begin: 1.0, end: 0.5).chain(
          CurveTween(curve: Curves.easeOutCubic),
        ),
        weight: 0.5,
      ),
      TweenSequenceItem(
        tween: Tween(begin: 0.5, end: 1.0).chain(
          CurveTween(curve: Curves.easeInCubic),
        ),
        weight: 0.5,
      ),
      // 11秒間のアニメーション
      TweenSequenceItem(
        tween: Tween(begin: 0.0, end: 11.0).chain(
          CurveTween(curve: Curves.easeOutQuint),
        ),
        weight: 11,
      ),
    ]).animate(Animation.fromValueListenable(valueListenable));

    animation.addListener(() {
      state = RouletteState.running(
        title: state.title,
        value: animation.value - (animation.value ~/ 1),
      );
    });

    final tick = 1.0 / seconds / 60;
    timer = Timer.periodic(Duration(milliseconds: 1000 ~/ 60), (timer) {
      final newValue = valueListenable.value + tick;
      if (newValue >= 1) {
        timer.cancel();
        state = RouletteState.stop(
          title: state.title,
          value: state.value,
        );
        return;
      }
      valueListenable.value = newValue;
    });
  }

  void stop() {
    timer?.cancel();
    state = RouletteState.stop(
      title: state.title,
      value: state.value,
    );
  }
}
