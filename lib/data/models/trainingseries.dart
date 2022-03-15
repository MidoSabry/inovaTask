import 'dart:convert';

class TrainingSeries {
  String? seriesName;
  String? coverPhoto;
  String? coachName;
  String? description;

  TrainingSeries({
    this.seriesName,
    this.coverPhoto,
    this.coachName,
    this.description,
  });

  TrainingSeries copyWith({
    String? seriesName,
    String? coverPhoto,
    String? coachName,
    String? description,
  }) {
    return TrainingSeries(
      seriesName: seriesName ?? this.seriesName,
      coverPhoto: coverPhoto ?? this.coverPhoto,
      coachName: coachName ?? this.coachName,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'seriesName': seriesName,
      'coverPhoto': coverPhoto,
      'coachName': coachName,
      'description': description,
    };
  }

  factory TrainingSeries.fromMap(Map<String, dynamic> map) {
    return TrainingSeries(
      seriesName: map['seriesName'],
      coverPhoto: map['coverPhoto'],
      coachName: map['coachName'],
      description: map['description'],
    );
  }

  String toJson() => json.encode(toMap());

  factory TrainingSeries.fromJson(String source) =>
      TrainingSeries.fromMap(json.decode(source));

  @override
  String toString() {
    return 'TrainingSeries(seriesName: $seriesName, coverPhoto: $coverPhoto, coachName: $coachName, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TrainingSeries &&
        other.seriesName == seriesName &&
        other.coverPhoto == coverPhoto &&
        other.coachName == coachName &&
        other.description == description;
  }

  @override
  int get hashCode {
    return seriesName.hashCode ^
        coverPhoto.hashCode ^
        coachName.hashCode ^
        description.hashCode;
  }
}
