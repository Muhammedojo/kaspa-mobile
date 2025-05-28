import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/api/api.dart';
import '../../../../../core/data/model/bank.dart';
import '../../../../../core/storage/istorage.dart';
import '../../../../../core/utils/global_variables.dart';
import '../../../repository/home_repository_contract.dart';
import '../api_request/api_request_bloc.dart';
import '../api_request/api_request_state.dart';

part 'bank_state.dart';

class BankCubit extends Cubit<BankState> {
  final IHomeRepository repository;
  final LocalStorage databaseManager;
  BankCubit({required this.repository, required this.databaseManager})
    : super(BankLoading());

  int currentPulledCount = 0;

  loadBank({String? url}) async {
    try {
      emit(BankLoading());
      final response =
          url != null && url.isNotEmpty
              ? await repository.getBankList(endpoint: url)
              : await repository.getBankList();

      final state =
          BlocProvider.of<ApiRequestBloc>(
            GlobalVariables.rootNavigatorKey.currentContext!,
          ).state;
      if (state is ApiRequestStateCompleted) {
        loadBanksFromDb();
      } else {
        response.fold(
          (l) {
       
            GlobalVariables.rootNavigatorKey.currentContext!
                .read<ApiRequestBloc>()
                .add(ApiRequestCompleted());
            loadBanksFromDb();
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
                    identifier: bankListEndpoint,
                    progress: progressPercent,
                  ),
                );

            saveBanksToDb(r.data ?? []);
            if (r.nextUrl != null && (r.nextUrl ?? "").isNotEmpty) {
              loadBank(url: r.nextUrl);
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
      loadBanksFromDb();
      debugPrint(e.toString());
    }
  }

  loadBanksFromDb() async {
    try {
      final response = await repository.getBank();
      emit(BankLoaded(response));
    } catch (e) {
      emit(BankNotLoaded());
    }
  }

  saveBanksToDb(List<Bank> bankList) async {
    try {
      await repository.saveBank(bankList);
      loadBanksFromDb();
    } on Error catch (e) {
      debugPrint(e.toString());
    }
  }
}
