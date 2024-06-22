/// class to use in calendar.
class Event {
  String title;
  String description;
  String location;
  DateTime startDate;
  DateTime endDate;

  Event({
    required this.description,
    required this.location,
    required this.startDate, 
    required this.endDate, 
    required this.title
  });
}
