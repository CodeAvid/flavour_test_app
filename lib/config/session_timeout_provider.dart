import 'package:flavour_test_app/pages/my_home_page.dart';
import 'package:flutter/material.dart';
import 'package:local_session_timeout/local_session_timeout.dart';

class SessionTimeoutProvider {
  static final navigatorKey = GlobalKey<NavigatorState>();
  static final scaffoldMessageKey = GlobalKey<ScaffoldMessengerState>();
  static NavigatorState get _navigator => navigatorKey.currentState!;
  static ScaffoldMessengerState get _scaffold =>
      scaffoldMessageKey.currentState!;

  static SessionConfig get sessionConfig {
    return SessionConfig(
        invalidateSessionForAppLostFocus: const Duration(seconds: 5),
        invalidateSessionForUserInactiviity: const Duration(seconds: 1));
  }

  static void init() {
    sessionConfig.stream.listen((SessionTimeoutState timeoutEvent) {
      if (timeoutEvent == SessionTimeoutState.userInactivityTimeout) {
        // handle user  inactive timeout
        print('logout user');
        logoutUser();
      } else if (timeoutEvent == SessionTimeoutState.appFocusTimeout) {
        // handle user  app lost focus timeout
        print('logout user');
        logoutUser();
      }
    });
  }

  static logoutUser() {
    _navigator.pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => MyHomePage()),
      (route) => false,
    );
    _scaffold.showSnackBar(
      SnackBar(
        content: Text('logout user'),
        duration: Duration(seconds: 1),
      ),
    );
  }
}
