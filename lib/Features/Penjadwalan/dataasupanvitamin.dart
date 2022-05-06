class Data {
  int ID;
  String JenisTernak;
  String HariAsupanVitamin;
  String TanggalAsupanVitamin;
  String Status;

  Data({
    required this.ID,
    required this.JenisTernak, 
    required this.HariAsupanVitamin,
    required this.TanggalAsupanVitamin,
    required this.Status}); 

  static List<Data> getData() {
    return <Data>[
      Data(
        ID: 1,
        JenisTernak: "Anakan",
        HariAsupanVitamin: "Rabu",
        TanggalAsupanVitamin: "08-02-2022",
        Status: "Sudah diberi Asupan Vitamin"
      ),
      Data(
        ID: 2,
        JenisTernak: "Indukan",
        HariAsupanVitamin: "Senin",
        TanggalAsupanVitamin: "09-02-2022",
        Status: "Belum diberi Asupan Vitamin"
      ),
      Data(
        ID: 3,
        JenisTernak: "Anakan",
        HariAsupanVitamin: "Sabtu",
        TanggalAsupanVitamin: "18-02-2022",
        Status: "Sudah diberi Asupan Vitamin"
      ),
      Data(
        ID: 4,
        JenisTernak: "Pejantan",
        HariAsupanVitamin: "Kamis",
        TanggalAsupanVitamin: "28-02-2022",
        Status: "Belum diberi Asupan Vitamin"
      ),
      Data(
        ID: 5,
        JenisTernak: "Pejantan",
        HariAsupanVitamin: "Rabu",
        TanggalAsupanVitamin: "10-03-2022",
        Status: "Belum diberi Asupan Vitamin"
      ),
    ];
  }
}