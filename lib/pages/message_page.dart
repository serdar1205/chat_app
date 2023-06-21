import 'package:chat_app/screens/message_screen.dart';
import 'package:chat_app/theme.dart';
import 'package:chat_app/widgets/avatar.dart';
import 'package:chat_app/widgets/helpers.dart';
import 'package:flutter/material.dart';
import '../models/model.dart';
import 'package:faker/faker.dart';
import 'package:jiffy/jiffy.dart';

class MessagesPage extends StatelessWidget {
  const MessagesPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: _Stories(),
          ),
        ),
        SliverList(delegate: SliverChildBuilderDelegate(_delegate))
      ],
    );
  }

  Widget _delegate(BuildContext context, int index) {
    final faker = Faker();
    final date = Helper.randomDate();
    return _MessageTitle(
        messageData: MessageData(
            senderName: faker.person.name(),
            message: faker.lorem.sentence(),
            messageDate: date,
            dateMessage: Jiffy(date).fromNow(),
            profilePicture: Helper.randomPictureUrl()
        ));
  }
}

class _MessageTitle extends StatelessWidget {
  const _MessageTitle({super.key, required this.messageData});

  final MessageData messageData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(ChatScreen.route(messageData));
      },
      child: Container(
        height: 100,
        margin: EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.grey,
              width: 0.2
            )
          )
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Avatar.medium(url: messageData.profilePicture),
              ),
              Expanded(child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text(messageData.senderName,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                      letterSpacing: 0.2,
                      wordSpacing: 1.5,
                      fontWeight: FontWeight.bold
                    ),),
                  ),
                  SizedBox(
                      height: 20,
                      child: Text(messageData.message,overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                          fontSize: 12,color: AppColors.textFaded

                        ),),),
                ],
              )),
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 4,),
                    Text(messageData.dateMessage.toUpperCase(),overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        letterSpacing: -0.2,
                          fontWeight: FontWeight.w600,
                          fontSize: 11,
                          color: AppColors.textFaded

                      ),),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      height: 18,
                      width: 18,
                      decoration: BoxDecoration(
                        color: AppColors.secondary,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text('1',
                          style: TextStyle(
                              fontSize: 10,
                              color: AppColors.textLight
                          ),),
                      ),
                    )
                  ],
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}

class _Stories extends StatelessWidget {
  const _Stories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: EdgeInsets.all(8),
      child: SizedBox(
        height: 134,

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, bottom: 16, top: 8),
              child: Text("Strories", style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w900,
                  color: AppColors.textFaded
              ),),
            ),
            Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    final faker = Faker();
                    return SizedBox(
                      width: 70,
                      child: _StroryCard(storyData: StoryData(
                          name: faker.person.name(),
                          url: Helper.randomPictureUrl()
                      )),
                    ); //_StroryCard(storyData: );
                  }),
            )
          ],
        ),
      ),
    );
  }
}

class _StroryCard extends StatelessWidget {
  _StroryCard({Key? key, required this.storyData}) : super(key: key);
  final StoryData storyData;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Avatar.medium(url: storyData.url,),
        Expanded(child: Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            storyData.name,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontSize: 11,
                letterSpacing: 0.3,
                fontWeight: FontWeight.bold
            ),
          ),
        ))
      ],
    );
  }
}


