import 'package:flutter/cupertino.dart';

import '../../classes/classes.dart';

Widget loading({Color? cor}) {
  return Center(
    child: CupertinoActivityIndicator(
      color: cor ?? Cores.preto,
    ),
  );
}
