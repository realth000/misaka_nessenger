import 'package:get/get.dart';

import 'translations_en_us.dart';
import 'translations_zh_cn.dart';

/// All translations.
class MisakaTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': translationEnUS,
        'zh_CN': translationZhCN,
      };
}
