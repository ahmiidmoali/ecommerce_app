import 'package:enhanced_ecommerce_app/features/app_feature/global/functions/fetch_remote_data.dart';
import 'package:enhanced_ecommerce_app/features/home_feature/data/data_sources/home_data_source.dart';
import 'package:enhanced_ecommerce_app/features/home_feature/domain/entities/items_entity.dart';
import 'package:enhanced_ecommerce_app/features/home_feature/domain/repository/home_reqository.dart';

class HomeRepositoryImp extends HomeReqository {
  final HomeDataSource dataSource;

  HomeRepositoryImp({required this.dataSource});
  @override
  Future<Map> getHomeData(String uid) => dataSource.getHomeData(uid);

  @override
  Future<List<ItemsEntity>> getItems(String uid, ItemsEntity item) =>
      dataSource.getItems(uid, item);

  @override
  Future<int> getCountItems(String usersId, String itemsId) =>
      dataSource.getCountItems(usersId, itemsId);

  @override
  Future<RequestResult> addToCart(String usersId, String itemsId) =>
      dataSource.addToCart(usersId, itemsId);

  @override
  Future<RequestResult> removeFromCart(String usersId, String itemsId) =>
      dataSource.removeFromCart(usersId, itemsId);

  @override
  Future<List<ItemsEntity>> searchItems(String search) =>
      dataSource.searchItems(search);

  @override
  Future<RequestResult> favouriteAdd(String usersId, String itemsId) =>
      dataSource.favouriteAdd(usersId, itemsId);

  @override
  Future<RequestResult> favouriteRemove(String usersId, String itemsId) =>
      dataSource.favouriteRemove(usersId, itemsId);

  @override
  Future<List<ItemsEntity>> favouriteView(String usersId) =>
      dataSource.favouriteView(usersId);
}
