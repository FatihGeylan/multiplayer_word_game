import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../constants/colors.dart';
import '../../../../custom/custom_app_bar.dart';
import '../../../../router/router.dart';
import '../../domain/models/game_result.dart';
import '../../domain/models/letter.dart';
import '../providers/ingame_provider.dart';

@RoutePage()
class GameResultPage extends ConsumerWidget {
  final GameResult gameResult;
  final List<List<Letter>> myLetters;
  final List<List<Letter>> opponentLetters;

  const GameResultPage({
    required this.gameResult,
    required this.myLetters,
    required this.opponentLetters,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(ingameProvider.select((value) => value.pregameInfo), (previous, next) {
      next.fold(
        () => null,
        (t) {
          context.router.parent()?.maybePop();
          context.pushRoute(
            PregameRoute(pregameInfo: t, isSender: false, isRematch: true),
          );
          return;
        },
      );
    });
    ref.listen(ingameProvider.select((value) => value.isRematchRejected), (previous, next) {
      if (next) {
        context.router.parent()?.maybePop();
      }
    });
    final inGameState = ref.watch(ingameProvider);

    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        context.router.parent()?.maybePop();
      },
      child: Scaffold(
        appBar: const CustomAppBar(
          title: 'Oyun Bitti',
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'Oyun Sonucu: ${gameResult.gameResultName}',
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          color: gameResult.gameResultId == 1
                              ? Colors.green
                              : gameResult.gameResultId == 2
                                  ? Colors.red
                                  : Colors.amber,
                        ),
                  ),
                ),
                SizedBox(height: 20.h),
                if (inGameState.isRematchSent)
                  Center(
                    child: Text(
                      'Duello isteği gönderildi.',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  )
                else
                  inGameState.rematchRequest.fold(
                    () => Visibility(
                      visible: gameResult.previousGameResult == null,
                      child: FilledButton(
                        onPressed: () {
                          ref.read(ingameProvider.notifier).sendRematchRequest();
                        },
                        child: const Text('Duello İsteği Gönder'),
                      ),
                    ),
                    (t) => Row(
                      children: [
                        Expanded(
                          child: FilledButton(
                            onPressed: () {
                              ref.read(ingameProvider.notifier).acceptRequest();
                            },
                            child: const Text('Kabul Et'),
                          ),
                        ),
                        SizedBox(width: 16.w),
                        Expanded(
                          child: FilledButton(
                            onPressed: () {
                              ref.read(ingameProvider.notifier).rejectRequest();
                            },
                            child: const Text('Reddet'),
                          ),
                        ),
                      ],
                    ),
                  ),
                SizedBox(height: 20.h),
                Center(
                  child: Text(
                    'Sonuçlarınız:',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                SizedBox(height: 20.h),
                for (var i = 0; i < myLetters.length; i++)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (var j = 0; j < myLetters[i].length; j++)
                        Container(
                          width: 40.w,
                          height: 40.h,
                          margin: EdgeInsets.all(4.w),
                          decoration: BoxDecoration(
                            color: myLetters[i][j].code == 0
                                ? gray.withOpacity(.5)
                                : myLetters[i][j].code == 1
                                    ? Colors.green.shade400
                                    : myLetters[i][j].code == 2
                                        ? Colors.amber.shade400
                                        : Colors.grey.shade600,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Center(
                            child: Text(
                              myLetters[i][j].letter!,
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.white),
                            ),
                          ),
                        ),
                    ],
                  ),
                SizedBox(height: 20.h),
                if (gameResult.currentUserScore != null) ...[
                  Text(
                    'Yeşil Harf Puanı: ${gameResult.currentUserScore?.greenCharacterScore}',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Sarı Harf Puanı: ${gameResult.currentUserScore?.yellowCharacterScore}',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Kelime Belirleme Süresi Puanı: ${gameResult.currentUserScore?.pregameRemainingTimeScore}',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Toplam Puan: ${gameResult.currentUserScore?.totalScore}',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Geçen Süre: ${gameResult.currentUserScore?.elapsedTimeSeconds} saniye',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
                if (gameResult.currentUserScore != null && gameResult.previousGameResult?.currentUserScore != null)
                  Divider(
                    height: 20.h,
                    thickness: 3.r,
                  ),
                if (gameResult.previousGameResult != null &&
                    gameResult.previousGameResult?.currentUserScore != null) ...[
                  Text(
                    'Önceki Oyun Yeşil Harf Puanı: ${gameResult.previousGameResult?.currentUserScore?.greenCharacterScore}',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Önceki Oyun Sarı Harf Puanı: ${gameResult.previousGameResult?.currentUserScore?.yellowCharacterScore}',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Önceki Oyun Kelime Belirleme Süresi Puanı: ${gameResult.previousGameResult?.currentUserScore?.pregameRemainingTimeScore}',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Önceki Oyun Toplam Puan: ${gameResult.previousGameResult?.currentUserScore?.totalScore}',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Önceki Oyun Geçen Süre: ${gameResult.previousGameResult?.currentUserScore?.elapsedTimeSeconds} saniye',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
                Divider(
                  height: 40.h,
                  thickness: 6.r,
                ),
                Center(
                  child: Text(
                    'Rakip Sonuçları:',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                SizedBox(height: 20.h),
                for (var i = 0; i < opponentLetters.length; i++)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (var j = 0; j < opponentLetters[i].length; j++)
                        Container(
                          width: 40.w,
                          height: 40.h,
                          margin: EdgeInsets.all(4.w),
                          decoration: BoxDecoration(
                            color: opponentLetters[i][j].code == 0
                                ? gray.withOpacity(.5)
                                : opponentLetters[i][j].code == 1
                                    ? Colors.green.shade400
                                    : opponentLetters[i][j].code == 2
                                        ? Colors.amber.shade400
                                        : Colors.grey.shade600,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Center(
                            child: Text(
                              opponentLetters[i][j].letter!,
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.white),
                            ),
                          ),
                        ),
                    ],
                  ),
                SizedBox(height: 20.h),
                if (gameResult.otherUserScore != null) ...[
                  Text(
                    'Yeşil Harf Puanı: ${gameResult.otherUserScore?.greenCharacterScore}',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Sarı Harf Puanı: ${gameResult.otherUserScore?.yellowCharacterScore}',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Kelime Belirleme Süresi Puanı: ${gameResult.otherUserScore?.pregameRemainingTimeScore}',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Toplam Puan: ${gameResult.otherUserScore?.totalScore}',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Geçen Süre: ${gameResult.otherUserScore?.elapsedTimeSeconds} saniye',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
                if (gameResult.otherUserScore != null && gameResult.previousGameResult?.otherUserScore != null)
                  Divider(
                    height: 20.h,
                    thickness: 3.r,
                  ),
                if (gameResult.previousGameResult != null && gameResult.previousGameResult?.otherUserScore != null) ...[
                  Text(
                    'Önceki Oyun Yeşil Harf Puanı: ${gameResult.previousGameResult?.otherUserScore?.greenCharacterScore}',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Önceki Oyun Sarı Harf Puanı: ${gameResult.previousGameResult?.otherUserScore?.yellowCharacterScore}',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Önceki Oyun Kelime Belirleme Süresi Puanı: ${gameResult.previousGameResult?.otherUserScore?.pregameRemainingTimeScore}',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Önceki Oyun Toplam Puan: ${gameResult.previousGameResult?.otherUserScore?.totalScore}',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Önceki Oyun Geçen Süre: ${gameResult.previousGameResult?.otherUserScore?.elapsedTimeSeconds} saniye',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
                SizedBox(height: 40.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
