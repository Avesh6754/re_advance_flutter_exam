import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/HomeProvider.dart';

class Detailscreen extends StatelessWidget {
  const Detailscreen({super.key});

  @override
  Widget build(BuildContext context) {
    Homeprovider providerTrue =
        Provider.of<Homeprovider>(context, listen: true);
    Homeprovider providerflase =
        Provider.of<Homeprovider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
        title: Text(
          'Detail Page',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                        image: NetworkImage(providerTrue
                            .shopListSave![providerTrue.selectedindex].image))),
              )),
          Divider(),
          Expanded(
              child: Container(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      providerTrue.shopListSave![providerTrue.selectedindex].title,
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Category : ${providerTrue.shopListSave![providerTrue.selectedindex].category}',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text('Description :',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                    Text(
                      '${providerTrue.shopListSave![providerTrue.selectedindex].description}',
                      style: TextStyle(fontSize: 15,color: Colors.grey)
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text('Rating:',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                    Text(
                        '${providerTrue.shopListSave![providerTrue.selectedindex].rating.rate}',
                        style: TextStyle(fontSize: 15,color: Colors.red,fontWeight: FontWeight.bold)
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      Text('Price:',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                      Text(
                          'Rs ${providerTrue.shopListSave![providerTrue.selectedindex].price}',
                          style: TextStyle(fontSize: 15,color: Colors.red,fontWeight: FontWeight.bold)
                      ),
                      Spacer(),
                      ElevatedButton(style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.blue)),onPressed: () {

                           providerflase.adddata(providerTrue.shopListSave![providerTrue.selectedindex].id-1, providerTrue.selectedindex);

                       Navigator.of(context).pushNamed('/cart');
                      }, child: Text('Add To Cart',style: TextStyle(color: Colors.white),))
                    ],),
                    SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ),
            ),
          )),
        ],
      ),
    );
  }
}
