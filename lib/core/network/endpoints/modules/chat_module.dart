class ChatModule {
  final String contentChat = "/content-chat";
  String listFriendShip({ required int userId }) => "/list-chats/$userId";
  final String sendMessage = "/set-message";
}