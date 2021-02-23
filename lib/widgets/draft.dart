// import 'package:AhlanWaSahln/Screens/Categories_screen.dart';
// import 'package:AhlanWaSahln/Screens/shops_screen.dart';
// import 'package:AhlanWaSahln/providers/pages.dart' as provider;
// import 'package:AhlanWaSahln/providers/shops.dart';
// import 'package:AhlanWaSahln/widgets/badge.dart';
// import 'package:AhlanWaSahln/widgets/products_list.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import 'main_screen.dart';

// class BottomNavScreen extends StatefulWidget {
//   BottomNavScreen();
//   @override
//   _BottomNavScreenState createState() => _BottomNavScreenState();
// }

// class _BottomNavScreenState extends State<BottomNavScreen> {
//   List<dynamic> _pages;
//   int _pageIndex;
//   PageController _controller = PageController();

//   void selectTap(index) {
//     setState(() {
//       _controller.jumpToPage(index);
//     });
//   }

//   @override
//   void didChangeDependencies() {
//     final pagesPovider = Provider.of<provider.Pages>(context);
//     _pages = pagesPovider.pages;
//     _pageIndex = pagesPovider.currentPageIndex;

//     super.didChangeDependencies();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final pagesPovider = Provider.of<provider.Pages>(context);

//     return Scaffold(
//       appBar: AppBar(
//         title: Container(
//           // width: 100,
//           // height: 50,
//           child: Row(
//             children: [
//               Badge(
//                   child: IconButton(
//                     icon: Icon(Icons.shopping_cart_outlined),
//                     onPressed: () {},
//                   ),
//                   value: "0"),
//               IconButton(
//                 icon: Icon(Icons.notifications_none),
//                 onPressed: () {},
//               ),
//             ],
//           ),
//         ),
//         actions: [
//           Center(
//             child: Padding(
//               padding: EdgeInsets.all(5),
//               child: Text(
//                 _pages[_pageIndex]['title'],
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//       body: PageView(
//         children: pagesPovider.pagesWidget,
//         controller: _controller,
//         onPageChanged: (index) {
//           pagesPovider.changePage(index);
//         },
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         onTap: selectTap,
//         currentIndex: _pageIndex,
//         selectedItemColor: Theme.of(context).accentColor,
//         unselectedItemColor: Colors.grey,
//         items: _pages
//             .map(
//               (page) => BottomNavigationBarItem(
//                 icon: Icon(page['icon']),
//                 label: page['title'],
//               ),
//             )
//             .toList(),
//       ),
//     );
//   }
// }
