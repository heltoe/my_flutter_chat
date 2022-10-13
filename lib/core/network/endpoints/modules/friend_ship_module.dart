class FriendShipModule {
  String listFriendShip({ required int userId, String? query = "" }) => "/list-friendship/$userId${query != null && query.isNotEmpty ? "?$query" : ""}";
  final String addToFriendShip = "/add-to-friendship";
  final  removeFromFriendShip = "/remove-from-friendship";
}