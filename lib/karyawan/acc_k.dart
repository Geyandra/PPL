class Data{
  String Email;
  String FirstName;
  String ID;
  String LastName;
  int PhoneNumber;

  Data({
    this.ID = '',
    required this.Email,
    required this.FirstName, 
    required this.LastName,
    required this.PhoneNumber,
    });

  Map <String, dynamic> toJson() => {
      "ID" : ID,
      "Email" : Email,
      "FirstName" :FirstName,
      "LastName" :LastName,
      "PhoneNumber" :PhoneNumber,
  };

   static Data fromJson(Map <dynamic, dynamic> json) => Data (
    ID: json['ID'],
    Email: json['Email'],
    FirstName: json['FirstName'],
    LastName: json['LastName'],
    PhoneNumber: json['PhoneNumber'],
  );

}