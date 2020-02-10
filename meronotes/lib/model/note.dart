class Note{
  final String title;
  final String id;
  final String description;
  final DateTime createdAt;
  final  String userID;

  Note({this.title, this.id, this.description, this.createdAt, this.userID });

  Note.fromDS(String id,Map<String,dynamic>data):
  id=id,
  title = data['title'],
  description =data['description'],
  userID = data['userID'],
  createdAt = data['createdAt']?.toDate();

  Map<String,dynamic>toMap()=>{
    "title":title,
    "description":description,
    "createdAt":createdAt,
    "userID":userID
  };

}