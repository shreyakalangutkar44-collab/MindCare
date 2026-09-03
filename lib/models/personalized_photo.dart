class PersonalizedPhoto {
  final String id;
  final String patientId;
  final String imageBase64;
  final String label;
  final DateTime uploadedAt;

  PersonalizedPhoto({
    required this.id,
    required this.patientId,
    required this.imageBase64,
    required this.label,
    required this.uploadedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'patientId': patientId,
      'imageBase64': imageBase64,
      'label': label,
      'uploadedAt': uploadedAt,
    };
  }

  factory PersonalizedPhoto.fromMap(String id, Map<String, dynamic> map) {
    return PersonalizedPhoto(
      id: id,
      patientId: map['patientId'] ?? '',
      imageBase64: map['imageBase64'] ?? '',
      label: map['label'] ?? '',
      uploadedAt: map['uploadedAt']?.toDate() ?? DateTime.now(),
    );
  }
}