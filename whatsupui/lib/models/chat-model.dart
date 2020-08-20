class ChatModel {
  final String name;
  final String message;
  final String time;
  final String avatarUrl;

  ChatModel({this.name, this.message, this.time, this.avatarUrl});
}

List<ChatModel> dummyData = [
  ChatModel(
    name: "Abhishek Sen",
    message: "Hey Welcome to Flutter!",
    time: "15:30",
    avatarUrl:
        "https://images.unsplash.com/photo-1536164261511-3a17e671d380?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=930&q=80",
  ),
  ChatModel(
    name: "Abhishek Sen",
    message: "Hey Welcome to Butter!",
    time: "17:30",
    avatarUrl:
        "https://images.unsplash.com/photo-1536164261511-3a17e671d380?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=930&q=80",
  ),
  ChatModel(
    name: "Abhishek Sen",
    message: "Hey See to Flutter!",
    time: "04:55",
    avatarUrl:
        "https://images.unsplash.com/photo-1536164261511-3a17e671d380?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=930&q=80",
  ),
];
