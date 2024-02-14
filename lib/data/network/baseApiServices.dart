// ignore_for_file: camel_case_types, file_names

abstract class BaseApiService {
  Future<dynamic> getGetApiResponse(String url);
  Future<dynamic> getPostApiResponse(String url, dynamic data);
}
