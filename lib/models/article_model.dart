class ArticleModel {
  final int? id;
  final String? title;
  final String? url;
  final String? imageUrl;
  final String? newsSite;
  final String? summary;
  final String? publishedAt;
  final String? updatedAt;
  final bool? featured;
  final List<dynamic>? launches;
  final List<dynamic>? events;

  ArticleModel({
    this.id,
    this.title,
    this.url,
    this.imageUrl,
    this.newsSite,
    this.summary,
    this.publishedAt,
    this.updatedAt,
    this.featured,
    this.launches,
    this.events,
  });

  ArticleModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        title = json['title'] as String?,
        url = json['url'] as String?,
        imageUrl = json['imageUrl'] as String?,
        newsSite = json['newsSite'] as String?,
        summary = json['summary'] as String?,
        publishedAt = json['publishedAt'] as String?,
        updatedAt = json['updatedAt'] as String?,
        featured = json['featured'] as bool?,
        launches = json['launches'] as List?,
        events = json['events'] as List?;

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'url': url,
        'imageUrl': imageUrl,
        'newsSite': newsSite,
        'summary': summary,
        'publishedAt': publishedAt,
        'updatedAt': updatedAt,
        'featured': featured,
        'launches': launches,
        'events': events
      };
}
