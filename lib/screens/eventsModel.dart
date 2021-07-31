class eventsModel{
  //data Type
  int time;
  String title;
  String location;

// constructor
  eventsModel(
      {
        this.time,
        this.title,
        this.location,
      }
      );

  //method that assign values to respective datatype vairables
  eventsModel.fromJson(Map<String,dynamic> json)
  {
    time= json['time'];
    title =json['title'];
    location= json['location'];
  }
}