class Data {
  String ID;
  String JenisTernak;
  String NamaVitamin;
  String TanggalAsupanVitamin;
  String Status;

  Data({
    required this.ID,
    required this.JenisTernak, 
    required this.NamaVitamin,
    required this.TanggalAsupanVitamin,
    required this.Status});
  
  Map <String, dynamic> toJson() => {
    "ID" : ID,
    "JenisTernak" : JenisTernak,
    "NamaVitamin" : NamaVitamin,
    "TanggalAsupanVitamin" : TanggalAsupanVitamin,
    "Status" : Status,
};
  static Data fromJson(Map <dynamic, dynamic> json) => Data (
    ID: json['ID'],
    JenisTernak: json['JenisTernak'],
    NamaVitamin: json['NamaVitamin'],
    TanggalAsupanVitamin: json['TanggalAsupanVitamin'],
    Status: json['Status'],
  );

}