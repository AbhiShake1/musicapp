import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show MaterialPageRoute;
import 'package:hooks_riverpod/hooks_riverpod.dart';

extension ContextX on BuildContext {
  Result read<Result>(
    ProviderBase<Result> provider,
  ) {
    return ProviderScope.containerOf(this).read(provider);
  }
}
