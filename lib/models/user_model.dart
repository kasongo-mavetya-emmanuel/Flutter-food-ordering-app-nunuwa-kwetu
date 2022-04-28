
class UserModel{
  String uid;
  String email;
  String fullName;
  String accountCreated;

  UserModel({
    required this.uid,
    required this.email,
    required this.fullName,
    required this.accountCreated,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': this.uid,
      'email': this.email,
      'fullName': this.fullName,
      'accountCreated': this.accountCreated,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] as String,
      email: map['email'] as String,
      fullName: map['fullName'] as String,
      accountCreated: map['accountCreated'] as String,
    );
  }
}