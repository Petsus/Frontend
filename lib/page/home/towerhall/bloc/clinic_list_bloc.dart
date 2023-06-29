import 'package:mobx/mobx.dart';
import 'package:petsus/page/home/towerhall/viewmodel/town_hall_viewmodel.dart';

part 'clinic_list_bloc.g.dart';

class ClinicListBloc = AbstractClinicListBloc with _$ClinicListBloc;

abstract class AbstractClinicListBloc with Store {
  final TownHallViewModel viewModel;

  @observable
  int orderBy = 0;
  @observable
  int pagesCount = 1;
  @observable
  int currentPage = 1;
  @observable
  List<dynamic> clinics = [];

  AbstractClinicListBloc({
    required this.viewModel,
  });

  @computed
  bool get isOrderByName => orderBy == 1;

  @computed
  bool get isOrderByDate => orderBy == 2;

  @action
  void search(String query) {}

  @action
  Future orderByName() async {}

  @action
  Future orderByDate() async {}

  @action
  Future toPage(int page) async {}
}