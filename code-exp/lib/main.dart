import 'package:code_exp/AuthService.dart';
import 'package:code_exp/myUser.dart';
import 'package:code_exp/pages/FITPlan.dart';
import 'package:code_exp/pages/ecanteen.dart';
import 'package:code_exp/pages/homepage.dart';
import 'package:code_exp/pages/newUserData.dart';
import 'package:code_exp/pages/userpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'package:code_exp/firedb.dart';

// Code starts here
Future<void> main() async {
  // Initialise firebase shit
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Run the app (Main Widget, below)
  runApp(const Main());
}

// This is the first widget ran
class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      // Providers here are used for Auth purposes
      providers: [
        // This is to allow us to access auth methods like sign in, sign out and sign up
        Provider<AuthService>(
          create: (_) => AuthService(FirebaseAuth.instance),
        ),
        ChangeNotifierProvider(create: (_) => myUser()),
        // Subscribe to the stream service, detect any changes
        StreamProvider(
          create: (context) => context.read<AuthService>().authStateChanges,
          initialData: null,
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
          title: 'Login Page',
          theme: ThemeData(
              fontFamily: 'Lato',
              primarySwatch: Colors.green,
              visualDensity: VisualDensity.adaptivePlatformDensity),
          initialRoute: '/',
          routes: {
            '/': (context) => AuthWrapper(),
            '/eCanteen-screen': (context) => EcanteenScreen(),
            '/home': (context) => Home(),
            '/userhome': (context) => UserHome(),
            '/getstarted': (context) => newUserData(),
            '/FITplan': (context) => FITPlan(),
          }),
    );
  }
}

// Auth Wrapper will decide whether user is logged in or not,
// Logged In => UserHome(); (userpage.dart)
// Not Logged In => Home(); (homepage.dart)
class AuthWrapper extends StatefulWidget {
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  State<AuthWrapper> createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();

    // User not null, so logged in, show user's home page
    if (firebaseUser != null) {
      firedb.getUserInfo(context);
      return UserHome();
    }
    // User is null, so show the home page to prompt user to login first
    return UserHome();
  }
}
