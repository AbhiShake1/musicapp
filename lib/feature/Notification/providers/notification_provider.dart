import 'package:fyp/api/django_api.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final notificationRef =
    FutureProvider((_) async => await DjangoApi.getNotifications());
