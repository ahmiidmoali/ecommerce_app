import 'package:enhanced_ecommerce_app/features/app_feature/global/services/network_services.dart';
import 'package:enhanced_ecommerce_app/features/user_feature/data/data_sources/remote/user_remote_data_source.dart';
import 'package:enhanced_ecommerce_app/features/user_feature/data/data_sources/remote/user_remote_data_source_imp.dart';
import 'package:enhanced_ecommerce_app/features/user_feature/data/models/user_model.dart';
import 'package:enhanced_ecommerce_app/linkapi.dart';
import 'package:http/http.dart';
import 'package:mockito/annotations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'user_remote_data_source_imp_test.mocks.dart';

@GenerateMocks([NetworkServices])
void main() {
  late UserRemoteDataSource userRemoteDataSource;
  late NetworkServices networkServices;
  setUp(
    () {
      networkServices = MockNetworkServices();
      userRemoteDataSource =
          UserRemoteDataSourceImp(networkServices: networkServices);
    },
  );

  test(
    "description",
    () async {
      //arrange
      final user = UserModel(usersName: "ahmed", usersEmail: "ahmed@yahoo.com");
      when(networkServices.postGetData(
              link: AppLink.login,
              body: {"email": "ahmed@yahoo.com", "passwword": "ahmed12345"}))
          .thenAnswer((_) => Future.value(Map));
      //act
      //assert
    },
  );
}
