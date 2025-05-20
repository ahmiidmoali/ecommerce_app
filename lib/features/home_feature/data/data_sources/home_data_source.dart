import 'package:enhanced_ecommerce_app/features/app_feature/global/functions/fetch_remote_data.dart';
import 'package:enhanced_ecommerce_app/features/home_feature/domain/entities/items_entity.dart';

abstract class HomeDataSource {
  Future<Map> getHomeData(String uid);
  Future<List<ItemsEntity>> getItems(String uid, ItemsEntity item);
  Future<int> getCountItems(String usersId, String itemsId);
  Future<RequestResult> addToCart(String usersId, String itemsId);
  Future<RequestResult> removeFromCart(String usersId, String itemsId);
  Future<List<ItemsEntity>> searchItems(String search);
  Future<RequestResult> favouriteAdd(String usersId, String itemsId);
  Future<RequestResult> favouriteRemove(String usersId, String itemsId);
  Future<List<ItemsEntity>> favouriteView(String usersId);
}
