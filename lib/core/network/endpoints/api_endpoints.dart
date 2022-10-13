import 'modules/auth_module.dart';
import 'modules/chat_module.dart';
import 'modules/friend_ship_module.dart';
import 'modules/friends_module.dart';
import 'modules/profile_module.dart';

class ApiEndPoints {
  final authModule = AuthModule();
  final chatModule = ChatModule();
  final friendsModule = FriendsModule();
  final friendShipModule = FriendShipModule();
  final profileModule = ProfileModule();
}