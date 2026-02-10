import 'package:equatable/equatable.dart';

class ProfileModel extends Equatable {
  final String fullName;
  final String email;
  final String photoUrl;
  final String phoneNumber;
  final String bio;
  final ProfileStats stats;

  const ProfileModel({
    required this.fullName,
    required this.email,
    required this.photoUrl,
    required this.phoneNumber,
    required this.bio,
    required this.stats,
  });

  ProfileModel copyWith({
    String? fullName,
    String? email,
    String? photoUrl,
    String? phoneNumber,
    String? bio,
    ProfileStats? stats,
  }) {
    return ProfileModel(
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      photoUrl: photoUrl ?? this.photoUrl,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      bio: bio ?? this.fullName,
      stats: stats ?? this.stats,
    );
  }

  @override
  List<Object?> get props => [
    fullName,
    email,
    photoUrl,
    phoneNumber,
    bio,
    stats,
  ];
}

class ProfileStats extends Equatable {
  final int coursesCount;
  final int hourSpent;
  final double successRate;

  const ProfileStats({
    required this.coursesCount,
    required this.hourSpent,
    required this.successRate,
  });

  @override
  List<Object?> get props => [coursesCount, hourSpent, successRate];
}
