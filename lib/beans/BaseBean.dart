abstract class BaseBean {
  String id;

  BaseBean(this.id);

  Map<String, dynamic> toMap();
  BaseBean fromMap(Map<String, dynamic> map);
}
