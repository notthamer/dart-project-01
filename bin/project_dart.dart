import 'dart:io';
import 'dart:math';
void main() {
  while(true){
   
  menu();

  int? s1=int.parse(stdin.readLineSync()!);
if(s1==5){
  exit(0);
}
  selectm(s1);
   
  }
 
 
 
 }






abstract class Content{
 
//print all books
printbook();

 




}
class Book extends Content{
   int? bookId;
   String? title;
  String? author;
  num? price;
  int? quantity;

 Book({required this.bookId,required this.title, required this.author, required this.price,required this.quantity});
@override
  printbook() {
 
  print("Book id is  ${this.bookId}");
  print("title is ${this.title}");
  print("author is  ${this.author}");
  print("price is  ${this.price}");
  print("quantity is ${this.quantity}");
  print("****************************************************");

  }
  String? get gettitle{
    return title;
  }
  set settitle(String title){
   title= title;
  }
 @override
  String toString() {
     return '$bookId , $title , $author , $price , $quantity ';

  }
}




 

Book b1 =Book(bookId: 1, title:"start with why" , author: "simon sinek", price:80, quantity:0);
Book b2 =Book(bookId: 2, title:"Scott But how do i" , author: " J. Clark scott", price:59.9, quantity:22);
Book b3 =Book(bookId: 3, title:"artin Clean" , author: "Robert Cecil Martin", price:50, quantity:13);
Book b4 =Book(bookId: 4, title:"Zero to One" , author: "Peter Thiel", price:45, quantity:5);
Book b5 =Book(bookId: 5, title:"You don't know JS" , author: "Kyle Simpson", price:39.9, quantity:9);
 List <Book> b = [b1, b2 , b3 , b4 , b5];



showAllbooks(){
  for(int i =0 ; i<b.length;i++){
b[i].printbook();


  }
}


menu(){
print("******************************");
print("0. prints all books ");
print("1. to find a book ");
print("2. to add a book");
print("3. to delete a book ");
print("4. buy  book");
print("5. exit this program");
print("******************************");
}

selectm(int input){
  switch (input) {
    case 0:
showAllbooks();
    break;
    case 1:
     findmenu();//a menu used to select how u search for the book
     input=int.parse(stdin.readLineSync()!);
     if(input==0){
     searchbyid();}
     else if(input == 1){
       searchbytitle();
     }
     else if (input == 2){
       searchbyauthor();
     }
    break;
     case 2:
    addbook();
     break;
     case 3:
     delete();
     break;
     case 4:
     buyBook();
     break;
    default:
    exit(0);
  }
}


findmenu(){
print ("choose how you want find the book");
print("0. find by book id ");
print("1. find by title");
print("2. find by author");

}


searchbyid(){
  print("enter id");
 int? input= int.parse(stdin.readLineSync()!);
  for(var x in b){
    if(input ==  x.bookId){
      print(x.toString());}
   
  }

}
searchbytitle(){
  print("enter title");
  String? input = stdin.readLineSync();
   for(var x in b){
    if(input == x.gettitle){
      print(x.toString());}
}

}
searchbyauthor(){
  print("enter author");
  String? input = stdin.readLineSync();
   for(var x in b){
    if(input ==  x.author){
      print(x.toString());
      }
      }
}

addbook(){
  print("enter book info");
  print("enter id");
  int ?id=int.parse(stdin.readLineSync()!);
  print("enter title");

  String? title =stdin.readLineSync()!;
   print("enter author name");
   String? name= stdin.readLineSync()!;
   print("enter price");
    double? price =double.parse(stdin.readLineSync()!);
    print("enter quantity");
    int? quantity =int.parse(stdin.readLineSync()!);

  b.add(Book(bookId:id , title: title, author: name, price:price , quantity: quantity));
  for(var x in b){
    print(x.toString());
  }
}
delete(){ print("enter id");
 int? input= int.parse(stdin.readLineSync()!);
  for(int i=0;i<b.length;i++){
    if(input ==  b[i].bookId){
    b.removeAt(i);
      }
  }
  for(var x in b){
    print(x.toString());}
}
buyBook(){
  num? total=0;
  num? total_2=0;
  List names =[];
  List total_price =[];
  List <num>? total_quant = [];
  num? sum_quant=0;
  while(true){

  print("choose the book you want to buy");
  print("enter the id");
  int? input= int.parse(stdin.readLineSync()!);
  bool bfound =false;
  bool bstock =false;
  for(var x in b){
    if(input ==  x.bookId ){
      bfound=true;
     
 print("enter how much you want to buy");
   int? q= int.parse(stdin.readLineSync()!);
      if( x.quantity!>0){//this if makes sure the quantity is greater than zero
        if(x.quantity!-q<0){//subtracts the amount the user wants to buy from the the quantity and makes sure there its in stock
          print(" we dont have this amount we have ${x.quantity} in stock");
        break;
        }else
          x.quantity =x.quantity! - q;//updates quantity after making sure we have the quantiy
          bstock=true;
          names.add(x.title);//adds names to list for recipt
          total_price.add(x.price);// adds prices of books to a list for recipt
          total_quant.add(q);// adds the quantity the user choose for each book to a list
         total = x.price!*q +total!;//to find final price
         
          break;
      }else
        print("no in stock");
        break;
   }
   
   
   
 
  }
  print(" is book found ? ${bfound} ");
  print("is the amount in stock ? ${bstock}");
  print("would you like to buy another book");
  print("1. yes");
  print("2. no");
  int? buymore = int.parse(stdin.readLineSync()!);
  if(buymore==2){ //if = 1 goes back up to let u choose the book
  print("****************************************");
      Random rand= Random();// random number generator
      print("transaction no");
  print(rand.nextInt(100000));
 for (var y in names){
   print("book name : ${y}");
 }
 for (var v in total_price){
   print("book price ${v}");
 }
 for(var t in total_quant){
print("book quantity ${t}");}
 

 print("total : ${total}");
 print("************************************");
 

break;
  }

}
 


}


