import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_game/core/injections/locator.dart';

import '../../../../common/loading_overlay.dart';
import '../../../../constants/colors.dart';
import '../../../../core/extensions/int_extension.dart';
import '../../../../custom/custom_app_bar.dart';
import '../../../../router/router.dart';
import '../../../../services/timer/timer_provider.dart';
import '../../../../utils/show_toast.dart';
import '../../domain/models/lobby.dart';
import '../providers/active_users_provider.dart';
import '../providers/lobbies_provider.dart';

final selectedLobbyProvider = Provider.autoDispose<Lobby>((ref) => throw UnimplementedError());

@RoutePage()
class ActiveUsersPage extends ConsumerWidget implements AutoRouteWrapper {
  final Lobby lobby;
  const ActiveUsersPage({required this.lobby});

  @override
  Widget wrappedRoute(BuildContext context) {
    return ProviderScope(
      overrides: [
        selectedLobbyProvider.overrideWithValue(lobby),
      ],
      child: this,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(activeUsersProvider);

    ref.listen(activeUsersProvider.select((value) => value.isLoading), (previous, next) {
      if (next) {
        LoadingScreen().show(context: context);
      } else {
        LoadingScreen().hide();
      }
    });

    ref.listen(activeUsersProvider.select((value) => value.receivedChallenge), (previous, next) async {
      if (next.isSome()) {
        ref.watch(timerProvider).start(duration: const Duration(seconds: 10));

        final res = await showDialog<bool>(
          context: context,
          barrierDismissible: false,
          barrierColor: darkBlue.withOpacity(0.4),
          builder: (context) => ReceivedRequestDialog(
            senderName: ref.read(activeUsersProvider).receivedChallenge.toNullable()!.senderUserName,
          ),
        );
        if (res == true) {
          log('KARŞILAŞMA KABUL EDİLDİ');
          await ref.read(activeUsersProvider.notifier).acceptChallengeRequest();
        } else {
          await ref.read(activeUsersProvider.notifier).rejectChallengeRequest();
        }
      }
    });

    // ref.listen(activeUsersProvider.select((value) => value.pregameInfo), (previous, next) async {
    //   if (next.isSome()) {
    //     if (state.receivedChallenge.isNone()) {
    //       ref.read(timerProvider).close();
    //       context.router.popForced();
    //     }
    //   }
    // });
    ref.listen(activeUsersProvider.select((value) => value.res), (previous, next) async {
      if (next) {
        if (ref.read(activeUsersProvider).isSentDialogOpen) {
          context.router.popForced();
        }
        ref.read(activeUsersProvider).pregameInfo.fold(
          () {
            log('PREGAME NONE()');
            if (state.receivedChallenge.isNone()) {
              showToast(context, text: 'Rakip meydan okumayı kabul etmedi.');
            }
            return null;
          },
          (t) async {
            // ref.read(timerProvider).dispose();
            log('PREGAME PUSH PUSH PUSH');
            ref.read(activeUsersProvider.notifier).changeRes(false);
            context.router.push(PregameRoute(pregameInfo: t, isSender: state.receivedChallenge.isNone()));
          },
        );
      }
    });

    return PopScope(
      onPopInvoked: (didPop) {
        if (didPop) {
          ref.read(lobbiesProvider.notifier).init();
        }
      },
      child: Scaffold(
        appBar: CustomAppBar(
          title: '${lobby.gameTypeName} - ${lobby.wordLength} Harf',
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: ListView.separated(
            separatorBuilder: (context, index) => SizedBox(height: 10.h),
            itemCount: state.activeUsers.length,
            itemBuilder: (context, index) {
              final activeUser = state.activeUsers[index];
              return ListTile(
                title: Text(activeUser.userName),
                subtitle: Text(activeUser.userStatusTypeName),
                onTap: () async {
                  final userId = await ref.read(localeResourcesServiceProvider).getUserId();
                  if (userId.toNullable() == activeUser.userId) {
                    if (context.mounted) {
                      showToast(context, text: 'Kendi kendine meydan okuyamazsın.');
                    }
                  } else if (activeUser.userStatusTypeId != 1) {
                    if (context.mounted) {
                      showToast(context, text: 'Kullanıcı zaten oyunda');
                    }
                  } else {
                    await ref.read(activeUsersProvider.notifier).sendChallengeRequest(userId: activeUser.userId);

                    ref.read(activeUsersProvider).sendRequestFailure.fold(
                      () async {
                        ref.read(activeUsersProvider.notifier).changeSentDialogState(true);

                        ref.watch(timerProvider).start(duration: const Duration(seconds: 10));
                        await showDialog(
                          context: context,
                          barrierDismissible: false,
                          barrierColor: darkBlue.withOpacity(0.4),
                          builder: (context) => const SentRequestDialog(),
                        );
                        // ref.read(timerProvider).dispose();
                        ref.read(activeUsersProvider.notifier).changeSentDialogState(false);
                      },
                      (f) {
                        showToast(context, text: f.message);
                      },
                    );
                  }
                  // await ref.read(activeUsersProvider.notifier).rejectChallengeRequest();
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

class SentRequestDialog extends HookConsumerWidget {
  const SentRequestDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // useEffect(
    //   () {
    //     ref.read(timerProvider).timerStream.listen((event) {
    //       if (event == 0) {
    //         context.maybePop();
    // showToast(context, text: 'Rakip meydan okumayı zamanında kabul etmedi.');
    //       }
    //     });
    //     return null;
    //   },
    //   const [],
    // );

    return SimpleDialog(
      contentPadding: const EdgeInsets.all(16),
      title: const Text('Meydan Okuma'),
      children: [
        const Text('Meydan okuma isteği gönderildi.'),
        const SizedBox(height: 16),
        StreamBuilder(
          stream: ref.watch(timerProvider).timerStream,
          builder: (context, snapshot) {
            return Text(
              snapshot.data?.remainingTimeFormat ?? "00:10",
              style: Theme.of(context).textTheme.bodySmall,
            );
          },
        ),
      ],
    );
  }
}

class ReceivedRequestDialog extends HookConsumerWidget {
  final String senderName;
  const ReceivedRequestDialog({super.key, required this.senderName});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(
      () {
        ref.read(timerProvider).timerStream.listen((event) async {
          if (event == 0) {
            if (context.mounted) {
              context.maybePop(false);
              showToast(context, text: 'Gelen meydan okumayı zamanında kabul edemediniz.');
            }
          }
        });
        return null;
      },
      const [],
    );

    return SimpleDialog(
      contentPadding: const EdgeInsets.all(16),
      title: const Text('Meydan Okuma'),
      children: [
        Text(
          '$senderName size meydan okuma gönderdi.',
        ),
        const SizedBox(height: 16),
        Center(
          child: StreamBuilder(
            stream: ref.watch(timerProvider).timerStream,
            builder: (context, snapshot) {
              return Text(
                snapshot.data?.remainingTimeFormat ?? "00:10",
                style: Theme.of(context).textTheme.bodySmall,
              );
            },
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                ref.read(timerProvider).close();
                context.maybePop(true);
              },
              child: const Text('Kabul Et'),
            ),
            ElevatedButton(
              onPressed: () {
                ref.read(timerProvider).close();
                context.maybePop(false);
              },
              child: const Text('Reddet'),
            ),
          ],
        ),
      ],
    );
  }
}
