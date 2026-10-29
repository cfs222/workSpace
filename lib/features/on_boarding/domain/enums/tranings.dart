import 'package:himah/core/constants/app_assets.dart';

enum Tranings {
  fullBody('الجسم كامل', AppAssets.fullBody),
  push('دفع', AppAssets.push),
  pull('سحب', AppAssets.pull),
  leg('أرجل', AppAssets.leg),
  upper('علوي', AppAssets.upper),
  lower('سفلي', AppAssets.lower),
  posterior('السلسلة الخلفية', AppAssets.posterior),
  anterior('السلسلة الأمامية', AppAssets.anterior),
  rest('راحة', AppAssets.rest);

  final String label;
  final String iconPath;

  const Tranings(this.label, this.iconPath);
}
