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

class CheckTokenRemoteModel {
    bool checkToken;
    String message;

    CheckTokenRemoteModel({
        required this.checkToken,
        required this.message,
    });

    factory CheckTokenRemoteModel.fromMap(Map<String, dynamic> json) => CheckTokenRemoteModel(
        checkToken: json["checkToken"],
        message: json["message"],
    );

    Map<String, dynamic> toMap() => {
        "checkToken": checkToken,
        "message": message,
    };
}