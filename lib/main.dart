import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:logging/logging.dart';

//Theme
import 'theme/light_theme.dart';
//Screens
import 'ui/auth/login_screen.dart';
import 'ui/auth/signup_screen.dart';
import 'ui/book_service/service_details.dart';
import 'ui/home/bookings_screen.dart';
import 'ui/home/home_screen.dart';
import 'ui/home/available_shops_screen.dart';
import 'ui/chatbox/chat_screen.dart';
import 'ui/manage_vehicle/add_vehicle_screen.dart';
import 'ui/manage_vehicle/user_vehicle_list_screen.dart';
import 'ui/payment/payment_screen.dart';
import 'ui/profile/edit_user_address_screen.dart';
import 'ui/profile/edit_user_bio_screen.dart';
import 'ui/profile/edit_user_name_screen.dart';
import 'ui/profile/user_profile_screen.dart';
import 'ui/shop/shop_screen.dart';
import 'ui/shop/service_booking_screen.dart';

//misc
import 'service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  _setupLogging();
  // debugPaintSizeEnabled = true;
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme(context),
      routes: {
        '/': (ctx) => LoginScreen(),
        LoginScreen.routeName: (ctx) => LoginScreen(),
        SignupScreen.routeName: (ctx) => SignupScreen(),
        HomeScreen.routeName: (ctx) => HomeScreen(),
        AvailableShopsScreen.routeName: (ctx) => AvailableShopsScreen(),
        ChatScreen.routeName: (ctx) => const ChatScreen(),
        ShopScreen.routeName: (ctx) => const ShopScreen(),
        ServiceBookingScreen.routeName: (ctx) => const ServiceBookingScreen(),
        UserProfileScreen.routeName: (ctx) => UserProfileScreen(),
        EditUserAddressScreen.routeName: (ctx) => EditUserAddressScreen(),
        EditUserNameScreen.routeName: (ctx) => EditUserNameScreen(),
        EditUserBioScreen.routeName: (ctx) => EditUserBioScreen(),
        AddNewVehicleScreen.routeName: (ctx) => AddNewVehicleScreen(),
        UserVehicleListScreen.routeName: (ctx) => UserVehicleListScreen(),
        ServiceDetails.routeName: (ctx) => ServiceDetails(),
        // PaymentScreen.routeName: (ctx) => PaymentScreen(),
        BookingsScreen.routeName: (ctx) => BookingsScreen(),
      },
      onUnknownRoute: (settings) =>
          MaterialPageRoute(builder: (ctx) => LoginScreen()),
    );
  }
}

void _setupLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((rec) {
    print('${rec.level.name}: ${rec.time}: ${rec.message}');
  });
}
