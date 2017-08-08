class Meditation{
  String name;
  DateTime learned_on;

  Meditation(this.name, this.learned_on);

  Meditation.fromMap(Map map):this(map['name'], map['learned_on']);

  Map toMap() => {
    'name': this.name,
    'learned_on': this.learned_on
  };
}