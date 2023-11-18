import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:petsus/api/model/news/news.dart';
import 'package:petsus/base/bloc/base_bloc.dart';
import 'package:petsus/page/dashboard/viewmodel/dashboard_viewmodel.dart';
import 'package:petsus/util/result.dart';

part 'dashboard_bloc.g.dart';

@Injectable(as: AbstractDashboardBloc)
class DashboardBloc = AbstractDashboardBloc with _$DashboardBloc;

abstract class AbstractDashboardBloc extends BaseBloc with Store {
  final IDashboardViewModel viewModel;

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
    setStatus(ResultStatus.waiting);

    final news = await viewModel.news();
    news.success((data) => _news = ObservableList.of(news.get));

    final schedule = await viewModel.schedule();
    schedule.success((data) => _schedules = ObservableList.of(schedule.get));

    Result.multipleResultIsSuccessful(
      [news, schedule],
      () => setStatus(ResultStatus.successful),
      (error) => setStatus(ResultStatus.error, error: error),
    );
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
