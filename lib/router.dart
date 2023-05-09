import 'package:client/lists/usersList.dart';
import 'package:client/models/libraryModel/library.dart';
import 'package:client/models/userModel/userLibrary.dart';
import 'package:client/screens/accountScreen/accountScreen.dart';
import 'package:client/screens/addLibrary.dart';
import 'package:client/screens/addScreen.dart';
import 'package:client/screens/book/book_screen.dart';
import 'package:client/screens/changeUserData/changeEmailScreen.dart';
import 'package:client/screens/changeUserData/changePasswordScreen.dart';
import 'package:client/screens/changeUserData/changeUsernameScreen.dart';
import 'package:client/screens/historyLoan/loan_history_librarian.dart';
import 'package:client/screens/historyLoan/loan_history_user.dart';
import 'package:client/screens/home/home_screen.dart';
import 'package:client/screens/librariesScreen.dart';
import 'package:client/screens/loginScreen.dart';
import 'package:client/screens/myLoansScreen.dart';
import 'package:client/screens/resetPassword.dart';
import 'package:client/screens/searchScreen.dart';
import 'package:client/screens/signupScreen.dart';
import 'package:client/screens/userDetails.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:tuple/tuple.dart';

final GoRouter router = GoRouter(
  initialLocation: '/login',
  routes: <RouteBase>[
    GoRoute(
      path: '/login',
      builder: (BuildContext context, GoRouterState state) {
        return const LoginScreen();
      },
    ),
    GoRoute(
      path: '/signUp',
      builder: (BuildContext context, GoRouterState state) {
        return const SignUpScreen();
      },
    ),
    GoRoute(
      path: '/resetPassword',
      builder: (BuildContext context, GoRouterState state) {
        return const ResetPassword();
      },
    ),
    ShellRoute(
        builder: (context, state, child) {
          return MyHomePage(
            title: appBar[state.matchedLocation] ?? "BookApp",
            child: child,
          );
        },
        routes: <RouteBase>[
          GoRoute(
            path: '/loans/history/user',
            builder: (BuildContext context, GoRouterState state) {
              return const LoanHistoryUser();
            },
          ),
          GoRoute(
            path: '/loans/history/librarian',
            builder: (BuildContext context, GoRouterState state) {
              return const LoanHistoryLibrarian();
            },
          ),
          GoRoute(
            path: '/wishList',
            builder: (BuildContext context, GoRouterState state) {
              return const MyLoansScreen();
            },
          ),
          GoRoute(
            path: '/book/search',
            builder: (BuildContext context, GoRouterState state) {
              return const SearchScreen();
            },
          ),
          GoRoute(
            path: '/book/details/:bookID',
            builder: (BuildContext context, GoRouterState state) {
              return BookDetailsScreen(bookID: state.pathParameters['bookID']!,);
            },
          ),
          GoRoute(
            path: '/book/create',
            builder: (BuildContext context, GoRouterState state) {
              return BookCreator();
            },
          ),
          GoRoute(
            path: '/library',
            builder: (BuildContext context, GoRouterState state) {
              return LibrariesScreen();
            },
          ),
          GoRoute(
            path: '/library/add',
            builder: (BuildContext context, GoRouterState state) {
              var library = state.extra as Library?;
              return AddLibrary(
                library: library,
              );
            },
          ),
          GoRoute(
            path: '/user/list/:sort/:userType/:screenType',
            builder: (BuildContext context, GoRouterState state) {
              var extraParams = state.extra! as Tuple2<Function?, Library?>;
              return UsersList(
                search: "",
                sort: state.pathParameters['sort']!,
                userType: state.pathParameters['userType']!,
                screenType: state.pathParameters['screenType']!,
                callBack: extraParams.item1,
                library: extraParams.item2,
              );
            },
          ),
          GoRoute(
            path: '/user/details',
            builder: (BuildContext context, GoRouterState state) {
              var user = state.extra! as UserLibrary;
              return UserDetails(user: user);
            },
          ),
          GoRoute(
            path: '/user/change/username',
            builder: (BuildContext context, GoRouterState state) {
              return ChangeUsernameScreen();
            },
          ),
          GoRoute(
            path: '/user/change/email',
            builder: (BuildContext context, GoRouterState state) {
              return ChangeEmailScreen();
            },
          ),
          GoRoute(
            path: '/user/change/password',
            builder: (BuildContext context, GoRouterState state) {
              return ChangePasswordScreen();
            },
          ),
          GoRoute(
            path: '/settings',
            builder: (BuildContext context, GoRouterState state) {
              return const AccountScreen();
            },
          ),
        ])
  ],
);

Map<String, String> appBar = {
  '/loans/history/user': "My loans",
  '/loans/history/librarian': "Library loans",
  '/wishList': "Wish list",
  '/book/search': "Search books",
  '/book/details': "Book details",
  '/book/create': "Manage book",
  '/library': "Libraries",
  '/library/add': 'Manage libraries',
  '/user/details': "User details",
  '/user/change/username': "Change username",
  '/user/change/email': "Change E-mail",
  '/user/change/password': "Change password",
  '/settings': "Settings"
};
