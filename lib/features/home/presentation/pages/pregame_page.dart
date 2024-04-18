// ignore_for_file: use_build_context_synchronously

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../constants/constans.dart';
import '../../../../core/extensions/int_extension.dart';
import '../../../../custom/custom_app_bar.dart';
import '../../../../custom/custom_dialog.dart';
import '../../../../router/router.dart';
import '../../../../services/timer/timer_provider.dart';
import '../../../../utils/show_toast.dart';
import '../../domain/models/game_result_enum.dart';
import '../../domain/models/letter.dart';
import '../../domain/models/pregame_info.dart';
import '../providers/pregame_provider.dart';

final pregameInfoProvider = Provider.autoDispose<PregameInfo>((ref) => throw UnimplementedError());
final isRematchProvider = Provider.autoDispose<bool>((ref) => throw UnimplementedError());

@RoutePage()
class PregamePage extends HookConsumerWidget implements AutoRouteWrapper {
  final PregameInfo pregameInfo;
  final bool isSender;
  final bool isRematch;

  const PregamePage({
    required this.pregameInfo,
    required this.isSender,
    this.isRematch = false,
  });

  @override
  Widget wrappedRoute(BuildContext context) {
    return ProviderScope(
      overrides: [
        pregameInfoProvider.overrideWithValue(pregameInfo),
        isRematchProvider.overrideWithValue(isRematch),
      ],
      child: this,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(pregameProvider.notifier);

    useEffect(
      () {
        if (isSender) {
          ref.watch(timerProvider).cancel();
        }
        ref.watch(timerProvider).start(duration: const Duration(minutes: 1));

        ref.read(timerProvider).timerStream.listen((event) {
          if (event == 0 && !ref.read(pregameProvider).wordSent) {
            ref.read(pregameProvider.notifier).sendMessage("-1");
            if (ref.read(pregameProvider).gameResult == GameResultEnum.ongoing) {
              ref.read(timerProvider).restart(duration: const Duration(minutes: 1));
            }
          }
        });
        return null;
      },
      [],
    );

    ref.listen(pregameProvider.select((value) => value.gameResult), (previous, next) {
      switch (next) {
        case GameResultEnum.ongoing:
          break;
        case GameResultEnum.win:
          CustomDialog.success(
            title: 'Tebrikler',
            subtitle: 'Rakibiniz vaktinde kelime giremedi. Kazandınız.',
            onPrimaryButtonPressed: () async {
              await context.router.maybePop();
              context.router.maybePop();
            },
          ).show(context);
        case GameResultEnum.lose:
          CustomDialog.failure(
            title: 'Yenilgi',
            subtitle: 'Kelimeyi vaktinde giremediğiniz için kaybettiniz.',
            onPrimaryButtonPressed: () async {
              await context.router.maybePop();
              context.router.maybePop();
            },
          ).show(context);
        case GameResultEnum.draw:
          showToast(context, text: 'Berabere');
      }
    });

    ref.listen(pregameProvider.select((value) => value.gameId), (previous, next) {
      if (next.isSome()) {
        context.router.replace(GameWrapperRoute(gameId: next.toNullable()!, wordLength: pregameInfo.wordLength));
      }
    });

    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Pregame Page',
      ),
      body: Column(
        children: [
          StreamBuilder(
            stream: ref.watch(timerProvider).timerStream,
            builder: (context, snapshot) {
              return Text(
                'Kalan süre: ${snapshot.data?.remainingTimeFormat ?? "01:00"}',
                style: Theme.of(context).textTheme.bodyLarge,
              );
            },
          ),
          SizedBox(height: 20.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: const _PregameBoard(),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.w),
            child: !ref.watch(pregameProvider).wordSent
                ? FilledButton(
                    onPressed: () {
                      notifier.submit();
                      ref.read(pregameProvider).codeFailure.fold(
                        () {
                          notifier.sendMessage(ref.read(pregameProvider).letters.map((e) => e.letter!).join());
                        },
                        (t) => showToast(context, text: t.message),
                      );
                    },
                    child: const Text('ONAYLA'),
                  )
                : Text(
                    'Kelime gönderildi, rakip bekleniyor.',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
          ),
          const Spacer(),
          const _PregameKeyboard(),
          SizedBox(height: 50.h),
        ],
      ),
    );
  }
}

class _PregameKeyboard extends ConsumerWidget {
  const _PregameKeyboard();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(pregameProvider.notifier);
    return Column(
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
                      ref.read(pregameProvider).codeFailure.fold(
                        () {
                          notifier.sendMessage(ref.read(pregameProvider).letters.map((e) => e.letter!).join());
                        },
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
    );
  }
}

class _PregameBoard extends ConsumerWidget {
  const _PregameBoard();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(pregameProvider);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: state.letters
          .map(
            (e) => Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.w),
                child: Container(
                  height: 52.h,
                  constraints: BoxConstraints(
                    maxWidth: 52.w,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: e.code == 0
                        ? Colors.grey.shade400
                        : e.code == 1
                            ? Colors.green.shade400
                            : Colors.amber.shade400,
                  ),
                  child: Center(
                    child: Text(
                      e.letter!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
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
    );
  }
}
