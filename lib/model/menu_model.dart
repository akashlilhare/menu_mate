class MenuModel {
  MenuModel({
    required this.menu,
    required this.hotelDetails,
    required this.popular,
    required this.special,
  });
  late final Menu menu;
  late final HotelDetails hotelDetails;
  late final List<Popular> popular;
  late final List<Special> special;

  MenuModel.fromJson(Map<String, dynamic> json){
    menu = Menu.fromJson(json['menu']);
    hotelDetails = HotelDetails.fromJson(json['hotel_details']);
    popular = List.from(json['popular']).map((e)=>Popular.fromJson(e)).toList();
    special = List.from(json['special']).map((e)=>Special.fromJson(e)).toList();
  }

}

class Menu {
  Menu({
    required this.cousineList,

    required this.id,
  });
  late final List<CousineList> cousineList;

  late final String id;

  Menu.fromJson(Map<String, dynamic> json){
    cousineList = List.from(json['cousine_list']).map((e)=>CousineList.fromJson(e)).toList();

    id = json['id'];
  }


}

class CousineList {
  CousineList({
    required this.title,
    required this.menuItemList,
    required this.id,
  });
  late final String title;
  late final List<MenuItemList> menuItemList;
  late final String id;

  CousineList.fromJson(Map<String, dynamic> json){
    title = json['title'];
    menuItemList = List.from(json['menu_item_list']).map((e)=>MenuItemList.fromJson(e)).toList();
    id = json['_id'];
  }

}

class MenuItemList {
  MenuItemList({
    required this.itemName,
    required this.price,
    required this.availability,
    required this.special,
    required this.popular,
    required this.veg,
    required this.id,
  });
  late final String itemName;
  late final int price;
  late final bool availability;
  late final bool special;
  late final bool popular;
  late final int veg;
  late final String id;

  MenuItemList.fromJson(Map<String, dynamic> json){
    itemName = json['item_name'];
    price = json['price'];
    availability = json['availability'];
    special = json['special'];
    popular = json['popular'];
    veg = json['veg'];
    id = json['_id'];
  }

}

class HotelDetails {
  HotelDetails({
    required this.hotelName,
    required this.id,
  });
  late final String hotelName;
  late final String id;

  HotelDetails.fromJson(Map<String, dynamic> json){
    hotelName = json['hotel_name'];
    id = json['id'];
  }


}

class Popular {
  Popular({
    required this.itemName,
    required this.price,
    required this.availability,
    required this.special,
    required this.popular,
    required this.veg,
    required this.id,
  });
  late final String itemName;
  late final int price;
  late final bool availability;
  late final bool special;
  late final bool popular;
  late final int veg;
  late final String id;

  Popular.fromJson(Map<String, dynamic> json){
    itemName = json['item_name'];
    price = json['price'];
    availability = json['availability'];
    special = json['special'];
    popular = json['popular'];
    veg = json['veg'];
    id = json['_id'];
  }

}

class Special {
  Special({
    required this.itemName,
    required this.price,
    required this.availability,
    required this.special,
    required this.popular,
    required this.veg,
    required this.id,
  });
  late final String itemName;
  late final int price;
  late final bool availability;
  late final bool special;
  late final bool popular;
  late final int veg;
  late final String id;

  Special.fromJson(Map<String, dynamic> json){
    itemName = json['item_name'];
    price = json['price'];
    availability = json['availability'];
    special = json['special'];
    popular = json['popular'];
    veg = json['veg'];
    id = json['_id'];
  }

}