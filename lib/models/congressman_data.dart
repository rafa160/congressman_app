class CongressmanData {
  int id;
  String uri;
  String name;
  String partyAcronym;
  String uriParty;
  String stateAcronym;
  String urlPhoto;
  String email;

  CongressmanData({this.id, this.uri, this.name, this.partyAcronym, this.uriParty,
    this.stateAcronym, this.urlPhoto, this.email});

  factory CongressmanData.fromJson(Map<String,dynamic> json) => CongressmanData(
    id: json['id'],
    uri: json['uri'],
    name: json['nome'],
    partyAcronym: json['siglaPartido'],
    uriParty: json['uriPartido'],
    stateAcronym: json['siglaUf'],
    urlPhoto: json['urlFoto'],
    email:json['email'],

  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'uri': uri,
    'nome': name,
    'siglaPartido': partyAcronym,
    'uriPartido': uriParty,
    'siglaUf': stateAcronym,
    'urlFoto': urlPhoto,
    'email': email,
  };
}