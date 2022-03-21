class Scene {
  String? name;
  WhiteBoardPpt? ppt;

  Scene({this.name, this.ppt});

  Scene.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    ppt = json["ppt"] != null ? (WhiteBoardPpt.fromJson(json["ppt"])) : null;
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      if (ppt != null) "ppt": ppt!.toJson(),
    };
  }
}

class WhiteBoardPpt {
  final String src;
  final int width;
  final int height;
  final String? previewURL;

  WhiteBoardPpt({
    required this.src,
    required this.width,
    required this.height,
    this.previewURL,
  });

  WhiteBoardPpt.fromJson(Map<String, dynamic> json)
      : src = json["src"],
        width = json["width"],
        height = json["height"],
        previewURL = json["previewURL"];

  // TODO
  Map<String, Object> toJson() {
    final Map<String, Object> json = <String, Object>{};

    void addIfPresent(String fieldName, Object? value) {
      if (value != null) {
        json[fieldName] = value;
      }
    }

    addIfPresent('src', src);
    addIfPresent('width', width);
    addIfPresent('height', height);
    addIfPresent('previewURL', previewURL);

    return json;
  }
}

class ScenePathType {
  static const empty = "none";
  static const page = "page";
  static const dir = "dir";
}

class WhiteBoardSceneState {
  late List<Scene>? scenes;
  late String scenePath;
  late int index;

  Map<String, dynamic> toJson() {
    return {
      "index": index,
      "scenePath": scenePath,
      "scenes": scenes?.map<Map<String, dynamic>>((e) => e.toJson()).toList()
    };
  }

  WhiteBoardSceneState.fromJson(Map<String, dynamic> json) {
    index = json["index"];
    scenePath = json["scenePath"];
    scenes =
        (json["scenes"] as List).map<Scene>((e) => Scene.fromJson(e)).toList();
  }
}
