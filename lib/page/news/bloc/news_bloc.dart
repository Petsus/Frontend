import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:petsus/base/bloc/base_bloc.dart';
import 'package:petsus/page/news/viewmodel/news_viewmodel.dart';

part 'news_bloc.g.dart';

@Injectable(as: AbstractNewsBloc)
class NewsBloc = AbstractNewsBloc with _$NewsBloc;

abstract class AbstractNewsBloc extends BaseBloc with Store {
  final NewsViewModel viewModel;

  @observable
  XFile? imageSelected;

  DateTime? timeSelected;

  AbstractNewsBloc({required this.viewModel});

  @action
  void updateImage(XFile image) => imageSelected = image;

  void updateDate(DateTime time) => timeSelected = time;
}
