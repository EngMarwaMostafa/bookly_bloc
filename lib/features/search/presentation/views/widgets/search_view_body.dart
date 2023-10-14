
import 'package:bookly_app/core/utils/style.dart';
import 'package:bookly_app/features/home/data/models/book_model.dart';
import 'package:flutter/material.dart';
import '../../../../home/presentation/views/widgets/book_list_view_item.dart';
import 'custom_search_text_field.dart';


class SearchViewBody extends StatelessWidget {
  const SearchViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
           CustomSearchTextField(),
          SizedBox(height: 16,),
         Text('Search Result',style: Styles.textStyle18,),
          SizedBox(height: 16,),
          Expanded(child: SearchResultListView()),
        ],
      ),
    );

  }
}

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
    padding: EdgeInsets.zero,
    itemCount: 10,
    itemBuilder: (context, index) {
    return const Padding(
    padding: EdgeInsets.symmetric(vertical: 10),
   child: Text('data'),
   /* child: BookListViewItem(
      bookModel: BookModel(volumeInfo: volumeInfo),*/
    );
    });
  }
}



OutlineInputBorder buildOutlineInputBorder(){
  return OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white),
      borderRadius: BorderRadius.circular(12,));
}