/**
 * Created by Jaimin on 20/03/24.
 */
class ItemModel {
  final int id;
  final String title;

  ItemModel({
    required this.id,
    required this.title,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
    };
  }

  ItemModel.fromMap(Map<String, dynamic> res)
      : id = res["id"],
        title = res["title"];
}
