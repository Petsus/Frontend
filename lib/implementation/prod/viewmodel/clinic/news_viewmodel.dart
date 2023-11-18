import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:petsus/api/model/news/news.dart';
import 'package:petsus/api/model/news/news_request.dart';
import 'package:petsus/api/model/user/user.dart';
import 'package:petsus/api/service/news_repository.dart';
import 'package:petsus/page/news/viewmodel/news_viewmodel.dart';
import 'package:petsus/repository/shared_preferences.dart';
import 'package:petsus/util/app_keys.dart';
import 'package:petsus/util/result.dart';

@Environment(Environment.prod)
@Injectable(as: INewsViewModel)
class NewsViewModel extends INewsViewModel {
  final SharedPreferences preferences;
  final INewsRepository repository;

  NewsViewModel({
    required this.preferences,
    required this.repository,
  });

  @override
  Future<Result<News>> save(NewsRequest news, XFile image) => repository.save(news, image);

  @override
  Future<Result<News>> update(NewsRequest news, int id, XFile? image) => repository.update(news, id, image);

  @override
  Future<bool> canEdit() async {
    final user = await preferences.get<User>(Keys.user.name);
    if (user == null) {
      return false;
    }
    return user.role.contains(Level.townhall) || user.role == [Level.adm];
  }
}
