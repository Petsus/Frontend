import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:petsus/api/model/clinic/clinics.dart';
import 'package:petsus/base/bloc/base_bloc.dart';
import 'package:petsus/page/home/towerhall/viewmodel/clinic_list_town_hall_view_model.dart';

part 'clinic_list_bloc.g.dart';

@Injectable(as: AbstractClinicListBloc)
class ClinicListBloc = AbstractClinicListBloc with _$ClinicListBloc;

abstract class AbstractClinicListBloc extends BaseBloc with Store {
  static const int pageSize = 50;

  final IClinicListTownHallViewModel viewModel;
  String _filter = '';

  @observable
  int orderBy = 0;

  @observable
  int page = 1;

  @observable
  int pageCount = 1;

  @observable
  ObservableList<Clinics> clinics = ObservableList.of([]);

  AbstractClinicListBloc({
    required this.viewModel,
  });

  @computed
  bool get isOrderByName => orderBy == 1;

  @computed
  bool get isOrderByDate => orderBy == 2;

  @override
  Future load() async => await loadPage(page);

  @action
  Future loadPage(int page) async {
    setStatus(ResultStatus.waiting);

    final response = await viewModel.clinics(page, pageSize, isOrderByDate, isOrderByName, _filter);
    response.success((data) {
      clinics.clear();

      this.page = page;
      pageCount = data.pageCount;
      clinics.addAll(data.clinics);

      setStatus(ResultStatus.successful);
    });
    response.fail((e) {
      setStatus(ResultStatus.error, error: e);
    });
  }

  @action
  Future orderByName(bool value) async {
    value ? orderBy |= 1 : orderBy &= ~0x01;
    await loadPage(1);
  }

  @action
  Future orderByDate(bool value) async {
    value ? orderBy |= 2 : orderBy &= ~0x02;
    await loadPage(1);
  }

  @action
  Future filter(String filter) async {
    _filter = filter;
    loadPage(1);
  }
}
