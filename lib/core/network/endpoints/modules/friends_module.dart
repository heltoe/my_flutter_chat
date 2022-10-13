class FriendsModule {
  String listFriends({ required int userId, String? query = "" }) => "/user-friends/$userId${query != null && query.isNotEmpty ? "?$query" : ""}";
  final String addToFriend = "/add-to-friend";
  final String removeFromFriend = "/remove-from-friend";
  String listUsers({ required int userId, String? query = "" }) => "/user-list/$userId${query != null && query.isNotEmpty ? "?$query" : ""}";
}