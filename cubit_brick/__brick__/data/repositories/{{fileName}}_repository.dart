import 'dart:async';
import 'dart:io';

import 'package:http/http.dart' as http;

abstract class {{cubitName}} {
  Future<dynamic> {{cubitName}}();
}

class {{cubitName}}Repository implements {{cubitName}} {
  @override
  Future {{repositoryMethodName}}() async {
    try {
      var url = Uri.parse(ApiAddress.ipAddress + ApiRoutes.{{cubitName}});
      var response = await http
          .get(url, headers: ApiHeaders.headerWithoutAuth())
          .timeout(const Duration(seconds: AppStrings.timeOut));
      if (response.statusCode == 200) {
        return {{cubitName}}Model.fromRawJson(response.body);
      } else {
        return FailedApiResponse.fromRawJson(response.body);
      }
    } on TimeoutException catch (_) {
      return AppStrings.timeoutError;
    } on SocketException catch (_) {
      return AppStrings.connectionError;
    } catch (e) {
      return e.toString();
    }
  }
}
