class SkinDisease {
  String? key;
  SkinDiseaseData? skinDiseaseData;

  SkinDisease({this.key,this.skinDiseaseData});
}
class SkinDiseaseData{
  String? disease_name;
  String? cause;
  String? curement;
  String? symptom;
  SkinDiseaseData({this.disease_name,this.cause,this.curement,this.symptom});

  SkinDiseaseData.fromJason(Map<dynamic,dynamic> jason){
    disease_name =jason["disease_name"];
    cause =jason["cause"];
    curement =jason["curement"];
    symptom =jason["symptom"];
  }
}