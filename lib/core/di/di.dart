import 'package:financial_report_app/core/data/data_source/orders_data_source.dart';
import 'package:financial_report_app/core/data/repos_imple/metric_repo_imple.dart';
import 'package:financial_report_app/features/metrics/domain/repo/metric_repo.dart';
import 'package:financial_report_app/features/metrics/presentation/manager/get_matric_data_cubit/get_matric_data_cubit.dart';
import 'package:get_it/get_it.dart';

var getIt = GetIt.instance;

void setupDi() {
  getIt.registerLazySingleton<OrdersDataSource>(() => OrdersDataSource());
  getIt.registerLazySingleton<MetricRepo>(() => MetricRepoImple(
    ordersDataSource: getIt<OrdersDataSource>(),
  ));
  getIt.registerFactory<GetMetricDataCubit>(() => GetMetricDataCubit(
    getIt<MetricRepo>(),
  ));


}