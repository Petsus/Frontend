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

class NewsPage extends StatefulWidget {
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
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  void initState() {
    autorun((_) {
      if (widget.bloc.status == ResultStatus.error) ScaffoldMessenger.of(context).showSnackBar(widget.bloc.error.snackBar);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
                        final img = await ImagePicker().pickImage(source: ImageSource.gallery);
                        if (img != null) widget.bloc.updateImage(img);
                      },
                      child: FractionallySizedBox(
                        widthFactor: 0.4,
                        child: AspectRatio(
                          aspectRatio: 16 / 9,
                          child: Observer(
                            builder: (_) {
                              if (widget.edit == null && widget.bloc.imageSelected == null) {
                                return Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: ColorApp.primary.color, width: 2.0),
                                    borderRadius: DimenApp.borderRadius.radius,
                                  ),
                                  child: Icon(Icons.image_search, size: 75, color: ColorApp.onBackground.color),
                                );
                              }
                              final url = widget.bloc.imageSelected?.path ?? widget.edit?.image;
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
                    controller: widget.titleController,
                    decoration: const InputDecoration(labelText: 'Nome', hintText: 'Nome'),
                  ),
                  SizedBox(height: DimenApp.marginSmall.size),
                  TextField(
                    controller: widget.urlController,
                    decoration: const InputDecoration(labelText: 'URL', hintText: 'URL'),
                  ),
                  SizedBox(height: DimenApp.marginSmall.size),
                  TextField(
                    controller: widget.dateController,
                    onTap: () async {
                      final dateSelected = await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime.now(), lastDate: DateTime.utc(2099));
                      if (dateSelected != null) {
                        widget.bloc.timeSelected = dateSelected;
                        widget.dateController.value = widget.dateController.value.copyWith(text: dateSelected.parseFormatted());
                      }
                    },
                    decoration: const InputDecoration(labelText: 'Data do evento', hintText: 'Data do evento'),
                  ),
                  SizedBox(height: DimenApp.marginDefault.size),
                  ButtonFull(
                    title: 'Salvar',
                    onPressed: () => save(context),
                  ),
                ],
              ),
            ),
          ),
          Observer(
            builder: (_) {
              return Visibility(
                visible: widget.bloc.status == ResultStatus.waiting,
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
      ),
    );
  }

  void save(BuildContext context) async {
    widget.bloc.setStatus(ResultStatus.waiting);

    final request = NewsRequest(
      title: widget.titleController.text,
      date: widget.bloc.timeSelected?.formatted,
      url: widget.urlController.text.isEmpty ? null : widget.urlController.text,
    );

    if (widget.edit != null) {
      final updateNews = await widget.bloc.viewModel.update(request, widget.edit!.id, widget.bloc.imageSelected);
      if (updateNews != null) Navigator.pop(context, updateNews);
      return;
    }

    if (widget.bloc.imageSelected == null) {
      widget.bloc.setError(StringFormatter(messageString: 'Selecione uma imagem', error: null));
      return;
    }

    final createdNews = await widget.bloc.viewModel.save(request, widget.bloc.imageSelected!);
    if (createdNews != null) Navigator.pop(context, createdNews);
  }
}
