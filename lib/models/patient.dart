class PersonalInfo {
  final String? daughter;
  final String? son;
  final String? friend;
  final String? hobby;
  final String? favoriteFood;
  final String? pet;
  final String? routine;

  PersonalInfo({
    this.daughter,
    this.son,
    this.friend,
    this.hobby,
    this.favoriteFood,
    this.pet,
    this.routine,
  });

  factory PersonalInfo.fromMap(Map<String, dynamic> map) {
    return PersonalInfo(
      daughter: map['daughter'],
      son: map['son'],
      friend: map['friend'],
      hobby: map['hobby'],
      favoriteFood: map['favoriteFood'],
      pet: map['pet'],
      routine: map['routine'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'daughter': daughter,
      'son': son,
      'friend': friend,
      'hobby': hobby,
      'favoriteFood': favoriteFood,
      'pet': pet,
      'routine': routine,
    };
  }
}

class Patient {
  final String id;
  final String name;
  final int age;
  final String language; // "en" | "hi"
  final String caregiverId;
  final PersonalInfo personalInfo;

  Patient({
    required this.id,
    required this.name,
    required this.age,
    required this.language,
    required this.caregiverId,
    required this.personalInfo,
  });

  factory Patient.fromMap(String id, Map<String, dynamic> map) {
    return Patient(
      id: id,
      name: map['name'] ?? '',
      age: map['age'] ?? 0,
      language: map['language'] ?? 'en',
      caregiverId: map['caregiverId'] ?? '',
      personalInfo: PersonalInfo.fromMap(
        Map<String, dynamic>.from(map['personalInfo'] ?? {}),
      ),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'age': age,
      'language': language,
      'caregiverId': caregiverId,
      'personalInfo': personalInfo.toMap(),
    };
  }

  static Patient dummy() {
    return Patient(
      id: 'dummy1',
      name: 'Asha',
      age: 72,
      language: 'en',
      caregiverId: 'caregiver1',
      personalInfo: PersonalInfo(
        daughter: 'Priya',
        hobby: 'Gardening',
        favoriteFood: 'Pani Puri',
        pet: 'Bruno',
        routine: 'Wakes at 7 AM, breakfast with Priya, evening walk in the garden.',
      ),
    );
  }
}