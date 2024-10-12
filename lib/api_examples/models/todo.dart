class Todo {
	int? userId;
	int? id;
	String? title;
	bool? completed;

	Todo({this.userId, this.id, this.title, this.completed});

	factory Todo.fromJson(Map<String, dynamic> json) => Todo(
				userId: json['userId'] as int?,
				id: json['id'] as int?,
				title: json['title'] as String?,
				completed: json['completed'] as bool?,
			);

	Map<String, dynamic> toJson() => {
				'userId': userId,
				'id': id,
				'title': title,
				'completed': completed,
			};
}
