/// class to use in calendar.
class Event {
  final String title;
  final String description;
  final String location;
  final DateTime startDate;
  final DateTime endDate;

  Event({
    required this.description,
    required this.location,
    required this.startDate, 
    required this.endDate, 
    required this.title
  });
}
