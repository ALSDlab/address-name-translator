import 'package:go_router/go_router.dart';
import 'package:name_address_translator/viewmodels/screen_control_viewmodel.dart';
import 'package:name_address_translator/views/widgets/screen_control.dart';
import 'package:provider/provider.dart';

final router = GoRouter(routes: [
  GoRoute(path: '/',
  builder: (context, state) => ChangeNotifierProvider(
    create: (context) => ScreenIndexProvider(),
    child: const ScreenControl(),
  ),)
]);
