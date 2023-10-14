
import 'package:bookly_app/features/home/data/models/book_model.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../constants.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/style.dart';
import 'book_rating.dart';

class BookListViewItem extends StatelessWidget {
  const BookListViewItem({Key? key,
    required this.bookModel}) : super(key: key);

  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:(){
        GoRouter.of(context).push(AppRouter.kBookDetailsView,extra: bookModel);
      } ,
      child: SizedBox(
        height: 125,
        child: Row(
          children: [
            CustomBookImage(imageUrl: bookModel.volumeInfo.imageLinks?.thumbnail ?? 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.pexels.com%2Fsearch%2Fblank%2F&psig=AOvVaw338_p5e_repfJf0P6gP0hx&ust=1697293975697000&source=images&cd=vfe&ved=0CBEQjRxqFwoTCMi2vPae84EDFQAAAAAdAAAAABAE'),
          /*  AspectRatio(
              aspectRatio: 2.5 / 4,
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.red,
                    image:const DecorationImage(
                        fit: BoxFit.fill, image: AssetImage(AssetsData.testImage)),
                  )),
            ),*/
            const SizedBox(
              width: 30,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Text('Harry Potter and the Goblet of Fire',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Styles.textStyle20
                            .copyWith(fontFamily: kGtSectraFine))),
                const SizedBox(
                  height: 3,
                ),
                const Text(
                  'J.K.Rowling',
                  style: Styles.textStyle14,
                ),
                const SizedBox(height: 3,),
                Row(
                  children: [
                    Text(
                      "19.99 €",
                      style: Styles.textStyle20
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 80,),
                    BookRating(
                      rating: bookModel.volumeInfo.averageRating ?? 0,
                      count: bookModel.volumeInfo.ratingsCount ?? 0,
                    )
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