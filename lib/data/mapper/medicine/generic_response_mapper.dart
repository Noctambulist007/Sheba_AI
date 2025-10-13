import 'package:sheba_ai/data/datasource/remote/model/response/medicine/generic_response_data.dart';
import 'package:sheba_ai/domain/model/medicine/generic.dart';

extension GenericResponseMapper on GenericResponseData {
  Generic toGeneric() {
    return Generic(
      genericId: genericId,
      name: name,
      slug: slug,
      brandNamesCount: brandNamesCount,
    );
  }
}
