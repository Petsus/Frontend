import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import 'package:petsus/api/model/news/news.dart';
import 'package:petsus/api/model/news/news_request.dart';
import 'package:petsus/base/bloc/base_bloc.dart';
import 'package:petsus/base/error/string_formatter.dart';
import 'package:petsus/component/button/button_full.dart';
import 'package:petsus/page/news/bloc/news_bloc.dart';
import 'package:petsus/util/components/helper_image.dart';
import 'package:petsus/util/date_formatter.dart';
import 'package:petsus/util/resources/app_color.dart';
import 'package:petsus/util/resources/dimen_app.dart';

class NewsPage extends StatelessWidget {
  final TextEditingController titleController;
  final TextEditingController urlController;
  final TextEditingController dateController;
  final AbstractNewsBloc bloc;
  final News? edit;

  NewsPage({super.key, required this.bloc, required this.edit})
      : titleController = TextEditingController(text: edit?.title ?? ''),
        urlController = TextEditingController(text: edit?.url ?? ''),
        dateController = TextEditingController(text: edit?.date?.parseTime() ?? '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: bloc.canEdit(),
        builder: (context, snapshot) {
          return Stack(
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: DimenApp.marginDefault.all,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                          icon: Icon(Icons.close, color: ColorApp.onBackground.color),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: InkWell(
                          onTap: () async {
                            if (snapshot.data != true) return;
                            final img = await ImagePicker().pickImage(source: ImageSource.gallery);
                            if (img != null) bloc.updateImage(img);
                          },
                          child: FractionallySizedBox(
                            widthFactor: 0.4,
                            child: AspectRatio(
                              aspectRatio: 16 / 9,
                              child: Observer(
                                builder: (_) {
                                  if (edit == null && bloc.imageSelected == null) {
                                    return Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: ColorApp.primary.color, width: 2.0),
                                        borderRadius: DimenApp.borderRadius.radius,
                                      ),
                                      child: Icon(Icons.image_search, size: 75, color: ColorApp.onBackground.color),
                                    );
                                  }
                                  final url = bloc.imageSelected?.path ?? edit?.image;
                                  return Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(color: ColorApp.primary.color, width: 2.0),
                                      borderRadius: DimenApp.borderRadius.radius,
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(DimenApp.borderRadius.size),
                                      child: Image.network(
                                        url ?? '',
                                        width: double.infinity,
                                        loadingBuilder: loading(),
                                        errorBuilder: error(),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: DimenApp.marginDefault.size),
                      TextField(
                        enabled: snapshot.data == true,
                        controller: titleController,
                        decoration: const InputDecoration(labelText: 'Nome', hintText: 'Nome'),
                      ),
                      SizedBox(height: DimenApp.marginSmall.size),
                      TextField(
                        enabled: snapshot.data == true,
                        controller: urlController,
                        decoration: const InputDecoration(labelText: 'URL', hintText: 'URL'),
                      ),
                      SizedBox(height: DimenApp.marginSmall.size),
                      TextField(
                        enabled: snapshot.data == true,
                        controller: dateController,
                        onTap: () async {
                          final dateSelected = await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime.now(), lastDate: DateTime.utc(2099));
                          if (dateSelected != null) {
                            bloc.timeSelected = dateSelected;
                            dateController.value = dateController.value.copyWith(text: dateSelected.parseFormatted());
                          }
                        },
                        decoration: const InputDecoration(labelText: 'Data do evento', hintText: 'Data do evento'),
                      ),
                      SizedBox(height: DimenApp.marginDefault.size),
                      Visibility(
                        visible: snapshot.data == true,
                        child: ButtonFull(
                          title: 'Salvar',
                          onPressed: () => save(context),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Observer(
                builder: (_) {
                  return Visibility(
                    visible: bloc.status == ResultStatus.waiting,
                    child: Container(
                      color: ColorApp.background.color.withOpacity(0.8),
                      child: Center(
                        child: CircularProgressIndicator(color: ColorApp.tertiary.color),
                      ),
                    ),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }

  void save(BuildContext context) async {
    bloc.setStatus(ResultStatus.waiting);

    final request = NewsRequest(
      title: titleController.text,
      date: bloc.timeSelected?.formatted,
      url: urlController.text.isEmpty ? null : urlController.text,
    );

    if (edit != null) {
      final updateNews = await bloc.viewModel.update(request, edit!.id, bloc.imageSelected);
      Navigator.pop(context, updateNews.data);
      return;
    }

    if (bloc.imageSelected == null) {
      bloc.setError(StringFormatter(messageString: 'Selecione uma imagem', error: null));
      return;
    }

    final createdNews = await bloc.viewModel.save(request, bloc.imageSelected!);
    Navigator.pop(context, createdNews.data);
  }
}
