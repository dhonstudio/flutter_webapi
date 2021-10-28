class Student {
  // properties
  late final int id;
  late final String name;
  late final int age;
  late final String email;
  late final String phone;

  Student(
      {required this.id,
      required this.name,
      required this.age,
      required this.email,
      required this.phone});

  // Konversi dari json ke maps
  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
        id: json['id'],
        name: json['name'],
        age: json['age'],
        email: json['email'],
        phone: json['phone']);
  }

  // konversi dari maps ke json
  Map<String, dynamic> toJson() => {
        'name': name,
        'age': age,
        'email': email,
        'phone': phone,
      };
}
