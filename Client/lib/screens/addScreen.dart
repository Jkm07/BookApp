import 'package:client/models/publisherModel/publisher.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';
import '../globals.dart';
import '../menuItems/authorTextFormField.dart';
import '../menuItems/gridItemImage.dart';
import '../menuItems/reusableTextFormField.dart';
import '../models/bookModel/book.dart';

class BookCreator extends StatefulWidget {
  BookCreator({super.key, this.book});

  Book? book;

  @override
  State<BookCreator> createState() => BookCreatorState();
}

class BookCreatorState extends State<BookCreator> {

  final formKey = GlobalKey<FormState>();
  late String bookID;
  late TextEditingController title;
  late TextEditingController numberOfPages;
  late TextEditingController coverType;
  late TextEditingController category;
  late TextEditingController ISBN;
  late TextEditingController language;
  late TextEditingController publishedDate;
  late TextEditingController publisherName;
  late TextEditingController issueNumber;
  late TextEditingController yearPublication;
  late TextEditingController quantity;
  late TextEditingController description;
  static late List<String> authorsList;
  late List<Uint8List> imagesWeb;
  List<String> imageUrls = [];
  bool loaded = false;

  Publisher? publisher;

  void getData() async{
    publisher = await publisherDatabase.getPublisher(widget.book!.publisherID);
    authorsList = widget.book == null ? [""] : await authorsDatabase.getAuthorsStringName(widget.book!.authorsID);
    setState(() {
      loaded = true;
    });
  }

  @override
  void initState() {
    super.initState();

    if(widget.book != null){
      getData();
    }

    bookID = widget.book == null ? const Uuid().v4() : widget.book!.bookID;
    imagesWeb = [];
    title = TextEditingController(text: widget.book?.title);
    numberOfPages = TextEditingController(text: widget.book?.numberOfPages);
    coverType = TextEditingController(text: widget.book?.coverType);
    category = TextEditingController(text: widget.book?.category);
    ISBN = TextEditingController(text: widget.book?.ISBN);
    language = TextEditingController(text: widget.book?.language);
    publishedDate = TextEditingController(text: widget.book?.publishedDate);
    publisherName = TextEditingController(text: publisher?.publisherName);
    issueNumber = TextEditingController(text: widget.book?.issueNumber);
    yearPublication = TextEditingController(text: widget.book?.yearPublication);
    quantity = TextEditingController(text: widget.book?.quantity);
    description = TextEditingController(text: widget.book?.description);
  }

  @override
  void dispose() {
    title.dispose();
    numberOfPages.dispose();
    coverType.dispose();
    category.dispose();
    ISBN.dispose();
    language.dispose();
    publishedDate.dispose();
    publisherName.dispose();
    issueNumber.dispose();
    yearPublication.dispose();
    quantity.dispose();
    description.dispose();
    super.dispose();
  }

  Future getMultipleImages() async {
    var tempImages = await ImagePicker().pickMultiImage();

    final images = await Future.wait(
        tempImages.map((e) async => await e.readAsBytes()).toList());
    setState(() {
      imagesWeb = imagesWeb..addAll(images);
    });
  }

  @override
  Widget build(BuildContext context) {

    if(loaded){
      return Scaffold(
        body: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: formKey,
          child: SingleChildScrollView(
            padding: paddingGlobal,
            child: Column(
              children: [
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith((states) {
                      if (states.contains(MaterialState.pressed)) {
                        return Theme.of(context).colorScheme.primary;
                      }
                      return Theme.of(context).colorScheme.secondary;
                    }),
                  ),
                  child: Text("Upload image",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.background)),
                  onPressed: () {
                    getMultipleImages();
                    setState(() {});
                  },
                ),
                space(),
                imagesWeb.isNotEmpty
                    ? SizedBox(
                  width: MediaQuery.of(context).size.width / 3,
                  child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: imagesWeb.length,
                    gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing:
                      MediaQuery.of(context).size.width * 0.02,
                      childAspectRatio: 1,
                    ),
                    itemBuilder: (context, index) =>
                        GridElement(image: imagesWeb[index], index: index, onTap: (int index) => {
                          setState(() {
                            imagesWeb.removeAt(index);
                          })
                        },),
                  ),
                )
                    : const Center(
                  child: FittedBox(
                    child: Text(
                      "No images found, please add images!",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                space(),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.04,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Center(
                      child: Text(
                        'Authors',
                        style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                      )),
                ),
                ...getAuthors(authorsList, (bool add, int index) {
                  if (add) {
                    authorsList.insert(index, "");
                  } else {
                    authorsList.removeAt(index);
                  }
                  setState(() {});
                }
                ),
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.04,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Center(
                      child: Text(
                        'Book details',
                        style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                      )),
                ),
                space(),
                reusableTextFormField(
                    context, "Title", Icons.title, title, "Enter title"),
                space(),
                reusableTextFormField(context, "Category",
                    Icons.type_specimen_outlined, category, "Enter category"),
                space(),
                reusableTextFormField(
                    context, "ISBN", Icons.text_fields, ISBN, "Enter ISBN"),
                space(),
                reusableTextFormField(context, "Language",
                    Icons.language_outlined, language, "Enter language"),
                space(),
                reusableTextFormField(context, "Quantity",
                    Icons.shopping_cart_outlined, quantity, "Enter quantity", TextInputType.number, [FilteringTextInputFormatter.digitsOnly]),
                space(),
                reusableTextFormField(context, "Cover type", Icons.book,
                    coverType, "Enter cover type"),
                space(),
                reusableTextFormField(
                    context,
                    "Number of pages",
                    Icons.bookmarks_rounded,
                    numberOfPages,
                    "Enter number of pages", TextInputType.number, [FilteringTextInputFormatter.digitsOnly]),
                space(),
                reusableTextFormField(
                    context,
                    "Publisher",
                    Icons.person_outline_outlined,
                    publisherName,
                    "Enter publisher name"),
                space(),
                reusableTextFormField(
                    context,
                    "Published date",
                    Icons.date_range_outlined,
                    publishedDate,
                    "Enter published date DD-MM-YYYY"),
                space(),
                reusableTextFormField(
                    context,
                    "Publication year",
                    Icons.calendar_today,
                    yearPublication,
                    "Enter publication year"),
                space(),
                reusableTextFormField(context, "Issue number",
                    Icons.title_outlined, issueNumber, "Enter issue number", TextInputType.number, [FilteringTextInputFormatter.digitsOnly]),
                space(),
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.04,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Center(
                      child: Text(
                        'Description',
                        style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                      )),
                ),
                space(),
                TextFormField(
                  controller: description,
                  enableSuggestions: true,
                  autocorrect: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "This field can't be empty";
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    icon: const Icon(Icons.description),
                    hintText: "Enter description",
                    labelText: "Description",
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(width: 3),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.primary, width: 5),
                    ),
                  ),
                  keyboardType: TextInputType.multiline,
                  maxLines: 8,
                  maxLength: 250,
                ),
                space(),
                ElevatedButton(
                  onPressed: () async {
                    final isValidForm = formKey.currentState!.validate();

                    if (imagesWeb.isEmpty) {
                      return;
                    }

                    if (isValidForm) {
                      imageUrls = await booksDatabase.uploadImages(imagesWeb, bookID);
                      String publisherID = "";
                      List<String> authorsID = [];

                      for (int i = 0; i < authorsList.length; i++) {
                        authorsID.add(await booksDatabase
                            .checkAndAddAuthor(authorsList[i]));
                      }
                      publisherID = await booksDatabase
                          .checkAndAddPublisher(publisherName.text);

                      final book = Book.book(
                          bookID: bookID,
                          title: title.text,
                          authorsID: authorsID,
                          numberOfPages: numberOfPages.text,
                          coverType: coverType.text,
                          category: category.text,
                          ISBN: ISBN.text,
                          language: language.text,
                          publishedDate: publishedDate.text,
                          publisherID: publisherID,
                          issueNumber: issueNumber.text,
                          yearPublication: yearPublication.text,
                          description: description.text,
                          quantity: quantity.text,
                          images: imageUrls);
                      await booksDatabase.addBook(book);
                      Navigator.pop(context);
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith((states) {
                      if (states.contains(MaterialState.pressed)) {
                        return Theme.of(context).colorScheme.primary;
                      }
                      return Theme.of(context).colorScheme.secondary;
                    }),
                  ),
                  child: Text(
                    widget.book == null ? "Add book" : "Edit book",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.background,
                        fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }else{
      return const Center(child: CircularProgressIndicator());
    }
  }
}