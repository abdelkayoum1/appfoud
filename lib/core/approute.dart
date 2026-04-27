import 'package:appfoud/feature/button_nav_bar/presentation/screen/nav_bar.dart';
import 'package:appfoud/feature/foud_detail/home/model/foud_detail/meal.dart';
import 'package:appfoud/feature/foud_detail/presentation/screen/foud_detail.dart';
import 'package:appfoud/feature/foud_detail_by_category/presentation/screen/fouddetail_by_id.dart';
import 'package:appfoud/feature/login/screen/login_home.dart';
import 'package:appfoud/feature/presentation/screnn/foud_home.dart';
import 'package:appfoud/feature/sign%20up/screen/singn.dart';
import 'package:appfoud/splash.dart';
import 'package:go_router/go_router.dart';

// GoRouter configuration
class Approute {
  static const loginhome = '/login';
  static const navbar = '/navbar';
  //static const homefoud = '/homefoud';
  static const fouddetail = '/foudetail';
  static const fouddetailid = '/fouddetailbyid';
  static const signin = '/signin';
  static final router = GoRouter(
    routes: [
      GoRoute(path: navbar, builder: (context, state) => NavBar()),
      GoRoute(path: '/', builder: (context, state) => Splash()),

      // GoRoute(path: homefoud, builder: (context, state) => FoudHome()),
      GoRoute(
        path: fouddetail,
        builder: (context, state) => FoudDetail(meal: state.extra as String),
      ),

      GoRoute(
        path: fouddetailid,
        builder: (context, state) => FouddetailById(id: state.extra as dynamic),
      ),
      GoRoute(path: loginhome, builder: (context, state) => LoginHome()),
      GoRoute(path: signin, builder: (context, state) => SignIn()),
    ],
  );
}
