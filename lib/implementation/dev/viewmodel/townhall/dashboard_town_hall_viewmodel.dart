
import 'package:injectable/injectable.dart';
import 'package:petsus/api/model/news/news.dart';
import 'package:petsus/page/dashboard/viewmodel/dashboard_viewmodel.dart';

@Environment(Environment.dev)
@Injectable(as: DashboardViewModel)
class DashboardTownHallViewModelDev extends DashboardViewModel {
  @override
  Future<String> username() async => 'Adashino Benio';

  @override
  Future<List<News>> news() async {
    return [
      News(id: 1, title: 'Yukari Tabeka 0', image: 'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/55de75ec-40b5-4beb-8cab-d5d8bb9a8538/dfzjmwh-aac79208-c74c-4244-ab29-cf0cabe8acdf.jpg/v1/fill/w_800,h_1000,q_70,strp/yukari_takeba_from_persona_3_reload_by_monchazo_dfzjmwh-pre.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9MTYwMCIsInBhdGgiOiJcL2ZcLzU1ZGU3NWVjLTQwYjUtNGJlYi04Y2FiLWQ1ZDhiYjlhODUzOFwvZGZ6am13aC1hYWM3OTIwOC1jNzRjLTQyNDQtYWIyOS1jZjBjYWJlOGFjZGYuanBnIiwid2lkdGgiOiI8PTEyODAifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6aW1hZ2Uub3BlcmF0aW9ucyJdfQ.VEeLAZdRYJmQ-L7rz-c9iNwQnqZTLo5x7_h4RAtXGtI'),
      News(id: 2, title: 'Adashino Benio 1', image: 'https://images4.alphacoders.com/941/941989.png'),
      News(id: 3, title: 'Yukari Tabeka 2', image: 'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/55de75ec-40b5-4beb-8cab-d5d8bb9a8538/dfzjmwh-aac79208-c74c-4244-ab29-cf0cabe8acdf.jpg/v1/fill/w_800,h_1000,q_70,strp/yukari_takeba_from_persona_3_reload_by_monchazo_dfzjmwh-pre.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9MTYwMCIsInBhdGgiOiJcL2ZcLzU1ZGU3NWVjLTQwYjUtNGJlYi04Y2FiLWQ1ZDhiYjlhODUzOFwvZGZ6am13aC1hYWM3OTIwOC1jNzRjLTQyNDQtYWIyOS1jZjBjYWJlOGFjZGYuanBnIiwid2lkdGgiOiI8PTEyODAifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6aW1hZ2Uub3BlcmF0aW9ucyJdfQ.VEeLAZdRYJmQ-L7rz-c9iNwQnqZTLo5x7_h4RAtXGtI'),
      News(id: 4, title: 'Adashino Benio 3', image: 'https://images4.alphacoders.com/941/941989.png'),
      News(id: 5, title: 'Yukari Tabeka 4', image: 'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/55de75ec-40b5-4beb-8cab-d5d8bb9a8538/dfzjmwh-aac79208-c74c-4244-ab29-cf0cabe8acdf.jpg/v1/fill/w_800,h_1000,q_70,strp/yukari_takeba_from_persona_3_reload_by_monchazo_dfzjmwh-pre.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9MTYwMCIsInBhdGgiOiJcL2ZcLzU1ZGU3NWVjLTQwYjUtNGJlYi04Y2FiLWQ1ZDhiYjlhODUzOFwvZGZ6am13aC1hYWM3OTIwOC1jNzRjLTQyNDQtYWIyOS1jZjBjYWJlOGFjZGYuanBnIiwid2lkdGgiOiI8PTEyODAifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6aW1hZ2Uub3BlcmF0aW9ucyJdfQ.VEeLAZdRYJmQ-L7rz-c9iNwQnqZTLo5x7_h4RAtXGtI'),
    ];
  }

  @override
  Future<List<News>> schedule() async {
    return [
      News(id: 6, title: 'Margaret 1', image: 'https://i.pinimg.com/originals/35/f5/f7/35f5f7cfeecdbaee6386375bc778fe5e.jpg'),
      News(id: 7, title: 'Elizabeth 1', image: 'https://i.redd.it/m3h2glzme1b51.jpg'),
      News(id: 8, title: 'Sumire Yoshizaw 1', image: 'https://images7.alphacoders.com/121/thumb-1920-1210980.png'),
      News(id: 9, title: 'Margaret 2', image: 'https://i.pinimg.com/originals/35/f5/f7/35f5f7cfeecdbaee6386375bc778fe5e.jpg'),
      News(id: 10, title: 'Elizabeth 2', image: 'https://i.redd.it/m3h2glzme1b51.jpg'),
      News(id: 11, title: 'Sumire Yoshizaw 2', image: 'https://images7.alphacoders.com/121/thumb-1920-1210980.png'),
    ];
  }
}