
import 'dart:math';

abstract class Helper{
  static final random = Random();

  static String randomPictureUrl(){
    final randomInt = random.nextInt(1000);
    //return '//https:picsum.photos/seed/$randomInt/300/300';
    return 'https://images.unsplash.com/photo-1676973440045-f1b8f5abe88f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=435&q=$randomInt';
  }

  static DateTime randomDate(){
    final random = Random();
    final currentTime = DateTime.now();
    return currentTime.subtract(Duration(seconds: random.nextInt(200000)));
  }

}