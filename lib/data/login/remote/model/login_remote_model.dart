class LoginRemoteModel {
    bool success;
    int idUser;
    String token;

    LoginRemoteModel({
        required this.success,
        required this.idUser,
        required this.token,
    });

    factory LoginRemoteModel.fromMap(Map<String, dynamic> json) => LoginRemoteModel(
        success: json["success"],
        idUser: json["idUser"],
        token: json["token"],
    );

    Map<String, dynamic> toMap() => {
        "success": success,
        "idUser": idUser,
        "token": token,
    };
}