class UserModel {
  String? regno;
  String? email;
  String? name;
  String? block;
  String? roomno;

  UserModel({this.regno, this.email, this.name, this.block, this.roomno});

  //receiving data from server
  factory UserModel.fromMap(map) {
    return UserModel(
      regno: map['regno'],
      email: map['email'],
      name: map['name'],
      block: map['block'],
      roomno: map['roomno'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'regno': regno,
      'email': email,
      'name': name,
      'block': block,
      'roomno': roomno,
    };
  }
}
