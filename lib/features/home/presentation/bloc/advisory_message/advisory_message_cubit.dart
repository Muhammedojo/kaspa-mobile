import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/api/api.dart';
import '../../../../../core/data/model/advisory.dart';
import '../../../../../core/storage/istorage.dart';
import '../../../../../core/utils/global_variables.dart';
import '../../../repository/home_repository_contract.dart';
import '../api_request/api_request_bloc.dart';
import '../api_request/api_request_state.dart';

part 'advisory_message_state.dart.dart';

class AdvisoryMessageCubit extends Cubit<AdvisoryMessageState> {
  final IHomeRepository repository;
  final LocalStorage databaseManager;
  AdvisoryMessageCubit({
    required this.databaseManager,
    required this.repository,
  }) : super(AdvisoryMessageLoading());

  int currentPulledCount = 0;

  loadAdvisoryMessage({String? url}) async {
    try {
      emit(AdvisoryMessageLoading());
      final response =
          url != null && url.isNotEmpty
              ? await repository.getAdvisoryMessageList(endpoint: url)
              : await repository.getAdvisoryMessageList();

      final state =
          BlocProvider.of<ApiRequestBloc>(
            GlobalVariables.rootNavigatorKey.currentContext!,
          ).state;
      if (state is ApiRequestStateCompleted) {
        loadAdvisoryMessagesFromDb();
      } else {
        response.fold(
          (l) {
            GlobalVariables.rootNavigatorKey.currentContext!
                .read<ApiRequestBloc>()
                .add(ApiRequestCompleted());
            loadAdvisoryMessagesFromDb();
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
                    identifier: advisoryMessageListEndpoint,
                    progress: progressPercent,
                  ),
                );

            saveAdvisoryMessagesToDb(r.data ?? []);
            if (r.nextUrl != null && (r.nextUrl ?? "").isNotEmpty) {
              loadAdvisoryMessage(url: r.nextUrl);
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
      loadAdvisoryMessagesFromDb();
      debugPrint(e.toString());
    }
  }

  loadAdvisoryMessagesFromDb() async {
    try {
      final response = await repository.getAdvisoryMessage();
      emit(AdvisoryMessageLoaded(response));
    } catch (e) {
      emit(AdvisoryMessageNotLoaded());
    }
  }

  saveAdvisoryMessagesToDb(List<Advisory> advisoryMessageList) async {
    try {
      await repository.saveAdvisoryMessage(advisoryMessageList);
      loadAdvisoryMessagesFromDb();
    } on Error catch (e) {
      debugPrint(e.toString());
    }
  }
}
