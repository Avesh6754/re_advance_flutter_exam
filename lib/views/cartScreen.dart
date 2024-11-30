import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/HomeProvider.dart';

class Cartscreen extends StatelessWidget {
  const Cartscreen({super.key});

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
            Navigator.of(context).pushNamed('/home');
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
        title: Text(
          'Cart Page',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          ...List.generate(providerTrue.addList.length, (index)=>Padding(
            padding: const EdgeInsets.only(right: 5,left: 5,top: 5),
            child: Card(
              child: ListTile(
                leading: Container(
                    height: double.infinity,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        image: DecorationImage(
                          image: NetworkImage(providerTrue.shopListSave![int.parse(providerTrue.addList[index].split(" ").sublist(0,1).join(" "))].image),
                        ))),
                title: Text('${providerTrue.shopListSave![int.parse(providerTrue.addList[index].split(" ").sublist(0,1).join(" "))].title} \n ${providerTrue.shopListSave![int.parse(providerTrue.addList[index].split(" ").sublist(0,1).join(" "))].price}'),
                  subtitle: Row(
                    children: [
                      IconButton(onPressed: () {
                        providerflase.removeList(index);
                      },icon: Icon(Icons.delete,color: Colors.red,),),

                      Container(
                        width: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.black,width: 1)
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.remove),
                            Text('1'),
                            Icon(Icons.add),
                          ],
                        ),
                      )
                    ],
                  )
              ),
            ),
          ),

      ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 60,
              width: double.infinity,
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.blue,
              ),
              alignment: Alignment.center,
              child: Text('Total Amount :${providerTrue.total} '),
            ),
          )
      ]
    ),
    );
  }
}
