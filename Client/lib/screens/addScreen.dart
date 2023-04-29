import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:client/bookModel/book.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';
import '../globals.dart' as globals;

class BookCreator extends StatefulWidget {
  const BookCreator({super.key});

  @override
  State<BookCreator> createState() => _BookCreatorState();
}

class _BookCreatorState extends State<BookCreator> {

  final formKey = GlobalKey<FormState>();
  late String bookID;
  late TextEditingController authorsController;
  late TextEditingController title;
  late TextEditingController author;
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
  List<Uint8List> imagesWeb = [];
  List<String> imageUrls = [];
  static List<String> authorsList = [""];
  late double scaleHeight;
  late double scaleWidthApp;
  late double scaleWidthWeb;

  @override void initState() {
    super.initState();

    bookID = Uuid().v4();
    title = TextEditingController();
    author = TextEditingController();
    numberOfPages = TextEditingController();
    coverType = TextEditingController();
    category = TextEditingController();
    ISBN = TextEditingController();
    language = TextEditingController();
    publishedDate = TextEditingController();
    publisherName = TextEditingController();
    issueNumber = TextEditingController();
    yearPublication = TextEditingController();
    quantity = TextEditingController();
    description = TextEditingController();
    authorsController = TextEditingController();
  }

  @override void dispose() {
    title.dispose();
    author.dispose();
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
    authorsController.dispose();
    super.dispose();
  }

  List<Widget> getAuthors(){
    List<Widget> authorsTextFields = [];
    for(int i=0; i<authorsList.length; i++){
      authorsTextFields.add(
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Row(
              children: [
                Expanded(child: AuthorTextFormFields(i)),
                SizedBox(width: 16,),
                _addRemoveButton(i == authorsList.length-1, i),
              ],
            ),
          )
      );
    }
    return authorsTextFields;
  }

  Widget _addRemoveButton(bool add, int index){
    return InkWell(
      onTap: (){
        if(add){
          authorsList.insert(index, "");
        }
        else authorsList.removeAt(index);
        setState((){});
      },
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: (add) ? Colors.green : Colors.red,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon((add) ? Icons.add_box_rounded : Icons.highlight_remove_outlined, color: Colors.white,),
      ),
    );
  }

  Widget space( [double? value] ){
    return SizedBox(
      height: value == null ? scaleHeight : value,
    );
  }

  Future getMultipleImages() async {
      var tempImages = await ImagePicker().pickMultiImage();

      final images = await Future.wait( tempImages.map((e) async => await e.readAsBytes()).toList() );
      setState(() {
        imagesWeb = imagesWeb..addAll(images);
      });

      imageUrls = await globals.booksDatabase.uploadImages( imagesWeb, bookID);
  }

  @override
  Widget build(BuildContext context) {
    scaleHeight = MediaQuery.of(context).size.height * 0.02;
    scaleWidthWeb = MediaQuery.of(context).size.width / 5;
    scaleWidthApp = MediaQuery.of(context).size.width / 20;

    return Scaffold(
      backgroundColor: const Color(0xff6b1a0a),
      appBar: AppBar(
        backgroundColor: const Color(0xff471005),
        leading: GestureDetector(
          onTap: () {},
          child: Icon(
            Icons.bookmark_add_outlined,
          ),
        ),
        title: Text("Add book"),
      ),
      body: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.only( top: MediaQuery.of(context).size.height * 0.05 , bottom: MediaQuery.of(context).size.height * 0.05, left: kIsWeb ? scaleWidthWeb : scaleWidthApp, right: kIsWeb ? scaleWidthWeb : scaleWidthApp ),
          child: Column(
            children: [
              TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith((states) {
                    if (states.contains(MaterialState.pressed)) {
                      return Colors.green;
                    }
                    return const Color(0xff451f14);
                  }),
                ),
                child: Text("Upload image", style: TextStyle(color: Colors.white),),
                onPressed: () {
                  getMultipleImages();
                  setState(() {

                  });
                },
              ),
              space(),
              imagesWeb.length > 0 ? Container(
                width: MediaQuery.of(context).size.width / 3,
                child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: imagesWeb.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: MediaQuery.of(context).size.width * 0.02,
                      // mainAxisSpacing: 11,
                      childAspectRatio: 1,
                    ),
                    itemBuilder: (context, index) => GridElement( image: imagesWeb[index])
                ),
              ) : Center(
                child: Container(
                  child: FittedBox(
                    child: Text(
                      "No images found, please add images!", style: TextStyle( fontSize: 18, color: Colors.white ),
                    ),
                  ),
                ),
              ),
              space(),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.04,
                child: Center(child: Text('Authors', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16, color: Colors.white),)),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              ...getAuthors(),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.04,
                child: Center(child: Text('Book details', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16, color: Colors.white),)),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              space(),
              reusableTextFormField("Title", Icons.title, title, "Enter title"),
              space(),
              reusableTextFormField("Category", Icons.type_specimen_outlined, category, "Enter category"),
              space(),
              reusableTextFormField("ISBN", Icons.text_fields, ISBN, "Enter ISBN"),
              space(),
              reusableTextFormField("Language", Icons.language_outlined, language, "Enter language"),
              space(),
              reusableTextFormField("Quantity", Icons.shopping_cart_outlined, quantity, "Enter quantity"),
              space(),
              reusableTextFormField("Cover type", Icons.book, coverType, "Enter cover type"),
              space(),
              reusableTextFormField("Number of pages", Icons.bookmarks_rounded, numberOfPages, "Enter number of pages"),
              space(),
              reusableTextFormField("Publisher", Icons.person_outline_outlined, publisherName, "Enter publisher name"),
              space(),
              reusableTextFormField("Published date", Icons.date_range_outlined, publishedDate, "Enter published date DD-MM-YYYY"),
              space(),
              reusableTextFormField("Publication year", Icons.calendar_today, yearPublication, "Enter publication year"),
              space(),
              reusableTextFormField("Issue number", Icons.title_outlined, issueNumber, "Enter issue number"),
              space(),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.04,
                child: Center(child: Text('Description', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16, color: Colors.white),)),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              space(),
              TextFormField(
                style: TextStyle( color: Colors.white ),
                controller: description,
                enableSuggestions: true,
                autocorrect: true,
                cursorColor: Colors.white,
                validator: (value) {
                  if ( value == null || value.isEmpty ) {
                    return "This field can't be empty";
                  }
                  else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                  icon: Icon( Icons.description, color: Colors.white,),
                  hintText: "Enter description",
                  hintStyle: TextStyle( color:Colors.white70 ),
                  labelText: "Description",
                  labelStyle: TextStyle(color: Colors.white.withOpacity(0.9)),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide( color: Colors.white, width: 3 ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide( color: Colors.blue, width: 5 ),
                  ),
                ),
                keyboardType: TextInputType.multiline,
                maxLines: 8,
                maxLength: 250,
              ),
              space(),
              ElevatedButton(
                onPressed: () async
                {
                    final isValidForm = formKey.currentState!.validate();

                    if( imagesWeb.length == 0 ){

                      return;
                    }

                    if( isValidForm ){
                      //final uid = globals.userDatabase.getUserID();
                      String publisherID = "";
                      List<String> authorsID = [];

                      for(int i = 0; i < authorsList.length; i++){
                        authorsID.add( await globals.booksDatabase.checkAndAddAuthor(authorsList[i]) );
                      }
                      publisherID = await globals.booksDatabase.checkAndAddPublisher(publisherName.text);

                      final book = Book.book(bookID: bookID, title: title.text, authorsID: authorsID, numberOfPages: numberOfPages.text, coverType: coverType.text, category: category.text, ISBN: ISBN.text, language: language.text, publishedDate: publishedDate.text, publisherID: publisherID, issueNumber: issueNumber.text, yearPublication: yearPublication.text, description: description.text, quantity: quantity.text, images: imageUrls);
                      await globals.booksDatabase.addBook(book);
                      //dialogTrigger(context);
                    }

                },
                child: Text(
                  "Add book",
                  style: TextStyle( color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18 ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith((states) {
                    if (states.contains(MaterialState.pressed)) {
                      return Colors.green;
                    }
                    return const Color(0xff451f14);
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GridElement extends StatefulWidget {
  const GridElement({super.key, required this.image, this.onTap});

  final Uint8List image;
  final Function()? onTap;

  @override
  State<GridElement> createState() => _GridElementState();
}

class _GridElementState extends State<GridElement> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
            child: InkWell(
              onTap: widget.onTap,
              splashColor: Colors.white60,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                  image: DecorationImage(
                      image: MemoryImage(widget.image),
                      fit: BoxFit.cover
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AuthorTextFormFields extends StatefulWidget {
  final int index;
  AuthorTextFormFields(this.index);
  @override
  _AuthorTextFormFieldsState createState() => _AuthorTextFormFieldsState();
}

class _AuthorTextFormFieldsState extends State<AuthorTextFormFields> {
  late TextEditingController nameController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      nameController.text = _BookCreatorState.authorsList[widget.index] ?? '';
    });

    return TextFormField(
      style: TextStyle( color: Colors.white ),
      controller: nameController,
      enableSuggestions: true,
      autocorrect: true,
      cursorColor: Colors.white,
      validator: (value) {
        if ( value == null || value.isEmpty ) {
          return "This field can't be empty";
        }
        else {
          return null;
        }
      },
      onChanged: (v) => _BookCreatorState.authorsList[widget.index] = v,
      decoration: InputDecoration(
        icon: Icon(Icons.person_add_alt_1, color: Colors.white,),
        hintText: "Enter author",
        hintStyle: TextStyle( color:Colors.white70 ),
        labelText: "Author",
        labelStyle: TextStyle(color: Colors.white.withOpacity(0.9)),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide( color: Colors.white, width: 3 ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide( color: Colors.blue, width: 5 ),
        ),
      ),
    );

  }
}

TextFormField reusableTextFormField( String label, IconData icon, TextEditingController controller, String hintText ){
  return TextFormField(
    style: TextStyle( color: Colors.white ),
    controller: controller,
    enableSuggestions: true,
    autocorrect: true,
    cursorColor: Colors.white,
    validator: (value) {
      if ( value == null || value.isEmpty ) {
        return "This field can't be empty";
      }
      else {
        return null;
      }
    },
    decoration: InputDecoration(
      icon: Icon(icon, color: Colors.white,),
      hintText: hintText,
      hintStyle: TextStyle( color:Colors.white70 ),
      labelText: label,
      labelStyle: TextStyle(color: Colors.white.withOpacity(0.9)),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide( color: Colors.white, width: 3 ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide( color: Colors.blue, width: 5 ),
      ),
    ),
  );
}