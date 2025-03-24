class Contact {
  final int? id;
  final String name;
  final String phoneNumber;
  final String email;
  final bool isBackedUp;

  Contact({
    this.id,
    required this.name,
    required this.phoneNumber,
    required this.email,
    this.isBackedUp = false,
  });

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'phoneNumber': phoneNumber,
        'email': email,
        'isBackedUp': isBackedUp ? 1 : 0,
      };

  static Contact fromMap(Map<String, dynamic> map) => Contact(
        id: map['id'],
        name: map['name'],
        phoneNumber: map['phoneNumber'],
        email: map['email'],
        isBackedUp: map['isBackedUp'] == 1,
      );
}
