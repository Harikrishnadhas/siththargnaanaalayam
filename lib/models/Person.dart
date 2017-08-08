import 'Address.dart';
import 'Meditation.dart';

class Person {
  static const int FEMALE = 0;
  static const int MALE = 1;

  String key;
  String name;
  String DOB;
  num age;
  String father_name;
  String mother_name;
  String occupation;
  int sex;
  Address address;
  List<Meditation> meditations_learned;

  Person(this.name,
      [this.DOB,
      this.age,
      this.father_name,
      this.mother_name,
      this.occupation,
      this.sex,
      this.address,
      this.meditations_learned]) {
    if (this.address == null) this.address = new Address();
    if (this.meditations_learned == null)
      this.meditations_learned = new List<Meditation>();
  }

  Person.fromMap(Map map)
      : this(
            map['name'],
            map['DOB'],
            map['age'],
            map['father_name'],
            map['mother_name'],
            map['occupation'],
            map['sex'],
            new Address.fromMap(map['address'] != null ? map['address'] : {}),
            map['meditations_learned'] != null
                ? fromMeditationMapList(map['meditations_learned'])
                : []);

  Map toMap() => {
        "name": name,
        "DOB": DOB,
        "age": age,
        "father_name": father_name,
        "mother_name": mother_name,
        "occupation": occupation,
        "sex": this.sex,
        "address": this.address.toMap(),
        "meditation_list": this.toMapFromMeditationList(),
      };

  void assignMap(Map map) {
    name = map['name'];
    DOB = map['DOB'];
    age = map['age'];
    father_name = map['father_name'];
    mother_name = map['mother_name'];
    occupation = map['occupation'];
    sex = map['sex'];
    address = new Address.fromMap(map['address']);
  }

  static List<Meditation> fromMeditationMapList(List<Map> mapList) {
    List<Meditation> meditationList = new List<Meditation>();
    mapList.forEach((map) => meditationList.add(new Meditation.fromMap(map)));
    return meditationList;
  }

  List<Map> toMapFromMeditationList() {
    List<Map> ret = new List<Map>();
    this
        .meditations_learned
        .forEach((meditation) => ret.add(meditation.toMap()));
    return ret;
  }
}