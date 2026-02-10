class Lesson {
  final String id;
  final String title;
  final String description;
  final String videoUrl;
  final int duration;
  final List<Resource> resources;
  final bool isPreview;
  final bool isLocked;
  final bool isCompleted;

  Lesson({
    required this.id,
    required this.title,
    required this.description,
    required this.videoUrl,
    required this.duration,
    required this.resources,
    this.isPreview = false,
    this.isCompleted = false,
    this.isLocked = true,
  });

  Lesson copyWith({
    String? id,
    String? title,
    String? description,
    String? videoUrl,
    int? duration,
    List<Resource>? resources,
    bool? isPreview,
    bool? isLocked,
    bool? isCompleted,
  }) {
    return Lesson(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      videoUrl: videoUrl ?? this.videoUrl,
      duration: duration ?? this.duration,
      resources: resources ?? this.resources,
      isPreview: isPreview ?? this.isPreview,
      isLocked: isPreview ?? this.isLocked,
      isCompleted: isPreview ?? this.isCompleted,
    );
  }

  factory Lesson.fromJson(Map<String, dynamic> json) => Lesson(
    id: json['id'],
    title: json['title'],
    description: json['description'],
    videoUrl: json['videoUrl'],
    duration: json['duration'],
    resources: json['resources'],
    isPreview: json['isPreview'] ?? false,
    isCompleted: json['isCompleted'] ?? false,
    isLocked: json['isLocked'] ?? true,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'description': description,
    'videoUrl': videoUrl,
    'duration': duration,
    'resources': resources,
    'isPreview': isPreview,
    'isCompleted': isCompleted,
    'isLocked': isLocked,
  };

  String get videoStreamUrl {
    // add your video straming URL logic here
    // this could be a direct URL or a funtcion to generic a signed URL
    return videoUrl;
  }
}

class Resource {
  final String id;
  final String title;
  final String type;
  final String url;

  Resource({
    required this.id,
    required this.title,
    required this.type,
    required this.url,
  });
}
