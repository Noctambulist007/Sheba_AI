import 'package:sheba_ai/data/datasource/remote/model/response/medicine/dosage_form_response_data.dart';
import 'package:sheba_ai/domain/model/medicine/dosage_form.dart';

extension DosageFormResponseMapper on DosageFormResponseData {
  DosageForm toDosageForm() {
    return DosageForm(
      dosageFormId: dosageFormId,
      name: name,
      slug: slug,
      genericsCount: genericsCount,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
