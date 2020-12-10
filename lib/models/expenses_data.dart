class ExpensesData {


  int year;
  int month;
  String expensesType;
  int docCode;
  String docType;
  String docDate;
  double docValue;
  String providerName;
  String docUrl;

  ExpensesData({this.year, this.month, this.expensesType, this.docCode, this.docType,
      this.docDate, this.docValue, this.providerName,this.docUrl});

  factory ExpensesData.fromJson(Map<String, dynamic> json) => ExpensesData(
    year: json['ano'],
    month: json['mes'],
    expensesType: json['tipoDespesa'],
    docCode:  json['codDocumento'],
    docType: json['tipoDocumento'],
    docDate: json['dataDocumento'],
    docValue: json['valorDocumento'],
    providerName: json['nomeFornecedor'],
    docUrl:  json['urlDocumento'],
  );

  Map<String, dynamic> toJson() => {
    'ano': year,
    'mes': month,
    'tipoDespesa': expensesType,
    'codDocumento': docCode,
    'tipoDocumento': docType,
    'dataDocumento': docDate,
    'valorDocumento': docValue,
    'nomeFornecedor': providerName,
    'urlDocumento': docUrl,
  };
}