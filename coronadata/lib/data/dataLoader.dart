import 'dart:convert';
import 'package:http/http.dart' as http;

 getCountriesData()  async{
  List lstCountry;
  var response = await http.get("https://brp.com.np/covid/country.php");
  var getData = json.decode(response.body);
  lstCountry = [getData];
  print("The method getcoudnt is calles");
  return lstCountry;
}
