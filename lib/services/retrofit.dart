import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'retrofit.g.dart';

@RestApi(baseUrl: "https://jsonplaceholder.typicode.com")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;


  static RestClient getAPI(){
    Dio dio = new Dio();
    dio.interceptors.add(LogInterceptor());
    RestClient restClient = RestClient(dio);
    return restClient;
  }


  @GET("/todos/1")
  Future<Task> getTasksForOne();

  @GET("/todos")
  Future<List<Task>> getTasks();

  @GET("/photos")
  Future<List<Photo>> getPhotes(@Query("albumId") int id);
}




@JsonSerializable()
class Task {
  int? userId;
  int? id;
  String? title;
  bool? completed;

  Task({this.userId, this.id, this.title, this.completed});

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
  Map<String, dynamic> toJson() => _$TaskToJson(this);
}




@JsonSerializable()
class Photo {
  int? albumId;
  int? id;
  String? title;
  String? url;
  String? thumbnailUrl;

  Photo({this.albumId, this.id, this.title, this.url,this.thumbnailUrl });

  factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);
  Map<String, dynamic> toJson() => _$PhotoToJson(this);
}

