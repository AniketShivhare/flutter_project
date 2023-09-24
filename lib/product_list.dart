import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';

class productListScreen extends StatefulWidget {
  const productListScreen({super.key});

  @override
  State<productListScreen> createState() => _productListScreenState();
}

class _productListScreenState extends State<productListScreen> {

  List<String> productName = ['Mango', 'Orange','Grapes', 'Banana', 'Chery', 'Peach', 'kiwi'] ;
  List<String> productUnit = ['KG', 'Dozen', 'KG', 'Dozen', 'KG', 'KG', 'KG',];
  List<int> productPrice = [10, 20, 30, 40, 50, 60, 70,];
  List<String> productImage = [
    'https://upload.wikimedia.org/wikipedia/commons/4/40/Mango_4.jpg' ,
    'https://upload.wikimedia.org/wikipedia/commons/c/c4/Orange-Fruit-Pieces.jpg' ,
    'https://upload.wikimedia.org/wikipedia/commons/b/bb/Table_grapes_on_white.jpg' ,
    'https://upload.wikimedia.org/wikipedia/commons/a/aa/Bananas_%28white_background%29.jpg' ,
    'https://upload.wikimedia.org/wikipedia/commons/b/bb/Cherry_Stella444.jpg' ,
    'https://upload.wikimedia.org/wikipedia/commons/c/cb/White_nectarine_and_cross_section02_edit.jpg' ,
    'https://upload.wikimedia.org/wikipedia/commons/b/b8/Kiwi_%28Actinidia_chinensis%29_1_Luc_Viatour.jpg'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text('Product List',style: TextStyle(color: Colors.white)),
        centerTitle: true,
        actions: [
          Center(
            child: badges.Badge(
              badgeContent: Text('0',style: TextStyle(color: Colors.white),),
              child: Icon(Icons.shopping_bag_outlined , color: Colors.white,),
            ),
          ),

          SizedBox(width: 20)
        ],

      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: productName.length,
                  itemBuilder: (context, index){
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                       Row(
                         mainAxisAlignment: MainAxisAlignment.start,
                         crossAxisAlignment: CrossAxisAlignment.center,
                         children: [
                           Image(
                             height: 100,
                             width: 100,
                             image: NetworkImage(productImage[index].toString()),
                           ),
                           SizedBox(width: 10,),
                           Expanded(
                             child: Column(
                               mainAxisAlignment: MainAxisAlignment.start,
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Text(productName[index].toString(),
                                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                                 ),
                                 SizedBox(height: 5,),
                                 Text(productUnit[index].toString() +" "+r"₹"+ productPrice[index].toString(),
                                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                                 ),
                                 SizedBox(height: 5,),
                                 Align(
                                   alignment: Alignment.centerRight,
                                   child: Container(
                                     height: 35,
                                     width: 100,
                                     decoration: BoxDecoration(
                                       color: Colors.green,
                                       borderRadius: BorderRadius.circular(5)
                                     ),
                                     child: Center(
                                       child: Text('Add to cart', style: TextStyle(color: Colors.white),),
                                     ),
                                   ),
                                 )
                               ],
                             ),
                           )

                         ],
                       )
                      ],
                    ),
                  ),
                );
              })
          )
        ],
      ),
    );
  }
}
