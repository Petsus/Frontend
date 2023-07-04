
import 'package:flutter/src/widgets/framework.dart';
import 'package:injectable/injectable.dart';
import 'package:petsus/api/model/veterinary/veterinary.dart';
import 'package:petsus/component/sheet/side_sheet.dart';
import 'package:petsus/page/home/towerhall/router/veterinary_router.dart';
import 'package:petsus/page/veterinary/veterinary_details.dart';

@Environment(Environment.dev)
@Injectable(as: IVeterinaryRouter)
class VeterinaryRouter extends IVeterinaryRouter {
  @override
  Future details({required BuildContext context, required Veterinary veterinary}) async {
    SideSheet.open(
      body: VeterinaryDetails(veterinary: veterinary),
      side: Side.right,
      context: context,
      proportional: 2.5,
    );
  }
}