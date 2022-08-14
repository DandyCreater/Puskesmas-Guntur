import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puskesmas_guntur/presentation/bloc/pelayanan-Bloc/pelayanan_bloc.dart';
import 'package:puskesmas_guntur/presentation/resources/color_manager.dart';
import 'package:puskesmas_guntur/presentation/resources/font_manager.dart';
import 'package:puskesmas_guntur/presentation/widget/at_pelayanan-Page/customPelayananWidget.dart';

class PelayananPage extends StatelessWidget {
  const PelayananPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'PELAYANAN',
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
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Container(
                height: height * 0.078,
                width: double.infinity,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/logo_pelayanan.png"),
                        fit: BoxFit.cover)),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              SizedBox(
                height: height * 0.78,
                child: BlocBuilder<PelayananBloc, PelayananState>(
                  builder: (context, state) {
                    if (state is PelayananLoaded) {
                      var items = state.okContentPelayanan!.pelayanan;
                      return ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: items!.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Container(
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  child: CustomPelayananPage(
                                      imageUrl:
                                          items[index].imageUrl.toString(),
                                      title: items[index].title.toString(),
                                      day: items[index].date.toString(),
                                      hours: items[index].time.toString()),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                              ],
                            );
                          });
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
