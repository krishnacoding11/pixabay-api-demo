class DataModel {
  int? total;
  int? totalHits;
  List<Hits>? hits;

  DataModel({this.total, this.totalHits, this.hits});

  DataModel.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    totalHits = json['totalHits'];
    if (json['hits'] != null) {
      hits = <Hits>[];
      json['hits'].forEach((v) {
        hits!.add(new Hits.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['totalHits'] = this.totalHits;
    if (this.hits != null) {
      data['hits'] = this.hits!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Hits {
  int? id;
  String? pageURL;
  String? type;
  String? tags;
  String? previewURL;
  int? previewWidth;
  int? previewHeight;
  String? webformatURL;
  int? webformatWidth;
  int? webformatHeight;
  String? largeImageURL;
  int? imageWidth;
  int? imageHeight;
  int? imageSize;
  int? views;
  int? downloads;
  int? collections;
  int? likes;
  int? comments;
  int? userId;
  String? user;
  String? userImageURL;

  Hits(
      {this.id,
      this.pageURL,
      this.type,
      this.tags,
      this.previewURL,
      this.previewWidth,
      this.previewHeight,
      this.webformatURL,
      this.webformatWidth,
      this.webformatHeight,
      this.largeImageURL,
      this.imageWidth,
      this.imageHeight,
      this.imageSize,
      this.views,
      this.downloads,
      this.collections,
      this.likes,
      this.comments,
      this.userId,
      this.user,
      this.userImageURL});

  Hits.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0; // Use a default value (0 in this case) if id is null
    pageURL = json['pageURL'] ?? "";
    type = json['type'] ?? "";
    tags = json['tags'] ?? "";
    previewURL = json['previewURL'] ?? "";
    previewWidth = json['previewWidth'] ?? 0;
    previewHeight = json['previewHeight'] ?? 0;
    webformatURL = json['webformatURL'] ?? "";
    webformatWidth = json['webformatWidth'] ?? 0;
    webformatHeight = json['webformatHeight'] ?? 0;
    largeImageURL = json['largeImageURL'] ?? "";
    imageWidth = json['imageWidth'] ?? 0;
    imageHeight = json['imageHeight'] ?? 0;
    imageSize = json['imageSize'] ?? 0;
    views = json['views'] ?? 0;
    downloads = json['downloads'] ?? 0;
    collections = json['collections'] ?? 0;
    likes = json['likes'] ?? 0;
    comments = json['comments'] ?? 0;
    userId = json['user_id'] ?? 0;
    user = json['user'] ?? "";
    userImageURL = json['userImageURL'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['pageURL'] = this.pageURL;
    data['type'] = this.type;
    data['tags'] = this.tags;
    data['previewURL'] = this.previewURL;
    data['previewWidth'] = this.previewWidth;
    data['previewHeight'] = this.previewHeight;
    data['webformatURL'] = this.webformatURL;
    data['webformatWidth'] = this.webformatWidth;
    data['webformatHeight'] = this.webformatHeight;
    data['largeImageURL'] = this.largeImageURL;
    data['imageWidth'] = this.imageWidth;
    data['imageHeight'] = this.imageHeight;
    data['imageSize'] = this.imageSize;
    data['views'] = this.views;
    data['downloads'] = this.downloads;
    data['collections'] = this.collections;
    data['likes'] = this.likes;
    data['comments'] = this.comments;
    data['user_id'] = this.userId;
    data['user'] = this.user;
    data['userImageURL'] = this.userImageURL;
    return data;
  }
}
