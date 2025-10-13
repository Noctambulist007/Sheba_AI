import 'package:sheba_ai/data/datasource/remote/model/response/medicine/manufacturer_response_data.dart';
import 'package:sheba_ai/domain/model/medicine/manufacturer.dart';

extension ManufacturerResponseMapper on ManufacturerResponseData {
  Manufacturer toManufacturer() {
    return Manufacturer(
      manufacturerId: manufacturerId,
      name: name,
      slug: slug,
      genericsCount: genericsCount,
      brandNamesCount: brandNamesCount,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
