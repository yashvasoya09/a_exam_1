import 'package:a_exam_1/screen/Model/search_model.dart';
import 'package:a_exam_1/screen/utils/api_helper.dart';
import 'package:flutter/foundation.dart';

class EProvider extends ChangeNotifier
{
  Future<EModel> getData()
  {
    return apiHelper.apihelper.api_helper();
  }
}