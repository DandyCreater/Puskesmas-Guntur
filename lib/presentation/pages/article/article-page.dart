import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puskesmas_guntur/presentation/bloc/article-Bloc/article_bloc.dart';
import 'package:puskesmas_guntur/presentation/pages/article/detail-article-page.dart';
import 'package:puskesmas_guntur/presentation/resources/color_manager.dart';
import 'package:puskesmas_guntur/presentation/resources/font_manager.dart';
import 'package:puskesmas_guntur/presentation/widget/at_article-Page/article_card.dart';

class ArticlePage extends StatelessWidget {
  const ArticlePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'ARTIKEL',
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
        body: BlocBuilder<ArticleBloc, ArticleState>(
          builder: (context, state) {
            if (state is ArticleSuccess) {
              var items = state.okContentArticle!.article;
              return ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: items!.length,
                  itemBuilder: ((context, index) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(21, 10, 20, 0),
                      child: ArticleCard(
                        imageUrl: items[index].imageUrl.toString(),
                        title: items[index].header.toString(),
                        activity: items[index].category.toString(),
                        date: items[index].date.toString(),
                        press: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailArticlePage(
                                      title: items[index].header.toString(),
                                      imageUrl:
                                          items[index].imageUrl.toString(),
                                      puskesmas: "Puskesmas Guntur",
                                      date: items[index].date.toString(),
                                      time: items[index].time.toString(),
                                      textContent: items[index]
                                          .description
                                          .toString())));
                        },
                      ),
                    );
                  }));
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }
}
