class Data{
  String JenisProduk;
  String ID;
  String TanggalProduksi;
  int Jumlah;

  Data({
    this.ID = '',
    required this.JenisProduk, 
    required this.TanggalProduksi,
    required this.Jumlah,
    });

  Map <String, dynamic> toJson() => {
      "ID" : ID,
      "JenisProduk" :JenisProduk,
      "TanggalProduksi" :TanggalProduksi,
      "Jumlah" :Jumlah,
  };

   static Data fromJson(Map <dynamic, dynamic> json) => Data (
    ID: json['ID'],
    JenisProduk: json['JenisProduk'],
    TanggalProduksi: json['TanggalProduksi'],
    Jumlah: json['Jumlah'],
  );

}