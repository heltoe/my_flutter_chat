class ProfileModule {
  String userData(int userId) => "/user-data/$userId";
  final String personalInfo = "/personal-info";
  final String updateUserData = "/update-user-data";
  final String changePassword = "/change-password";
  final String changeAvatar = "/change-avatar";
}