// ignore_for_file: file_names, avoid_print
import 'package:http/http.dart' as http;

Future<http.Response> deleteBrand(int id) async {
  var headers = {
    'Accept': 'application/json',
    'Authorization':
        'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiZGJkYjhkNmU1MTMwNGNiOTRhY2FkMzE2ZWExMDlkNTdkYjc1OWIzNmFlYmE1MTNlZTAyMzkzOTFkNDhiMTdlNjQ1ZTgxNmE4OTdjOTZjOTEiLCJpYXQiOjE3MDQ2MzYxNTkuMTc5NjE2OTI4MTAwNTg1OTM3NSwibmJmIjoxNzA0NjM2MTU5LjE3OTYxOTA3Mzg2Nzc5Nzg1MTU2MjUsImV4cCI6MTczNjI1ODU1OC45Njc2MTk4OTU5MzUwNTg1OTM3NSwic3ViIjoiMSIsInNjb3BlcyI6W119.QvfkGNrgNxrxuZWEIMFK_--jub5gaSVXe5eOqh0w8bskJmwGhiqN89IBC0wDBFzmqxXf5CMSpd55V-BAQ2Z3xugER3ZE5VMjoWlGZozl_lZppQpVsT-bmO7T4X7JW6uEeHzqusAe4bv0aes9ebWPOs8RL4yk2tQQ7CzUc4diVLuA5DRLzv1dQDSuR3cKJ4mLh9YjkbcXVdnFPvwQSr9X5SJVB6btX6fxocMum6tc-SujZMp9Z1PtFGffkgrMHmBjCv69m2f2QL3hXz8VczSkk7PwLgoszQYP2G3oeizven6oLR9BeaI7auR1s3lK1OxJl1iAMmwMwuFSlFVB0CII3ZNNDD0Q6TlI3BW2pYduPYr7c00OuU97ljJR7W5HoDJMTGKpq3Cc2RycNKyFj9nvuLL5t6-gABCYpPqg8tLlho8dcYJVA5xv898OKNTt_40tzdu9OqnNrQNk_vqDBBqjKtvnvQIDwLgiQ5EFgJGIOegtHSgnm44VH0fOnnV2EOazd1MONy9n3tbWrneLFdDKc1fxu5PpYtauVsKXZNnDZYGzpVFgtbaPWwDaxh7ARsQHjqV9pmSKwXQ0TJdUpAZe4L2a9ozfqBBIIZ61Ks7bsinXs4qA4CumKeKMAzhhohoD4R-X8ALqeW-YALB_2xbhlDMTDxE8xkpTfzLbCI1NqsE',
  };

  var url = Uri.parse('https://testcrm.thesuperstarshop.com/api/v1/brand/$id');

  var request = http.Request('DELETE', url);

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    print('Brand Deleted Successfully.');
  } else {
    print('Failed to delete brand: ${response.reasonPhrase}');
  }

  return await http.Response.fromStream(response);
}
