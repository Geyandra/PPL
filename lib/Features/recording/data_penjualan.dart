class Data{
  String JenisProduk;
  String ID;
  String TanggalPenjualan;
  String MediaPembayaran;
  int Jumlah;
  int TotalPembayaran;

  Data({
    this.ID = '',
    required this.JenisProduk, 
    required this.TanggalPenjualan,
    required this.MediaPembayaran,
    required this.Jumlah,
    required this.TotalPembayaran,
    });

  Map <String, dynamic> toJson() => {
      "ID" : ID,
      "JenisProduk" :JenisProduk,
      "TanggalPenjualan" :TanggalPenjualan,
      "Jumlah" :Jumlah,
      "TotalPembayaran" : TotalPembayaran,
      "MediaPembayaran" : MediaPembayaran
  };

   static Data fromJson(Map <dynamic, dynamic> json) => Data (
    ID: json['ID'],
    JenisProduk: json['JenisProduk'],
    TanggalPenjualan: json['TanggalPenjualan'],
    Jumlah: json['Jumlah'],
    TotalPembayaran: json['TotalPembayaran'],
    MediaPembayaran: json['MediaPembayaran']
  );

}