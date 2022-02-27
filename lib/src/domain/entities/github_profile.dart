import 'package:equatable/equatable.dart';

class GithubProfile extends Equatable {
  final String? avatarUrl;
  final String url;
  final String name;
  final String? company;
  final String? location;
  final String? bio;
  final int follower;
  final int following;

  GithubProfile({
    this.avatarUrl,
    required this.url,
    required this.name,
    this.company,
    this.location,
    this.bio,
    required this.follower,
    required this.following,
  });

  @override
  List<Object?> get props => [
        avatarUrl,
        bio,
        follower,
        following,
        url,
        name,
        company,
        location,
      ];

  @override
  bool? get stringify => true;
}
