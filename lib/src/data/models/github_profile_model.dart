import 'package:codehub/src/domain/entities/github_profile.dart';

class GithubProfileModel extends GithubProfile {
  GithubProfileModel(
      {required String? avatarUrl,
      required String url,
      required String name,
      required String username,
      required String? company,
      required String? location,
      required String? bio,
      required int follower,
      required int following})
      : super(
            avatarUrl: avatarUrl,
            url: url,
            name: name,
            username: username,
            company: company,
            location: location,
            bio: bio,
            follower: follower,
            following: following);

  factory GithubProfileModel.fromJson(json) => GithubProfileModel(
        avatarUrl: json["avatar_url"],
        url: json["url"],
        name: json["name"],
        username: json["login"],
        company: json["company"],
        location: json["location"],
        bio: json["bio"],
        follower: json["followers"],
        following: json["following"],
      );
}
