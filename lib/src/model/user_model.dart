sealed class UserModel {
  final int id;
  final String name;
  final String email;
  final String? avatar;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    this.avatar,
  });
}

class UserModelAdm extends UserModel {
  final List<String>? workDays;
  final List<String>? workHours;

  UserModelAdm({
    required super.id,
    required super.name,
    required super.email,
    super.avatar,
    this.workDays,
    this.workHours,
  });

  factory UserModelAdm.fromMap(Map<String, dynamic> json) {
    return switch (json) {
      {
        "id": int id,
        "name": String name,
        "email": String email,
      } =>
        UserModelAdm(
          id: id,
          name: name,
          email: email,
          avatar: json["avatar"],
          workDays: json["work_days"]?.cast<String>(),
          workHours: json["work_hours"]?.cast<int>(),
        ),
      _ => throw ArgumentError("Invalid Json"),
    };
  }
}

class UserModelEmployee extends UserModel {
  final int barbershopId;
  final List<String> workDays;
  final List<int> workHours;

  UserModelEmployee({
    required super.id,
    required super.name,
    required super.email,
    required this.barbershopId,
    required this.workDays,
    required this.workHours,
    super.avatar,
  });


  factory UserModelEmployee.fromMap(Map<String, dynamic> json) {
    return switch (json) {
      {
      "id": final int id,
      "name": final String name,
      "email": final String email,
      "barbershopId": final int barbershopId,
      "workDays": final List workDays,
      "workHours": final List workHours,
      } =>
          UserModelEmployee(
            id: id,
            name: name,
            email: email,
            avatar: json["avatar"],
            barbershopId: barbershopId,
            workDays: workDays.cast<String>(),
            workHours: workHours.cast<int>(),
          ),
      _ => throw ArgumentError("Invalid Json"),
    };
  }
}
