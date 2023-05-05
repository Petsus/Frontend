import 'package:flutter/material.dart';
import 'package:petsus/api/model/address/state.dart';
import 'package:petsus/component/card/card_app.dart';
import 'package:petsus/component/loading/linear_loading.dart';
import 'package:petsus/page/clinic/clinic_view_model.dart';

class AddressPage extends StatelessWidget {
  final AbstractClinicViewModel viewModel;

  const AddressPage({
    Key? key,
    required this.viewModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<States>>(
      future: viewModel.getStates(),
      builder: (builder, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) return const Center(child: LinearLoading());

        if (snapshot.hasError) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error')));
          return const SizedBox();
        }

        return _createPager(snapshot.requireData);
      },
    );
  }

  Widget _createPager(List<States> items) {
    return CardApp(
      child: Column(
        children: items.map((e) => Text('')).toList(),
      ),
    );
  }

}
