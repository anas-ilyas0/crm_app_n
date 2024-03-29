// ignore_for_file: file_names, avoid_print
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<http.Response> updateLead(
  int id,
  String editFirstName,
  String editLastName,
  String editCompanyName,
  String editEmail,
  String editAddress,
  String editGroup,
  String editSkype,
  String editTaxID,
  String editCurrency,
  String editLanguage,
  String editContactType,
  String editCity,
  String editState,
  String editZip,
  String editPhone1,
  String editPhone2,
) async {
  var headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'Authorization':
        'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMjRkNDg1YzRiOTE2OTI0ZTZhMmU5NmYzZDQwMDk2NDhmN2ZhYjUyZDYzMjlhYTI1NWI1NDg4YjliMzBhNmZjODc3OTc4NDc5ZThlN2RiYTgiLCJpYXQiOjE3MDQ2MzExODQuNTg5MjM2OTc0NzE2MTg2NTIzNDM3NSwibmJmIjoxNzA0NjMxMTg0LjU4OTI0MDA3NDE1NzcxNDg0Mzc1LCJleHAiOjE3MzYyNTM1ODQuMzYxOTQ3MDU5NjMxMzQ3NjU2MjUsInN1YiI6IjEiLCJzY29wZXMiOltdfQ.ZsuqSAFndt5NzMeVImd8ank9UuIbnZ-9lSwSEvqBpg0hmksynHf77xMcMWjvfmeR4PJd3VDjoBOvRn6FIkaFf0yrEfBJVwBb-pO-MIrecdzXz72h5CT7eKlkHJ_FPZk2uuALZMQrwPj3sKgeO_F0dCQo39mz7PF0QSSZ-R3prFQTkKJKlnmhmN6jS2EppYGoUH5bN_QxvDoHO0-8vdcI_Pt-M1PHgYq18wau0aKxfWtv_8oJiLgInvrJcNG1as1GV8M5jr8IbI_fQ2n847GZ6pjlFcNDs0b4-WWgISwUf6phelDZ-fR2XqLvzD6PtlmPrGAck6J3jmbOYNyvcSLuDjst7ZC-AovrUaVumsYIPYVPPtDfW0RCkj2Qx__CMTciEEanzy6ddJjcDVZ1uF1VWDl3yJlw2fdxp0XeSOnX0unaWSw0pmpfZ1AIZQuyVHxmqgM8ZrL2t2ZAB2HPEAU-_h0IY98FSTTPfAcPZgPLPQIS1F_3OWOnEsLWk8j-BFdSTMWxxbOvH7IWGRLyOwV3bW4PDqs5OlQvulvOlQYUX0EO2bo3WGRi-lHwFxY9sLmw46wrszpC4HS6vjmq0etfyJslGpkcqu_r_ovWNm98tFUAe3NBMJZBBxM0pXPwFLvLBqBtYTDp8d7Wfvq91rtpAkarbLZqOW6LFeKEQf2gOis'
  };

  var request = http.Request('POST',
      Uri.parse('https://testcrm.thesuperstarshop.com/api/v1/lead-update'));
  request.body = json.encode({
    "created_by": id,
    'id': id,
    "first_Name": editFirstName,
    "last_name": editLastName,
    "company_id": editCompanyName,
    "email": editEmail,
    "fulladdress": editAddress,
    "group_id": editGroup,
    "skype": editSkype,
    "tax_id": editTaxID,
    "currency_id": editCurrency,
    "language_id": editLanguage,
    "type_Contact": editContactType,
    "city": editCity,
    "state_region": editState,
    "zip_postal_code": editZip,
    "phone1": editPhone1,
    "phone2": editPhone2,
  });
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  return await http.Response.fromStream(response);
}
