import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:webadmin/views/screens/side_bar_screens/categories_screen.dart';
import 'package:webadmin/views/screens/side_bar_screens/dashboard_screen.dart';
import 'package:webadmin/views/screens/side_bar_screens/order_screen.dart';
import 'package:webadmin/views/screens/side_bar_screens/product_screen.dart';
import 'package:webadmin/views/screens/side_bar_screens/upload_banner.dart';
import 'package:webadmin/views/screens/side_bar_screens/vendor_screen.dart';
import 'package:webadmin/views/screens/side_bar_screens/withdraw_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Widget _selectedItem = DashBoardScreen();
  screenSlector(item) {
    switch (item.route) {
      case DashBoardScreen.routeName:
        setState(() {
          _selectedItem = DashBoardScreen();
        });
        break;
      case VendorScreen.routeName:
        setState(() {
          _selectedItem = VendorScreen();
        });
        break;
      case WithdrawalScreen.routeName:
        setState(() {
          _selectedItem = WithdrawalScreen();
        });
        break;
      case OrderScreen.routeName:
        setState(() {
          _selectedItem = OrderScreen();
        });
        break;
      case CategoriesScreen.routeName:
        setState(() {
          _selectedItem = CategoriesScreen();
        });
        break;
      case ProductScreen.routeName:
        setState(() {
          _selectedItem = ProductScreen();
        });
        break;
      case UploadBannerScreen.routeName:
        setState(() {
          _selectedItem = UploadBannerScreen();
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      backgroundColor: Colors.white,
      sideBar: SideBar(
        items: [
          AdminMenuItem(
              title: 'Dashboard',
              icon: Icons.dashboard_customize_outlined,
              route: DashBoardScreen.routeName),
          AdminMenuItem(
              title: 'Vendors',
              icon: CupertinoIcons.person_3,
              route: VendorScreen.routeName),
          AdminMenuItem(
              title: 'withdraw',
              icon: CupertinoIcons.money_dollar,
              route: WithdrawalScreen.routeName),
          AdminMenuItem(
              title: 'Orders',
              icon: CupertinoIcons.shopping_cart,
              route: OrderScreen.routeName),
          AdminMenuItem(
              title: 'Categories',
              icon: Icons.category,
              route: CategoriesScreen.routeName),
          AdminMenuItem(
              title: 'Products',
              icon: Icons.shop,
              route: ProductScreen.routeName),
          AdminMenuItem(
              title: 'Upload Banners',
              icon: CupertinoIcons.add,
              route: UploadBannerScreen.routeName),
        ],
        selectedRoute: '',
        onSelected: (item) {
          screenSlector(item);
        },
        header: Container(
          height: 50,
          width: double.infinity,
          color: const Color(0xff444444),
          child: const Center(
            child: Text(
              'Addy Panel',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
        footer: Container(
          height: 50,
          width: double.infinity,
          color: const Color(0xff444444),
          child: const Center(
            child: Text(
              'Panel',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      body: _selectedItem,
    );
  }
}
