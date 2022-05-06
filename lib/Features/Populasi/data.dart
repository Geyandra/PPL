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

  static List<Data> getData() {
    return <Data>[
      Data(
        ID: "1",
        JenisTernak: "Anakan",
        Jumlah: 3,
        TanggalPendataan: "08-02-2022",
        KesehatanTernak: "Baik"
      ),
      Data(
        ID: "2",
        JenisTernak: "Indukan",
        Jumlah: 3,
        TanggalPendataan: "09-02-2022",
        KesehatanTernak: "Baik"
      ),
      Data(
        ID: "3",
        JenisTernak: "Pejantan",
        Jumlah: 3,
        TanggalPendataan: "18-02-2022",
        KesehatanTernak: "Baik"
      ),
      Data(
        ID: "4",
        JenisTernak: "Indukan",
        Jumlah: 3,
        TanggalPendataan: "28-02-2022",
        KesehatanTernak: "Baik"
      ),
      Data(
        ID: "5",
        JenisTernak: "Anakan",
        Jumlah: 3,
        TanggalPendataan: "10-03-2022",
        KesehatanTernak: "Baik"
      ),
    ];
  }
}