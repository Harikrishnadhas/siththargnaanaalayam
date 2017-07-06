class People
{
  String name;
  num mobile_no;

  People(this.name, [this.mobile_no]);

  People.fromMap(Map map) :
    this(map['name'], map['mobile_no']);

  Map toMap() =>
      {
        "name": name,
        "mobile_no": mobile_no
      };
}