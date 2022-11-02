import 'dart:ui';

import 'package:my_flutter_chat/common/config.dart';

const List<Color> _listColors = [
  Color(0xFF7FC8E8),
  Color(0xFFFDC16C),
  Color(0xFFFD6C6D),
  Color(0xFF7ABC7A),
  Color(0xFFAE69BF),
  Color(0xFFAE69BF),
  Color(0xFF7FA2E8),
  Color(0xFFD5C9B8),
  Color(0xFF989898),
  Color(0xFFFFB8E8),
  Color(0xFF5D414D),
  Color(0xFFCBE9AB),
  Color(0xFFC0CCE2),
  Color(0xFFF58569),
  Color(0xFF608190),
  Color(0xFFFE9A9A),
  Color(0xFFAD7D7D),
  Color(0xFF94C2C6),
  Color(0xFFA2B464),
];

Color getColorById(int id) => _listColors[id % _listColors.length];
String getAuthTokenValue(String value) => "Bearer $value";
String getFullUrl(String value) => "${AppConfig.backendUrl}$value";
String getInitials(String fullName) => fullName.split(" ").map((str) => str[0]).join("");