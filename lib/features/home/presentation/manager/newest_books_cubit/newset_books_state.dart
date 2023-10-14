import 'package:equatable/equatable.dart';

import '../../../data/models/book_model.dart';


abstract class NewsetBooksState extends Equatable{

  const NewsetBooksState();

  @override
  List<Object> get props=>[];
}

class NewsetBooksInitial extends NewsetBooksState{}
class NewsetBooksLoading extends NewsetBooksState{}

class NewsetBooksFailure extends NewsetBooksState{
  final String errMessage;

  const NewsetBooksFailure(this.errMessage);
}

class NewsetBooksSuccess extends NewsetBooksState{
  final List<BookModel> books;

   const NewsetBooksSuccess(this.books);
}
