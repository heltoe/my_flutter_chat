import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_chat/common/enums.dart';
import 'package:my_flutter_chat/feature/presentation/pages/chat/chat_page.dart';
import 'package:my_flutter_chat/feature/presentation/pages/friends/list_friends_page.dart';
import 'package:my_flutter_chat/feature/presentation/pages/list_chat/list_chat_page.dart';
import 'package:my_flutter_chat/feature/presentation/pages/login/login_page.dart';
import 'package:my_flutter_chat/feature/presentation/pages/profile/profile_page.dart';
import 'package:my_flutter_chat/feature/presentation/pages/registration/registration_page.dart';
import 'package:my_flutter_chat/feature/presentation/pages/restore_password/restore_password_page.dart';

class AppNamesRoutes {
  static const String login = "login";
  static const String registration = "registration";
  static const String restorePassword = "restore-password";
  static const String profile = "profile";
  static const String chats = "chats";
  static const String all = "all";
  static const String requestToFriends = "request-to-friends";
  static const String friends = "friends";
  static const String users = "users";
}

class AppRouteState {
  bool isAuth;
  int? chatId;
  String page;
  String? typeFriendsPage;

  AppRouteState({ required this.isAuth, required this.page, required this.typeFriendsPage, this.chatId });

  AppRouteState.login() : isAuth = false, page = AppNamesRoutes.login, chatId = null;
  AppRouteState.registration() : isAuth = false, page = AppNamesRoutes.registration, chatId = null;
  AppRouteState.restorePassword() : isAuth = false, page = AppNamesRoutes.restorePassword, chatId = null;
  AppRouteState.profile() : isAuth = true, page = AppNamesRoutes.profile, chatId = null;
  AppRouteState.chats() : isAuth = true, page = AppNamesRoutes.chats, chatId = null;
  AppRouteState.chatPage(int id) : isAuth = true, page = AppNamesRoutes.chats, chatId = id;
  AppRouteState.listFriends(String type) : isAuth = true, page = AppNamesRoutes.friends, typeFriendsPage = type;
}

class AppRouteDelegate extends RouterDelegate<AppRouteState> with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  bool _isAuth = false;
  String _page = AppNamesRoutes.login;
  int _chatId = -1;
  String _typeFriendsPage = AppNamesRoutes.friends;

  FriendsPageTypeEnum get typeFriendsPage {
    switch (_typeFriendsPage) {
      case AppNamesRoutes.all: return FriendsPageTypeEnum.all;
      case AppNamesRoutes.friends: return FriendsPageTypeEnum.friends;
      case AppNamesRoutes.requestToFriends: return FriendsPageTypeEnum.requestToFriends;
      default: return FriendsPageTypeEnum.all;
    }
  }

  int get chatId => _chatId;
  // no auth pages
  void goToLogin() {
    _goToNoAuthedPage(AppNamesRoutes.login);
  }
  void goToRegistration() {
    _goToNoAuthedPage(AppNamesRoutes.registration);
  }
  void goToRestorePassword() {
    _goToNoAuthedPage(AppNamesRoutes.restorePassword);
  }
  // auth pages
  void goToProfile() {
    _goToAuthedPage(AppNamesRoutes.profile);
  }
  void goToListChatPage() {
    _chatId = -1;
    _goToAuthedPage(AppNamesRoutes.chats);
  }
  void goToChatPage(int id) {
    _chatId = id;
    _goToAuthedPage(AppNamesRoutes.chats);
  }
  void goToFriendsPage(FriendsPageTypeEnum type) {
    _typeFriendsPage = _convertFromEnum(type);
    _goToAuthedPage(AppNamesRoutes.users);
  }
  // common methods
  void _goToNoAuthedPage(String namePage) {
    _isAuth = false;
    _goToPage(namePage);
  }
  void _goToAuthedPage(String namePage) {
    _isAuth = true;
    _goToPage(namePage);
  }
  void _goToPage(String namePage) {
    _page = namePage;
    notifyListeners();
  }
  String _convertFromEnum(FriendsPageTypeEnum type) {
    switch (type) {
      case FriendsPageTypeEnum.all: return AppNamesRoutes.all;
      case FriendsPageTypeEnum.requestToFriends: return AppNamesRoutes.requestToFriends;
      case FriendsPageTypeEnum.friends: return AppNamesRoutes.friends;
      default: return AppNamesRoutes.friends;
    }
  }

  //
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      onPopPage: (route, result) => route.didPop(result),
      pages: [
        if (_isAuth && _page == AppNamesRoutes.profile) const MaterialPage(child: ProfilePage()),
        if (_isAuth && _page == AppNamesRoutes.chats && _chatId == -1) const MaterialPage(child: ListChatPage()),
        if (_isAuth && _page == AppNamesRoutes.chats && _chatId != -1) MaterialPage(child: ChatPage(idChat: _chatId,)),
        if (_isAuth && _page == AppNamesRoutes.users && _typeFriendsPage == _convertFromEnum(FriendsPageTypeEnum.friends)) const MaterialPage(child: ListFriendsPage(typePage: FriendsPageTypeEnum.friends)),
        if (_isAuth && _page == AppNamesRoutes.users && _typeFriendsPage == _convertFromEnum(FriendsPageTypeEnum.requestToFriends)) const MaterialPage(child: ListFriendsPage(typePage: FriendsPageTypeEnum.requestToFriends)),
        if (_isAuth && _page == AppNamesRoutes.users && _typeFriendsPage == _convertFromEnum(FriendsPageTypeEnum.all)) const MaterialPage(child: ListFriendsPage(typePage: FriendsPageTypeEnum.all)),
        //
        if (!_isAuth && _page == AppNamesRoutes.login) const MaterialPage(child: LoginPage()),
        if (!_isAuth && _page == AppNamesRoutes.registration) const MaterialPage(child: RegistrationPage()),
        if (!_isAuth && _page == AppNamesRoutes.restorePassword) const MaterialPage(child: RestorePasswordPage()),
      ],
    );
  }

  @override
  AppRouteState? get currentConfiguration => AppRouteState(isAuth: _isAuth, page: _page, typeFriendsPage: _typeFriendsPage, chatId: _chatId);

  @override
  GlobalKey<NavigatorState>? get navigatorKey => GlobalKey();

  @override
  Future<void> setNewRoutePath(AppRouteState configuration) {
    _isAuth = configuration.isAuth;
    _page = configuration.page;
    if (configuration.chatId != null) _chatId = configuration.chatId!;
    if (configuration.typeFriendsPage != null) _typeFriendsPage = configuration.typeFriendsPage!;
    return Future.value();
  }
  // восстанавливает значения состояния после закрытия приложения
  @override
  Future<void> setRestoredRoutePath(AppRouteState configuration) {
    return setNewRoutePath(configuration);
  }
}

class AppInformationParser extends RouteInformationParser<AppRouteState> {
  @override
  Future<AppRouteState> parseRouteInformation(RouteInformation routeInformation) {
    if (routeInformation.location == null) {
      return SynchronousFuture(AppRouteState.login());
    }
    final uri = Uri.parse(routeInformation.location!);
    if (uri.pathSegments.isEmpty) {
      return SynchronousFuture(AppRouteState.login());
    }
    switch (uri.pathSegments[0]) {
      case AppNamesRoutes.login: return SynchronousFuture(AppRouteState.login());
      case AppNamesRoutes.registration: return SynchronousFuture(AppRouteState.registration());
      case AppNamesRoutes.restorePassword: return SynchronousFuture(AppRouteState.restorePassword());
      case AppNamesRoutes.profile: return SynchronousFuture(AppRouteState.profile());
      case AppNamesRoutes.users: {
        String idFromUrl = uri.pathSegments[1];
        if (idFromUrl.isNotEmpty) {
          if (idFromUrl == AppNamesRoutes.friends) return SynchronousFuture(AppRouteState.listFriends(AppNamesRoutes.friends));
          if (idFromUrl == AppNamesRoutes.requestToFriends) return SynchronousFuture(AppRouteState.listFriends(AppNamesRoutes.requestToFriends));
          if (idFromUrl == AppNamesRoutes.all) return SynchronousFuture(AppRouteState.listFriends(AppNamesRoutes.all));
        }
        return SynchronousFuture(AppRouteState.listFriends(AppNamesRoutes.friends));
      }
      case AppNamesRoutes.chats: {
        String idFromUrl = uri.pathSegments[1];
        int? id = int.tryParse(idFromUrl);
        if (idFromUrl.isNotEmpty && id != null) return SynchronousFuture(AppRouteState.chatPage(id));
        return SynchronousFuture(AppRouteState.chats());
      }
      default: return SynchronousFuture(AppRouteState.login());
    }
  }

  @override
  RouteInformation? restoreRouteInformation(AppRouteState configuration) {
    if (configuration.isAuth) {
      switch (configuration.page) {
        case AppNamesRoutes.profile: return const RouteInformation(location: "/${AppNamesRoutes.profile}");
        case AppNamesRoutes.users: return RouteInformation(location: "/${AppNamesRoutes.users}/${configuration.typeFriendsPage}");
        case AppNamesRoutes.chats: return RouteInformation(location: "/${AppNamesRoutes.profile}${configuration.chatId == -1 ? "" : "/${configuration.chatId}"}");
        default: return const RouteInformation(location: "/${AppNamesRoutes.profile}");
      }
    } else {
      switch (configuration.page) {
        case AppNamesRoutes.login: return const RouteInformation(location: "/${AppNamesRoutes.login}");
        case AppNamesRoutes.registration: return const RouteInformation(location: "/${AppNamesRoutes.registration}");
        case AppNamesRoutes.restorePassword: return const RouteInformation(location: "/${AppNamesRoutes.restorePassword}");
        default: return const RouteInformation(location: "/${AppNamesRoutes.login}");
      }
    }
  }
}

class AppTransitionDelegate extends TransitionDelegate<AppRouteState> {
  @override
  Iterable<RouteTransitionRecord> resolve({required List<RouteTransitionRecord> newPageRouteHistory, required Map<RouteTransitionRecord?, RouteTransitionRecord> locationToExitingPageRoute, required Map<RouteTransitionRecord?, List<RouteTransitionRecord>> pageRouteToPagelessRoutes}) {
    for (var element in newPageRouteHistory) {
      if (element.isWaitingForEnteringDecision) {
        element.markForAdd();
      }
      if (element.isWaitingForExitingDecision) {
        element.markForPop();
      }
    }
    return newPageRouteHistory;
  }
}