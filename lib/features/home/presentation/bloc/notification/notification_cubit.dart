import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/api/api.dart';
import '../../../../../core/storage/istorage.dart';
import '../../../../../core/data/model/notification.dart';
import '../../../../../core/utils/global_variables.dart';
import '../../../repository/home_repository_contract.dart';
import '../api_request/api_request_bloc.dart';
import '../api_request/api_request_state.dart';

part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  final IHomeRepository repository;
  final LocalStorage databaseManager;
  NotificationCubit({required this.databaseManager, required this.repository})
    : super(NotificationLoading());

  int currentPulledCount = 0;

  loadNotification({String? url}) async {
    try {
      emit(NotificationLoading());
      final response =
          url != null && url.isNotEmpty
              ? await repository.getNotificationList(endpoint: url)
              : await repository.getNotificationList();

      final state =
          BlocProvider.of<ApiRequestBloc>(
            GlobalVariables.rootNavigatorKey.currentContext!,
          ).state;
      if (state is ApiRequestStateCompleted) {
        loadNotificationsFromDb();
      } else {
        response.fold(
          (l) {
            GlobalVariables.rootNavigatorKey.currentContext!
                .read<ApiRequestBloc>()
                .add(ApiRequestCompleted());
            loadNotificationsFromDb();
          },
          (r) async {
            currentPulledCount += r.data?.length ?? 0;
            double progressPercent =
                (currentPulledCount.toDouble() /
                    double.parse((r.itemCount ?? 0).toString())) *
                100.0;

            GlobalVariables.rootNavigatorKey.currentContext!
                .read<ApiRequestBloc>()
                .add(
                  ApiRequestLoading(
                    identifier: notificationListEndpoint,
                    progress: progressPercent,
                  ),
                );

            saveNotificationsToDb(r.data ?? []);
            if (r.nextUrl != null && (r.nextUrl ?? "").isNotEmpty) {
              loadNotification(url: r.nextUrl);
            } else {
              GlobalVariables.rootNavigatorKey.currentContext!
                  .read<ApiRequestBloc>()
                  .add(ApiRequestCompleted());
            }
          },
        );
      }
    } on Exception catch (e) {
      GlobalVariables.rootNavigatorKey.currentContext!
          .read<ApiRequestBloc>()
          .add(ApiRequestCompleted());
      loadNotificationsFromDb();
      debugPrint(e.toString());
    }
  }

  loadNotificationsFromDb() async {
    try {
      final response = await repository.getNotification();
      emit(NotificationLoaded(response));
    } catch (e) {
      emit(NotificationNotLoaded());
    }
  }

  saveNotificationsToDb(List<Notifications> notificationList) async {
    try {
      await repository.saveNotification(notificationList);
      loadNotificationsFromDb();
    } on Error catch (e) {
      debugPrint(e.toString());
    }
  }

}
