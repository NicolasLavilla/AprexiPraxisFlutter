class Login {
    bool success;
    int idUser;
    String token;

    Login({
        required this.success,
        required this.idUser,
        required this.token,
    });
}

class UserData {
  final int userId;
  final String token;

  UserData({required this.userId, required this.token});
}
