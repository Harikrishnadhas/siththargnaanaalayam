class Address{
  String door_no;
  String building_name;
  String street_name;
  String city;
  String village;
  String town;
  String taluk;
  String district;
  String state;
  String country;
  num postal_code;
  String email;
  num phone_no;
  num mobile_no;
  String post_office;

  Address([this.country, this.state, this.taluk, this.town, this.village, this.district, this.city, this.street_name,
  this.building_name, this.door_no, this.mobile_no, this.email, this.phone_no, this.postal_code, this.post_office]);

  Address.fromMap(Map map) :
    this(map['country'],map['state'],map['taluk'],map['town'],map['village'],map['district'],map['city'],
        map['street_name'],map['building_name'],map['door_no'],
      map['mobile_no'],map['email'],map['phone_no'],map['postal_code'], map['post_office']);

  Map toMap() => {
    "door_no" : this.door_no,
    "building_name" : this.building_name,
    "street_name" : this.street_name,
    "city" : this.city,
    "village" : this.village,
    "town" : this.town,
    "taluk" : this.taluk,
    "district" : this.district,
    "state" : this.state,
    "country" : this.country,
    "postal_code" : this.postal_code,
    "email" : this.email,
    "phone_no" : this.phone_no,
    "mobile_no" : this.mobile_no,
    "post_office": this.post_office,
  };
}