import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:petsus/api/model/news/news.dart';
import 'package:petsus/base/bloc/base_bloc.dart';
import 'package:petsus/page/home/towerhall/viewmodel/dashboard_town_hall_viewmodel.dart';

part 'dashboard_bloc.g.dart';

@Injectable(as: AbstractDashboardBloc)
class DashboardBloc = AbstractDashboardBloc with _$DashboardBloc;

abstract class AbstractDashboardBloc extends BaseBloc with Store {
  final DashboardTownHallViewModel viewModel;

  @observable
  ObservableList<News> _news = ObservableList.of([]);
  @observable
  ObservableList<News> _schedules = ObservableList.of([]);
  @observable
  String? _filterNews;
  @observable
  String? _filterSchedules;

  @computed
  List<News> get newsFiltered {
    if (_filterNews == null || _filterNews?.isEmpty == true) return _news;
    return _news.where((element) => element.title.toLowerCase().contains(_filterNews?.toLowerCase() ?? '')).toList();
  }

  @computed
  List<News> get schedulesFiltered {
    if (_filterSchedules == null || _filterSchedules?.isEmpty == true) return _schedules;
    return _schedules.where((element) => element.title.toLowerCase().contains(_filterSchedules?.toLowerCase() ?? '')).toList();
  }

  AbstractDashboardBloc({required this.viewModel});

  @override
  Future load() async {
    try {
      setStatus(ResultStatus.waiting);
      _news = ObservableList.of(await viewModel.news());
      _schedules = ObservableList.of(await viewModel.schedule());
      setStatus(ResultStatus.successful);
    } catch (e) {
      setStatus(ResultStatus.error, error: e);
    }
  }

  @action
  void filter(String? query) {
    _filterNews = query;
    _filterSchedules = query;
  }

  @action
  void update(News news) {
    if (news.date == null) {
      final index = _news.indexOf(news);
      if (index >= 0) {
        _news[index] = news;
        return;
      }
      return _news.add(news);
    }

    final index = _schedules.indexOf(news);
    if (index >= 0) {
      _schedules[index] = news;
      return;
    }
    return _schedules.add(news);
  }
}
