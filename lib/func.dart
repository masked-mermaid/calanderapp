import 'package:calanderapp/hiveObjects/category.dart';
import 'package:calanderapp/hiveObjects/event.dart';
import 'main.dart';

mixin Func {
  //
  addEvent(Event event, Category cat)async{
    event.category.add(cat);
    await eventBox.add(event);
    event.save();
  }
  addCategory(String name){
    
  }
}