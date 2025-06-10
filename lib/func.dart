import 'package:calanderapp/hiveObjects/category.dart';
import 'package:calanderapp/hiveObjects/event.dart';
import 'main.dart';

mixin Func {
  //add event
  addEvent(Event event, Category cat)async{
    event.category.add(cat);
    await eventBox.add(event);
    event.save();
  }
  // add category
  addCategory(Category category)async{

    await categoryBox.add(category);

  }
  // read events
  List<Event> getEventByDate(DateTime dateTime){
    return eventBox.values.where((event)=>event.date==dateTime).toList();
  }
  updateEvent(Event event, Category cat)async{
    event.category.clear();
    event.category.add(cat);
    await eventBox.put(event.key,event);
    event.save();

  }
  // delete 
  deleteEvent(Event event)async{
    await eventBox.delete(event.key);


  }
  // search
  List<Event> searchEvent(String searchWord){
    return eventBox.values.where((event)=>event.eventName.contains(searchWord)||
     event.eventDescription.contains(searchWord)|| 
    event.category[0].name.contains(searchWord)).toList();
  }
  List<Event> getByCategory(String category){
    return eventBox.values.where((event)=> event.category[0].name.contains(category)).toList();
  }
  
  }