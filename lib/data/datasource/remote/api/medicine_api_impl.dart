import 'package:sheba_ai/data/datasource/remote/api/medicine_api.dart';
import 'package:sheba_ai/data/datasource/remote/model/response/medicine/medicine_list_response.dart';
import 'package:sheba_ai/data/datasource/remote/util/api_client.dart';
import 'package:sheba_ai/data/mapper/medicine/medicine_list_response_mapper.dart';
import 'package:sheba_ai/domain/model/medicine/medicine.dart';

class MedicineApiImpl extends MedicineApi {
  final ApiClient _client;

  static const getAllMedicinesUrl = 'medicines/medicines/';

  MedicineApiImpl({required ApiClient client}) : _client = client;

  @override
  Future<List<Medicine>> getAllMedicines({int? page, String? search}) async {
    final response = await _client.get<JSONObject, MedicineListResponse>(
      path: getAllMedicinesUrl,
      queryParameters: {
        if (page != null) 'page': page,
        if (search != null && search.isNotEmpty) 'search': search,
      },
      converter: (json) => MedicineListResponse.fromJson(json),
    );
    return response.toMedicineList();
  }
}
