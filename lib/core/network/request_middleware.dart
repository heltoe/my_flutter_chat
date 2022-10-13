import 'dart:convert';
import 'package:http/http.dart';
import 'package:my_flutter_chat/common/config.dart';
import 'package:my_flutter_chat/common/utils.dart';
import 'package:my_flutter_chat/core/network/client_app.dart';
import 'package:my_flutter_chat/core/network/endpoints/api_endpoints.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RequestMiddleWare {
  final SharedPreferences sharedPreferences;
  final ClientApp clientApp;
  final ApiEndPoints _apiEndPoints = ApiEndPoints();
  final String _authNameHeader = "Authorisation";
  String _inMemoryToken = "";
  String _inMemoryRefreshToken = "";

  RequestMiddleWare({ required this.sharedPreferences, required this.clientApp });

  String get userAccessToken {
    // use in memory token if available
    if (_inMemoryToken.isNotEmpty) return _inMemoryToken;
    // otherwise load it from local storage
    _inMemoryToken = _getTokenValue(AppConfig.token);
    return _inMemoryToken;
  }
  String get userRefreshToken {
    // use in memory token if available
    if (_inMemoryRefreshToken.isNotEmpty) return _inMemoryRefreshToken;
    // otherwise load it from local storage
    _inMemoryRefreshToken = _getTokenValue(AppConfig.refreshToken);
    return _inMemoryRefreshToken;
  }

  String _getTokenValue(String nameSharedLink) {
    var token = '';
    final tokenFromCache = sharedPreferences.getString(AppConfig.token);
    // If user is already authenticated, we can load his token from cache
    if (tokenFromCache != null) {
      token = tokenFromCache;
    }
    return token;
  }

  void setTokens({ String accessToken = "", String refreshToken = "" }) {
    _inMemoryToken = accessToken;
    _inMemoryRefreshToken = refreshToken;
    sharedPreferences.setString(AppConfig.token, accessToken);
    sharedPreferences.setString(AppConfig.refreshToken, refreshToken);
  }

  void reset() {
    _inMemoryToken = "";
    _inMemoryRefreshToken = "";
    sharedPreferences.remove(AppConfig.token);
    sharedPreferences.remove(AppConfig.refreshToken);
  }

  Map<String, String> _getNewHeaders(Map<String, String> headers, Map<String, String> newHeader) {
    return { ...headers, ...newHeader };
  }

  Future<Response> checkStatusCode(RequestParams params) async {
    var localParams = params;

    localParams.headers = _getNewHeaders(params.headers ?? {}, {_authNameHeader: getAuthTokenValue(userAccessToken)});
    var response = await clientApp.request(localParams);
    // if token expired
    if (response.statusCode == 401) {
      var refreshTokensUrl = _apiEndPoints.authModule.refreshTokens;
      var paramsToRefreshSession = RequestParams(
        url: getFullUrl(refreshTokensUrl),
        method: MethodEnum.post,
        headers: params.headers,
        body: { "refreshToken": userRefreshToken },
      );
      // get new access/refresh tokens
      var responseRefreshTokens = await clientApp.request(paramsToRefreshSession);
      if (responseRefreshTokens.statusCode == 200) {
        var tokens = jsonDecode(responseRefreshTokens.body);
        setTokens(accessToken: tokens["access_token"], refreshToken: tokens["refresh_token"]);
        localParams.headers = _getNewHeaders(params.headers ?? {}, {_authNameHeader: getAuthTokenValue(_inMemoryToken)});
        response = await clientApp.request(localParams);
      } else {
        reset();
      }
    }
    return response;
  }
}
