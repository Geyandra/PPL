class Data {
  String ID;
  String JenisTernak;
  int Jumlah;
  String TanggalPendataan;
  String KesehatanTernak;

  Data({
    this.ID = '',
    required this.JenisTernak, 
    required this.Jumlah,
    required this.TanggalPendataan,
    required this.KesehatanTernak}); 

  Map <String, dynamic> toJson() => {
    "ID" : ID,
    "JenisTernak" : JenisTernak,
    "Jumlah" : Jumlah,
    "TanggalPendataan" : TanggalPendataan,
    "KesehatanTernak" : KesehatanTernak,
};

  static Data fromJson(Map <dynamic, dynamic> json) => Data (
    ID: json['ID'],
    JenisTernak: json['JenisTernak'],
    Jumlah: json['Jumlah'],
    KesehatanTernak: json['KesehatanTernak'],
    TanggalPendataan: json['TanggalPendataan'],
  );
}