import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/home/presentation/ui/pages/home_page.dart';

part 'route_name.dart';

final GoRouter _appRouter = GoRouter(
  initialLocation: '/home',
  routes: <RouteBase>[
    GoRoute(
      path: '/home',
      name: RouteName.home,
      builder: (context, state) => const HomePage(),
    ),
  ],
);

final appRouter = Provider((ref) => _appRouter);
