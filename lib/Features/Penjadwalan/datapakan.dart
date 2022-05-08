class Data {
  String ID;
  String JenisTernak;
  String NamaPakanTambahan;
  String TanggalPakan;
  String Status;

  Data({
    required this.ID,
    required this.JenisTernak, 
    required this.NamaPakanTambahan,
    required this.TanggalPakan,
    required this.Status});
    Map <String, dynamic> toJson() => {
    "ID" : ID,
    "JenisTernak" : JenisTernak,
    "NamaPakanTambahan" : NamaPakanTambahan,
    "TanggalPakan" : TanggalPakan,
    "Status" : Status,
};
  static Data fromJson(Map <dynamic, dynamic> json) => Data (
    ID: json['ID'],
    JenisTernak: json['JenisTernak'],
    NamaPakanTambahan: json['NamaPakanTambahan'],
    TanggalPakan: json['TanggalPakan'],
    Status: json['Status'],
  ); 
}