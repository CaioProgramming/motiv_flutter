abstract class BaseBean {
  String id;

  BaseBean(this.id);

  BaseBean fromMap(Map<String, dynamic> map, String key);
  Map<String, dynamic> toMap();
}
