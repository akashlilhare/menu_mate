class OrderHistoryModel {
  OrderHistoryModel({
    required this.orderHistory,
  });

  late final List<OrderHistory> orderHistory;

  OrderHistoryModel.fromJson(Map<String, dynamic> json) {
    orderHistory = List.from(json['order_history'])
        .map((e) => OrderHistory.fromJson(e))
        .toList();
  }
}

class OrderHistory {
  OrderHistory({
    required this.id,
    required this.userId,
    required this.hotelId,
    required this.orderedItems,
    required this.tableNumber,
    required this.totalAmount,
    required this.orderStatus,
    required this.createdAt,
    required this.updatedAt,
  });

  late final String id;
  late final String userId;
  late final String hotelId;
  late final List<OrderedItems> orderedItems;
  late final String tableNumber;
  late final int totalAmount;
  late final String orderStatus;
  late final String createdAt;
  late final String updatedAt;

  OrderHistory.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    userId = json['user_id'];
    hotelId = json['hotel_id'];
    orderedItems = List.from(json['ordered_items'])
        .map((e) => OrderedItems.fromJson(e))
        .toList();
    tableNumber = json['table_number'];
    totalAmount = json['total_amount'];
    orderStatus = json['order_status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
}

class OrderedItems {
  OrderedItems({
    required this.itemName,
    required this.itemPrice,
    required this.itemQty,
    required this.id,
  });

  late final String itemName;
  late final int itemPrice;
  late final int itemQty;
  late final String id;

  OrderedItems.fromJson(Map<String, dynamic> json) {
    itemName = json['item_name'];
    itemPrice = json['item_price'];
    itemQty = json['item_qty'];
    id = json['_id'];
  }
}
