import 'package:flutter/material.dart';
import 'package:nutri_edge/layout/Navbar.dart';

class Layout extends StatelessWidget {
  final String? title;
  final Widget child;
  final List<Widget>? appBarActions;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final bool? showNavbar;
  const Layout(
      {super.key,
      this.title,
      required this.child,
      this.appBarActions,
      this.floatingActionButton,
      this.showNavbar,
      this.floatingActionButtonLocation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        forceMaterialTransparency: true,
        title: Text(
          title ?? '',
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: appBarActions != null
            ? [
                ...appBarActions!,
                const SizedBox(
                  width: 10,
                )
              ]
            : [],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: child,
      ),
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: showNavbar == false ? null : const Navbar(),
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation:
          floatingActionButtonLocation ?? FloatingActionButtonLocation.endFloat,
    );
  }
}
