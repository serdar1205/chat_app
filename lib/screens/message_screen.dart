
import 'package:chat_app/models/message_data.dart';
import 'package:chat_app/theme.dart';
import 'package:chat_app/widgets/icon_buttons.dart';
import 'package:chat_app/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  static Route route(MessageData data) =>
      MaterialPageRoute(builder: (context) => ChatScreen(messageData: data));

  ChatScreen({Key? key, required this.messageData}) : super(key: key);

  MessageData messageData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      iconTheme: Theme.of(context).iconTheme,
      centerTitle: false,
      backgroundColor: Colors.transparent,
      elevation: 0,
      leadingWidth: 45,
      leading: Align(
        alignment: Alignment.centerRight,
        child: IconBackground(
          icon: CupertinoIcons.back, onTap: () {
          Navigator.of(context).pop();
        },
        ),
      ),
      title: _AppBarTitle(
        messageData: messageData,
      ),
      actions: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Center(child: IconBorder(
              icon: CupertinoIcons.video_camera_solid,
              onTap:(){}
          ),),) ,
        Padding(
          padding: EdgeInsets.only(right: 20),
          child: Center(
            child: IconBorder(
                icon: CupertinoIcons.phone_solid,
                onTap:(){}
            ),),)
      ],
    ),
      body: Column(
        children: [
          Expanded(child: _DemoMessageList()),
          _ActionBar()
        ],
      ),
    );
  }
}

class _AppBarTitle extends StatelessWidget {
   _AppBarTitle({Key? key,
    required this.messageData
   }) : super(key: key);

  MessageData messageData;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Avatar.small(url: messageData.profilePicture),
        SizedBox(width: 16,),
        Expanded(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              messageData.senderName,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 14,),),
            SizedBox(height: 2,),
            Text("Online",
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: Colors.green
            ),
            )
          ],
        ))
      ],
    );
  }
}

class _DemoMessageList extends StatelessWidget {
  const _DemoMessageList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _DateLable(lable: "01.03.2023"),
        _MessageTile(
            message: "Hi Serdar! Don't share your idea until you do it!",
            messageDate: '07:00'),
        _MessageOwnTile(message: "I agree with you", messageDate: '07:07'),
        _MessageTile(
            message: "Do you want to be trader? ",
            messageDate: '09:00'),
        _MessageOwnTile(message: "I think so", messageDate: '09:09'),

        _DateLable(lable: "Yesterday"),

        _MessageTile(
            message: "Bid your money to get auction",
            messageDate: '20:45'),
        _MessageOwnTile(message: 'Ok, how much I have to bid for the first time?', messageDate: '20:46'),
        _MessageTile(
            message: "\$1000 it is good for the first time",
            messageDate: '20:47'),
      ],
    );
  }
}

class _DateLable extends StatelessWidget {
   _DateLable({Key? key, required this.lable}) : super(key: key);

  String lable;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 32),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(12)
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 4,horizontal: 12),
            child: Text(
              lable, style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: AppColors.textFaded
            ),
            ),
          ),
        ),
      ),
    );
  }
}

class _MessageTile extends StatelessWidget {
   _MessageTile({Key? key, required this.message, required this.messageDate}) : super(key: key);

  String message;
  String messageDate;

  static double _borderRadius = 26;

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.symmetric(vertical: 4,horizontal: 8),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(_borderRadius),
                  topRight: Radius.circular(_borderRadius),
                  bottomRight: Radius.circular(_borderRadius)
                )
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12,vertical: 20),
                child: Text(message),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 8),
            child: Text(messageDate,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: AppColors.textFaded
            ),),
            )
          ],
        ),
      ),
    );
  }
}

class _MessageOwnTile extends StatelessWidget {
   _MessageOwnTile({Key? key, required this.message, required this.messageDate}) : super(key: key);

  String message;
  String messageDate;

  static double _borderRadius = 26;

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.symmetric(vertical: 4,horizontal: 8),
      child: Align(
        alignment: Alignment.centerRight,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColors.secondary,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(_borderRadius),
                  bottomLeft: Radius.circular(_borderRadius),
                  bottomRight: Radius.circular(_borderRadius)
                )
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12,vertical: 20),
                child: Text(message),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 8),
            child: Text(messageDate,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: AppColors.textFaded
            ),),
            )
          ],
        ),
      ),
    );
  }
}

class _ActionBar extends StatelessWidget {
  const _ActionBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        bottom: true,
        top: false,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    right: BorderSide(
                      width: 2,
                      color: Theme.of(context).dividerColor
                    )
                  )
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Icon(
                    CupertinoIcons.camera_fill
                  ),
                ),
              ),
              Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 16),
                    child: TextField(
                      style: TextStyle(
                        fontSize: 14),
                      decoration: InputDecoration(
                        hintText: "Type something",
                        border: InputBorder.none
                      ),
                    ),
                  ),),
              Padding(
                  padding: EdgeInsets.only(left: 10,right: 10),
              child: GlowingActionButton(
                color: AppColors.accent,
                icon: Icons.send_rounded,
                onPressed: (){
                  print('Message has gone');
                },
              ),)

            ],
          ),
        ));
  }
}





