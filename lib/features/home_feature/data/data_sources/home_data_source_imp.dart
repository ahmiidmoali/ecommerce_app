import 'package:enhanced_ecommerce_app/features/app_feature/global/functions/fetch_remote_data.dart';
import 'package:enhanced_ecommerce_app/features/app_feature/global/services/network_services.dart';
import 'package:enhanced_ecommerce_app/features/home_feature/data/data_sources/home_data_source.dart';
import 'package:enhanced_ecommerce_app/features/home_feature/data/models/items_model.dart';
import 'package:enhanced_ecommerce_app/features/home_feature/domain/entities/items_entity.dart';
import 'package:enhanced_ecommerce_app/linkapi.dart';

class HomeDataSourceImp extends HomeDataSource {
  final NetworkServices networkServices;

  HomeDataSourceImp({required this.networkServices});
  @override
  Future<Map> getHomeData(String uid) async {
    try {
      return await networkServices
          .postHomeData(link: AppLink.home, body: {"userId": uid});
    } catch (e) {
      print("HomeDataSourceImp exception");
      throw Exception();
    }
  }

  @override
  Future<List<ItemsEntity>> getItems(String uid, ItemsEntity item) async {
    try {
      List<dynamic> responce = await networkServices.postGetData(
          link: AppLink.itemspage,
          body: {
            "userId": uid,
            "categoriesId": item.itemsCategories.toString()
          });
      // List itemsJson = responce[0];
      List<ItemsEntity> items = [];
      items.addAll(responce.map(
        (e) => ItemsModel.fromJson(e),
      ));
      return items;
    } catch (e) {
      print("HomeDataSourceImp exception");
      throw Exception();
    }
  }

  @override
  Future<int> getCountItems(String usersId, String itemsId) async {
    try {
      return await networkServices.postGetData(
          link: AppLink.getcountitems,
          body: {"usersId": usersId, "itemsId": itemsId});
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<RequestResult> addToCart(String usersId, String itemsId) async {
    try {
      return await networkServices.postCheckSuccess(
          link: AppLink.addcart,
          body: {"usersId": usersId, "itemsId": itemsId});
    } catch (e) {
      return RequestResult.exception;
    }
  }

  @override
  Future<RequestResult> removeFromCart(String usersId, String itemsId) async {
    try {
      return await networkServices.postCheckSuccess(
          link: AppLink.removecart,
          body: {"usersId": usersId, "itemsId": itemsId});
    } catch (e) {
      return RequestResult.exception;
    }
  }

  @override
  Future<List<ItemsEntity>> searchItems(String search) async {
    try {
      List<dynamic> responce =
          await networkServices.postGetData(link: AppLink.search, body: {
        "search": search,
      });
      // List itemsJson = responce[0];
      List<ItemsEntity> items = [];
      items.addAll(responce.map(
        (e) => ItemsModel.fromJson(e),
      ));
      return items;
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<RequestResult> favouriteAdd(String usersId, String itemsId) async {
    try {
      return await networkServices.postCheckSuccess(
          link: AppLink.addfavourite,
          body: {"usersId": usersId, "itemsId": itemsId});
    } catch (e) {
      return RequestResult.exception;
    }
  }

  @override
  Future<RequestResult> favouriteRemove(String usersId, String itemsId) async {
    try {
      return await networkServices.postCheckSuccess(
          link: AppLink.removefavourite,
          body: {"usersId": usersId, "itemsId": itemsId});
    } catch (e) {
      return RequestResult.exception;
    }
  }

  @override
  Future<List<ItemsEntity>> favouriteView(String usersId) async {
    try {
      List<dynamic> responce =
          await networkServices.postGetData(link: AppLink.viewfavourite, body: {
        "usersId": usersId,
      });
      // List itemsJson = responce[0];
      List<ItemsEntity> items = [];
      items.addAll(responce.map(
        (e) => ItemsModel.fromJson(e),
      ));
      return items;
    } catch (e) {
      throw Exception();
    }
  }
}
