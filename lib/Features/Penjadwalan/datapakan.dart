class Data {
  int ID;
  String JenisTernak;
  String HariPakan;
  String TanggalPakan;
  String Status;

  Data({
    required this.ID,
    required this.JenisTernak, 
    required this.HariPakan,
    required this.TanggalPakan,
    required this.Status}); 

  static List<Data> getData() {
    return <Data>[
      Data(
        ID: 1,
        JenisTernak: "Anakan",
        HariPakan: "Rabu",
        TanggalPakan: "08-02-2022",
        Status: "Sudah diberi pakan"
      ),
      Data(
        ID: 2,
        JenisTernak: "Indukan",
        HariPakan: "Senin",
        TanggalPakan: "09-02-2022",
        Status: "Belum diberi pakan"
      ),
      Data(
        ID: 3,
        JenisTernak: "Anakan",
        HariPakan: "Sabtu",
        TanggalPakan: "18-02-2022",
        Status: "Sudah diberi pakan"
      ),
      Data(
        ID: 4,
        JenisTernak: "Pejantan",
        HariPakan: "Kamis",
        TanggalPakan: "28-02-2022",
        Status: "Belum diberi pakan"
      ),
      Data(
        ID: 5,
        JenisTernak: "Pejantan",
        HariPakan: "Rabu",
        TanggalPakan: "10-03-2022",
        Status: "Belum diberi pakan"
      ),
    ];
  }
}