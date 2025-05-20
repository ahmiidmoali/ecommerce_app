import 'package:enhanced_ecommerce_app/features/cart_feature/data/data_sources/cart_remote_date_resource.dart';
import 'package:enhanced_ecommerce_app/features/cart_feature/data/data_sources/cart_remote_date_resource_imp.dart';
import 'package:enhanced_ecommerce_app/features/cart_feature/data/repository/cart_repository_imp.dart';
import 'package:enhanced_ecommerce_app/features/cart_feature/domain/repository/cart_repository.dart';
import 'package:enhanced_ecommerce_app/features/cart_feature/domain/usecases/add_to_cart_usecase.dart';
import 'package:enhanced_ecommerce_app/features/cart_feature/domain/usecases/check_coupon_usecase.dart';
import 'package:enhanced_ecommerce_app/features/cart_feature/domain/usecases/remove_from_cart_usecase.dart';
import 'package:enhanced_ecommerce_app/features/cart_feature/domain/usecases/view_cart_items_usecase.dart';
import 'package:enhanced_ecommerce_app/features/cart_feature/presentation/bloc/cart_order/cart_order_cubit.dart';
import 'package:enhanced_ecommerce_app/features/cart_feature/presentation/bloc/control/cart_control_cubit.dart';
import 'package:enhanced_ecommerce_app/features/cart_feature/presentation/bloc/view/cart_cubit.dart';
import 'package:enhanced_ecommerce_app/features/cart_feature/presentation/bloc/coupon/coupon_cubit.dart';
import 'package:enhanced_ecommerce_app/main_injection_container.dart';

Future<void> cartInjectionContainer() async {
//cubit
  sl.registerFactory<CartViewCubit>(
    () => CartViewCubit(
      viewCartItemsUsecase: sl.call(),
    ),
  );
  sl.registerFactory<CartControlCubit>(() => CartControlCubit(
      addToCartUsecase: sl.call(), removeFromCartUsecase: sl.call()));
  sl.registerFactory<CouponCubit>(
    () => CouponCubit(checkCouponUsecase: sl.call()),
  );
  sl.registerFactory<CartOrderCubit>(
    () => CartOrderCubit(),
  );

//usecases
  sl.registerLazySingleton<AddToCartUsecase>(
    () => AddToCartUsecase(repository: sl.call()),
  );
  sl.registerLazySingleton<CheckCouponUsecase>(
    () => CheckCouponUsecase(repository: sl.call()),
  );
  sl.registerLazySingleton<RemoveFromCartUsecase>(
    () => RemoveFromCartUsecase(repository: sl.call()),
  );
  sl.registerLazySingleton<ViewCartItemsUsecase>(
    () => ViewCartItemsUsecase(repository: sl.call()),
  );
//repo&data
  sl.registerLazySingleton<CartRepository>(
    () => CartRepositoryImp(dataSource: sl.call()),
  );
  sl.registerLazySingleton<CartRemoteDateResource>(
    () => CartRemoteDateResourceImp(networkServices: sl.call()),
  );
}
