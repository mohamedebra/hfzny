class TabBaModel {
  List<Paths>? paths;

  TabBaModel({this.paths});

  TabBaModel.fromJson(Map<String, dynamic> json) {
    if (json['paths'] != null) {
      paths = <Paths>[];
      json['paths'].forEach((v) {
        paths!.add(new Paths.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.paths != null) {
      data['paths'] = this.paths!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Paths {
  int? id;
  String? title;
  String? description;
  int? order;
  String? status;
  String? createdAt;
  String? updatedAt;
  List<PathItems>? pathItems;

  Paths(
      {this.id,
        this.title,
        this.description,
        this.order,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.pathItems});

  Paths.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    order = json['order'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['path_items'] != null) {
      pathItems = <PathItems>[];
      json['path_items'].forEach((v) {
        pathItems!.add(new PathItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['order'] = this.order;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.pathItems != null) {
      data['path_items'] = this.pathItems!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PathItems {
  int? id;
  int? pathId;
  String? title;
  String? description;
  int? order;
  String? status;
  String? createdAt;
  String? updatedAt;

  PathItems(
      {this.id,
        this.pathId,
        this.title,
        this.description,
        this.order,
        this.status,
        this.createdAt,
        this.updatedAt});

  PathItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pathId = json['path_id'];
    title = json['title'];
    description = json['description'];
    order = json['order'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['path_id'] = this.pathId;
    data['title'] = this.title;
    data['description'] = this.description;
    data['order'] = this.order;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}