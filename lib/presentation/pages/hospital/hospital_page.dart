import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puskesmas_guntur/presentation/bloc/hospital-Bloc/hospital_bloc.dart';
import 'package:puskesmas_guntur/presentation/resources/color_manager.dart';
import 'package:puskesmas_guntur/presentation/resources/font_manager.dart';
import 'package:puskesmas_guntur/presentation/widget/at_hospital-Page/custom_hospital_card_widget.dart';

class HospitalPage extends StatelessWidget {
  const HospitalPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: ColorManager.backgroundColor,
      appBar: AppBar(
        title: Text(
          'RUMAH SAKIT RUJUKAN',
          style: ThemeText.heading2.copyWith(
            color: ColorManager.blackTextColor,
          ),
        ),
        centerTitle: true,
        backgroundColor: ColorManager.appBarColor,
        elevation: 0,
        leading: IconButton(
          icon: ImageIcon(
            const AssetImage(
              'assets/icons/arrow_left.png',
            ),
            color: ColorManager.primaryColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SizedBox(
          height: height * 0.9,
          child: BlocBuilder<HospitalBloc, HospitalState>(
            builder: (context, state) {
              print(state);
              if (state is HospitalLoaded) {
                var items = state.okContentHospital!.hospital;
                return ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: items!.length,
                  itemBuilder: ((context, index) {
                    return CustomHospitalCardWidget(
                        press: () {},
                        imageUrl: items[index].imageUrl.toString(),
                        title: items[index].title.toString(),
                        location: items[index].address.toString(),
                        number: items[index].noTelp.toString());
                  }),
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ),
    );
  }
}
