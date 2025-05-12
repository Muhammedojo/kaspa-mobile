import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/api/api.dart';
import '../../../../../core/data/model/product.dart';
import '../../../../../core/storage/istorage.dart';
import '../../../../../core/utils/global_variables.dart';
import '../../../repository/home_repository_contract.dart';
import '../api_request/api_request_bloc.dart';
import '../api_request/api_request_state.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final IHomeRepository repository;
  final LocalStorage databaseManager;
  ProductCubit({required this.databaseManager, required this.repository})
    : super(ProductLoading());

  int currentPulledCount = 0;

  loadProduct({String? url}) async {
    try {
      emit(ProductLoading());
      final response =
          url != null && url.isNotEmpty
              ? await repository.getProductList(endpoint: url)
              : await repository.getProductList();

      final state =
          BlocProvider.of<ApiRequestBloc>(
            GlobalVariables.rootNavigatorKey.currentContext!,
          ).state;
      if (state is ApiRequestStateCompleted) {
        loadProductsFromDb();
      } else {
        response.fold(
          (l) {
            GlobalVariables.rootNavigatorKey.currentContext!
                .read<ApiRequestBloc>()
                .add(ApiRequestCompleted());
            loadProductsFromDb();
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
                    identifier: productListEndpoint,
                    progress: progressPercent,
                  ),
                );
            saveProductsToDb(r.data ?? []);
            if (r.nextUrl != null && (r.nextUrl ?? "").isNotEmpty) {
              
              loadProduct(url: r.nextUrl);
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
      loadProductsFromDb();
      debugPrint(e.toString());
    }
  }

  loadProductsFromDb() async {
    try {
      final response = await repository.getProduct();
      emit(ProductLoaded(response));
    } catch (e) {
      emit(ProductNotLoaded());
    }
  }

  saveProductsToDb(List<Product> productList) async {
    try {
      await repository.saveProduct(productList);
      loadProductsFromDb();
    } on Error catch (e) {
      debugPrint(e.toString());
    }
  }

}
