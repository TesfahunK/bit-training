import 'dart:convert';

class PageInfo {
  final int count;
  final int pages;
  final int? next;
  final int? prev;
  PageInfo({
    required this.count,
    required this.pages,
    this.next,
    this.prev,
  });

  PageInfo copyWith({
    int? count,
    int? pages,
    int? next,
    int? prev,
  }) {
    return PageInfo(
      count: count ?? this.count,
      pages: pages ?? this.pages,
      next: next ?? this.next,
      prev: prev ?? this.prev,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'count': count,
      'pages': pages,
      'next': next,
      'prev': prev,
    };
  }

  factory PageInfo.fromMap(Map<String, dynamic> map) {
    return PageInfo(
      count: map['count']?.toInt() ?? 0,
      pages: map['pages']?.toInt() ?? 0,
      next: map['next']?.toInt(),
      prev: map['prev']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory PageInfo.fromJson(String source) =>
      PageInfo.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PageInfo(count: $count, pages: $pages, next: $next, prev: $prev)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PageInfo &&
        other.count == count &&
        other.pages == pages &&
        other.next == next &&
        other.prev == prev;
  }

  @override
  int get hashCode {
    return count.hashCode ^ pages.hashCode ^ next.hashCode ^ prev.hashCode;
  }
}
