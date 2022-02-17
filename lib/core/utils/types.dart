import 'package:flutter/foundation.dart';

enum ExcuseCategory { family, office, children, college, party }

List<String> get excuseCategories => ExcuseCategory.values.map((e) => describeEnum(e)).toList();
