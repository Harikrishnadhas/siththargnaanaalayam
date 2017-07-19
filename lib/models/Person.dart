import 'Address.dart';

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

  Person(this.name,
      [this.DOB,
      this.age,
      this.father_name,
      this.mother_name,
      this.occupation,
      this.sex,
      this.address]) {
    if (this.address == null) this.address = new Address();
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
            new Address.fromMap(map['address'] != null ? map['address'] : {}));

  Map toMap() => {
        "name": name,
        "DOB": DOB,
        "age": age,
        "father_name": father_name,
        "mother_name": mother_name,
        "occupation": occupation,
        "sex": this.sex,
        "address": this.address.toMap(),
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
}
