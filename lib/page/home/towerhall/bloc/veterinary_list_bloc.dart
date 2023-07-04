import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:petsus/api/model/veterinary/veterinary.dart';
import 'package:petsus/base/bloc/base_bloc.dart';
import 'package:petsus/page/home/towerhall/viewmodel/veterinary_town_hall_viewmodel.dart';

part 'veterinary_list_bloc.g.dart';

@Injectable(as: AbstractVeterinaryListBloc)
class VeterinaryListBloc = AbstractVeterinaryListBloc with _$VeterinaryListBloc;

abstract class AbstractVeterinaryListBloc extends BaseBloc with Store {
  static const int pageSize = 50;

  final VeterinaryTownHallViewModel viewModel;
  String _filter = '';

  @observable
  int orderBy = 0;

  @observable
  ObservableList<Veterinary> veterinaries = ObservableList.of([]);

  @observable
  int page = 1;

  @observable
  int pageCount = 1;

  @computed
  bool get isOrderByName => orderBy & 0x01 == 1;

  @computed
  bool get isOrderByDate => orderBy & 0x02 == 2;

  AbstractVeterinaryListBloc({
    required this.viewModel,
  });

  @override
  Future load() async => await loadPage(page);

  @action
  Future loadPage(int page) async {
    setStatus(ResultStatus.waiting);
    try {
      final response = await viewModel.veterinary(page, pageSize, isOrderByDate, isOrderByName, _filter);

      veterinaries.clear();

      this.page = page;
      pageCount = response.pageCount;
      veterinaries.addAll(response.veterinaries);

      setStatus(ResultStatus.successful);
    } catch (e) {
      setStatus(ResultStatus.error, error: e);
    }
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
