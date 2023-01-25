class MusicModel {

  String? title;
  String? subTitle;
  String? url;
  String? urlImage;

  MusicModel({
    required this.title,
    required this.subTitle,
    required this.url,
    required this.urlImage,
  });

  MusicModel.fromJson(Map<String, dynamic> json) {
    title    = json['track']['name'];
    subTitle = json['track']['artists'][0]['name'];
    url      = json['track']['preview_url'];
    urlImage = json['track']['album']['images'][0]['url'];
  }

  @override
  String toString() {
    return 'MusicModel{title: $title, subTitle: $subTitle, url: $url, urlImage: $urlImage}';
  }


}
