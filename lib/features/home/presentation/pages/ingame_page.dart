import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_game/constants/colors.dart';
import 'package:word_game/features/home/presentation/providers/ingame_provider.dart';
import 'package:word_game/router/router.dart';

import '../../../../constants/constans.dart';
import '../../../../custom/custom_app_bar.dart';
import '../../../../utils/show_toast.dart';
import '../../domain/models/letter.dart';

final wordLengthProvider = Provider.autoDispose<int>((ref) => throw UnimplementedError());
final gameIdProvider = Provider.autoDispose<String>((ref) => throw UnimplementedError());

@RoutePage()
class GameWrapperPage extends HookConsumerWidget {
  final int wordLength;
  final String gameId;

  const GameWrapperPage({required this.wordLength, required this.gameId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ProviderScope(
      overrides: [
        wordLengthProvider.overrideWithValue(wordLength),
        gameIdProvider.overrideWithValue(gameId),
      ],
      child: const AutoRouter(),
    );
  }
}

@RoutePage()
class IngamePage extends HookConsumerWidget {
  const IngamePage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(ingameProvider.select((value) => value.inactivityTime), (previous, next) {
      if (next == 70) {
        ref.read(ingameProvider.notifier).resetInactivityTimer();
        ref.read(ingameProvider.notifier).sendMessage("-1");
      }
    });

    ref.listen(ingameProvider.select((value) => value.gameResult), (previous, next) {
      next.fold(
        () => null,
        (t) => context.router.push(
          GameResultRoute(
            gameResult: t,
            myLetters: ref.read(ingameProvider).myLetters,
            opponentLetters: ref.read(ingameProvider).opponentLetters,
          ),
        ),
      );
    });

    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (didPop) {
          ref.read(ingameProvider.notifier).sendMessage("-1");
          return;
        }
        _showBackDialog(context, ref);
      },
      child: Scaffold(
        appBar: const CustomAppBar(
          title: 'Ingame Page',
        ),
        body: Column(
          children: [
            SizedBox(height: 20.h),
            const _InactivityTimer(),
            SizedBox(height: 20.h),
            const _ShowOpponentButton(),
            SizedBox(height: 20.h),
            const _IngameBoard(),
            SizedBox(height: 20.h),
            const _HurryUpWarning(),
            const Spacer(),
            const _IngameKeyboard(),
            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }

  Future<void> _showBackDialog(BuildContext context, WidgetRef ref) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Uyarı'),
          content: const Text(
            'Oyundan çıkmanız halinde oyunu kaybedeceksiniz. Çıkmak istiyorsanız onay butonuna basınız.',
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Onayla'),
              onPressed: () {
                Navigator.pop(context);

                Navigator.pop(context);
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Reddet'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  // @override
  // Widget wrappedRoute(BuildContext context) {
  //   return ProviderScope(
  //     overrides: [
  //       wordLengthProvider.overrideWithValue(wordLength),
  //       gameIdProvider.overrideWithValue(gameId),
  //     ],
  //     child: this,
  //   );
  // }
}

class _IngameKeyboard extends ConsumerWidget {
  const _IngameKeyboard();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(ingameProvider.notifier);
    final state = ref.watch(ingameProvider);

    return Visibility(
      visible: !state.isCheckingOpponent,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        child: Column(
          children: [
            const SizedBox(
              height: 40.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: keyboardRow1.map((e) {
                return Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2.w),
                    child: InkWell(
                      onTap: () {
                        notifier.insertLetter(Letter(e, 0));
                      },
                      child: Container(
                        padding: const EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: Colors.grey.shade300,
                        ),
                        child: Center(
                          child: Text(
                            e,
                            style: const TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: keyboardRow2.map((e) {
                return Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2.w),
                    child: InkWell(
                      onTap: () {
                        notifier.insertLetter(Letter(e, 0));
                      },
                      child: Container(
                        padding: const EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: Colors.grey.shade300,
                        ),
                        child: Center(
                          child: Text(
                            e,
                            style: const TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: keyboardRow3.map((e) {
                return Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2.w),
                    child: InkWell(
                      onTap: () {
                        if (e == "⌫") {
                          notifier.deleteLetter();
                        } else if (e == "✓") {
                          notifier.submit();
                          ref.read(ingameProvider).wordFailure.fold(
                                () => notifier.sendMessage(
                                  ref
                                      .read(ingameProvider)
                                      .letters
                                      .elementAt(state.columnIndex)
                                      .map((e) => e.letter!)
                                      .join(),
                                ),
                                (t) => showToast(context, text: t.message),
                              );
                        } else {
                          notifier.insertLetter(Letter(e, 0));
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: Colors.grey.shade300,
                        ),
                        child: Center(
                          child: Text(
                            e,
                            style: const TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class _IngameBoard extends ConsumerWidget {
  const _IngameBoard();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(ingameProvider);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Column(
        children: state.letters
            .mapWithIndex(
              (rows, index) => Padding(
                padding: EdgeInsets.symmetric(vertical: 1.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: rows
                      .map(
                        (e) => Flexible(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 1.w),
                            child: Container(
                              height: 52.h,
                              constraints: BoxConstraints(
                                maxWidth: 52.w,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                color: e.code == 0
                                    ? gray.withOpacity(.5)
                                    : e.code == 1
                                        ? Colors.green.shade400
                                        : e.code == 2
                                            ? Colors.amber.shade400
                                            : Colors.grey.shade600,
                              ),
                              child: Center(
                                child: Text(
                                  e.letter!,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: state.columnIndex == index && !state.isCheckingOpponent
                                        ? textColor
                                        : Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

class _InactivityTimer extends ConsumerWidget {
  const _InactivityTimer();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Visibility(
      visible: ref.watch(ingameProvider).inactivityTime >= 60,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Text(
          '${70 - ref.watch(ingameProvider).inactivityTime} saniye içinde kelime göndermezseniz kaybedeceksiniz!',
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class _HurryUpWarning extends ConsumerWidget {
  const _HurryUpWarning();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(ingameProvider);
    return Visibility(
      visible: state.hurryTime > 0 && state.myLetters[4].any((element) => element.letter == ""),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Text(
          'Rekibinizin tahmin hakkı doldu. Rastgele kelime gönderilmeden önce kalan süreniz: ${ref.watch(ingameProvider).hurryTime} saniye',
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class _ShowOpponentButton extends ConsumerWidget {
  const _ShowOpponentButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40.w),
      child: FilledButton(
        onPressed: () {
          ref.read(ingameProvider.notifier).toggleIsCheckingOpponent();
        },
        child: Text(ref.watch(ingameProvider).isCheckingOpponent ? 'Oyuna Dön' : 'Rakibi Görüntüle'),
      ),
    );
  }
}
