import 'package:flutter_template/data/network/base_service.dart';
import 'package:flutter_template/data/network/rest_client.dart';

class RestService extends BaseService {
  RestService(
    super.options,
    String restBaseUrl,
  ) {
    _restClient = RestClient(
      dio,
      baseUrl: restBaseUrl,
    );
  }

  late RestClient _restClient;

//TODO: add methods to fetch data from _restClient
}
