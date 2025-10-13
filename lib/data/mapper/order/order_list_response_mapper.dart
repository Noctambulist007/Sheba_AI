import 'package:sheba_ai/data/datasource/remote/model/response/order/order_list_response.dart';
import 'package:sheba_ai/data/mapper/order/order_response_mapper.dart';
import 'package:sheba_ai/domain/model/order/list_of_order_item.dart';

extension OrderListResponseMapper on OrderListResponse {
  List<ListOfOrderItem> toOrderList() {
    return data.results.map((e) => e.toOrder()).toList();
  }
}
