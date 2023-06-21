import 'package:chat_app/pages/calls_page.dart';
import 'package:chat_app/pages/contacts_page.dart';
import 'package:chat_app/pages/message_page.dart';
import 'package:chat_app/pages/notification_page.dart';
import 'package:chat_app/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../theme.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({Key? key}) : super(key: key);

   final ValueNotifier<int> pageIndex = ValueNotifier(0);
   final ValueNotifier<String> title = ValueNotifier('Message');

  final pages = [
    MessagesPage(),
    NotificationPage(),
    CallsPage(),
    ContactsPage()
  ];
  final pageTitles = [
    'Messages',
    'Notifications',
    'Calls',
    'Contacts'
  ];

  void _onNavigationItemSelected(index){
    title.value = pageTitles[index];
    pageIndex.value = index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: Theme.of(context).iconTheme,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 54,
        leading: Align(
            alignment: Alignment.centerRight,
            child: IconBackground(icon: Icons.search, onTap: (){print("Search"); },)),
        title: ValueListenableBuilder(
          valueListenable: title,
          builder: (BuildContext context, String value, _){
            return Align(
              alignment: Alignment.center,
              child: Text(
                value,
                style: TextStyle(
                  color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 16
                ),
              ),
            );
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Avatar.small(url: Helper.randomPictureUrl()),
          )
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: pageIndex,
        builder: (BuildContext context, int value, _){
          return pages[value];
        },
      ),
      bottomNavigationBar: _BottomNavigationBar(
        onItemSelected: _onNavigationItemSelected,
      ),
    );
  }

}

class _BottomNavigationBar extends StatefulWidget{

  _BottomNavigationBar({Key? key, required this.onItemSelected}) : super(key: key);

  final ValueChanged<int> onItemSelected;

  @override
  State<_BottomNavigationBar> createState() => _BottomNavigationBarState();
}
class _BottomNavigationBarState extends State<_BottomNavigationBar> {

  int selectedItem = 0;

  //for color change
  void handleItemSelected(int index){
    setState(() {
      selectedItem = index;
    });
    widget.onItemSelected(index);
  }

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return Card(
      margin: EdgeInsets.zero,
      elevation: 0,
      color: (brightness == Brightness.light) ? Colors.transparent : null,
      child: SafeArea(
          top: false,
          bottom: true,
          child: Padding(
            padding: const EdgeInsets.only(top: 16,left: 8,right: 8,bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _NavigationBarItem(label: "Messages", icon: Icons.message, index: 0, isSelected: (selectedItem == 0), onTap:handleItemSelected,),
                _NavigationBarItem(label: "Notification", icon: Icons.notifications_active_outlined,index: 1, isSelected: (selectedItem == 1),onTap: handleItemSelected),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: GlowingActionButton(color: AppColors.secondary,icon: CupertinoIcons.add,onPressed: (){
                    print('New message');
                  },),
                ),
                _NavigationBarItem(label: "Calls", icon: Icons.call,index: 2, isSelected: (selectedItem == 2),onTap: handleItemSelected),
                _NavigationBarItem(label: "Contacts", icon: Icons.perm_contact_calendar_outlined,index: 3, isSelected: (selectedItem == 3),onTap: handleItemSelected),
              ],
            ),
          )),
    );
  }
}
class _NavigationBarItem extends StatelessWidget {
   _NavigationBarItem({Key? key, required this.label, required this.icon, required this.index, this.isSelected = false, required this.onTap}) : super(key: key);
   final String label;
   final IconData icon;
   final int index;
   final bool isSelected;
   final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: (){
        onTap(index);
      },
      child: SizedBox(
        //height: 55,
        width: 60,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 20,color: isSelected ? AppColors.secondary : null,),
            SizedBox(height: 8,),
            Text(label,style: isSelected ? TextStyle(fontSize: 11,fontWeight: FontWeight.bold, color: AppColors.secondary ) : TextStyle(fontSize: 11, ),)
          ],
        ),
      ),
    );
  }
}

