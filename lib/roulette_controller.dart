import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:roulette/providers.dart';

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
  const factory RouletteState.hit({
    required String title,
    required double value,
    required int hitIndex,
  }) = RouletteStateHit;
}

final rouletteControllerProvider =
    StateNotifierProvider<RouletteController, RouletteState>(
        (ref) => RouletteController(ref: ref));

class RouletteController extends StateNotifier<RouletteState> {
  RouletteController({required this.ref})
      : super(RouletteState.stop(title: "GOLDEN SCORE DECISION CONTEST"));

  Ref ref;
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

    final itemLength = ref.read(itemLengthProvider);
    final hitIndex = Random().nextInt(itemLength);
    final hitOffset = 1.0 / itemLength * hitIndex;

    // 12秒間ルーレットを回転する
    final seconds = 12;
    final offset = 1.0 - 1.0 / itemLength * 2;

    final valueListenable = ValueNotifier<double>(0);
    final animation = TweenSequence([
      // 1秒間のアニメーション
      TweenSequenceItem(
        tween: Tween(begin: 1.0, end: offset).chain(
          CurveTween(curve: Curves.easeOutCubic),
        ),
        weight: 0.5,
      ),
      TweenSequenceItem(
        tween: Tween(begin: offset, end: 1.0).chain(
          CurveTween(curve: Curves.easeInCubic),
        ),
        weight: 0.5,
      ),
      // 11秒間のアニメーション
      TweenSequenceItem(
        tween: Tween(begin: 0.0, end: 11.0 - hitOffset).chain(
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
        state = RouletteState.hit(
          title: state.title,
          value: state.value,
          hitIndex: hitIndex,
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
