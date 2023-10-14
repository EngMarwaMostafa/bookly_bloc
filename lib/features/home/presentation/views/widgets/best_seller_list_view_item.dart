
import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../constants.dart';
import '../../../../../core/utils/style.dart';
import '../../../data/models/book_model.dart';
import 'book_rating.dart';

class BestSellerListViewItem extends StatelessWidget {
  const BestSellerListViewItem({Key? key,
    required this.bookModel
  }) : super(key: key);

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:(){
        GoRouter.of(context).push(AppRouter.kBookDetailsView);
      } ,
      child: SizedBox(
        height: 125,
        child: Row(
          children: [
         CustomBookImage(
           imageUrl:bookModel.volumeInfo.imageLinks?.thumbnail ??
               '',
         ),
            const SizedBox(
              width: 30,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Text(
                        bookModel.volumeInfo.title!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Styles.textStyle20
                            .copyWith(fontFamily: kGtSectraFine))),
                const SizedBox(
                  height: 3,
                ),
                 Text(
                  bookModel.volumeInfo.authors![0],
                  style: Styles.textStyle14,
                ),
                const SizedBox(height: 3,),
                Row(
                  children: [
                    Text(
                      "Free",
                      style: Styles.textStyle20
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  const Spacer(),
                   BookRating(
                       rating:bookModel.volumeInfo.averageRating?.round() ?? 0,
                       count: bookModel.volumeInfo.ratingsCount ?? 0,)
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
/*
    AspectRatio(
              aspectRatio: 2.5 / 4,
              child: Container(
                  decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.red,
                image: const DecorationImage(
                    fit: BoxFit.fill, image: AssetImage(AssetsData.testImage)),
              )),
            ),
 */