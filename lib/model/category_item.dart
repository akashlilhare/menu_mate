class CategoryItem {
  CategoryItem({
    required this.data,
  });
  late final Data data;

  CategoryItem.fromJson(Map<String, dynamic> json){
    data = Data.fromJson(json['data']);
  }
}

class Data {
  Data({
    required this.hotelMenu,
  });
  late final List<HotelMenu> hotelMenu;

  Data.fromJson(Map<String, dynamic> json){
    hotelMenu = List.from(json['hotel_menu']).map((e)=>HotelMenu.fromJson(e)).toList();
  }
}

class HotelMenu {
  HotelMenu({
    required this.title,
    required this.itemList,
  });
  late final String title;
  late final List<ItemList> itemList;

  HotelMenu.fromJson(Map<String, dynamic> json){
    title = json['title'];
    itemList = List.from(json['item_list']).map((e)=>ItemList.fromJson(e)).toList();
  }

}

class ItemList {
  ItemList({
    required this.itemName,
    required this.price,
    required this.availability,
    required this.special,
    required this.popular,
    required this.veg,
  });
  late final String itemName;
  late final int price;
  late final bool availability;
  late final bool special;
  late final bool popular;
  late final int veg;

  ItemList.fromJson(Map<String, dynamic> json){
    itemName = json['item_name'];
    price = json['price'];
    availability = json['availability'];
    special = json['special'];
    popular = json['popular'];
    veg = json['veg'];
  }
}