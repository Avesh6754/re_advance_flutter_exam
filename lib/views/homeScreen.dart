import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:re_advance_flutter_exam/modal/modalClass.dart';
import 'package:re_advance_flutter_exam/provider/HomeProvider.dart';

enum Serach { All, jewelery, electronics, womens_clothing, mens_clothing }

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    var slectedItem;
    Homeprovider providerTrue =
        Provider.of<Homeprovider>(context, listen: true);
    Homeprovider providerflase =
        Provider.of<Homeprovider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Home Page',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        actions: [
        TextButton(onPressed: () {

        }, child: PopupMenuButton<Serach>(
          initialValue:slectedItem ,
          onSelected: (Serach item) {
            slectedItem=item;
          },
          itemBuilder: (context) =><PopupMenuEntry<Serach>> [
            PopupMenuItem<Serach>(
                value: Serach.All,
                child: Text('All')),
            PopupMenuItem<Serach>(
                value: Serach.mens_clothing,
                child: Text('men s clothing')),
            PopupMenuItem<Serach>(
                value: Serach.womens_clothing,
                child: Text('women s clothing')),
            PopupMenuItem<Serach>(
                value: Serach.electronics,
                child: Text('electronics')),

          ],
        ))
        ],
      ),
      body: FutureBuilder(
        future: providerflase.fetchdataFromApi(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Shopping>? ecomerList = snapshot.data;
            providerTrue.shopListSave = snapshot.data;
            return  ListView.builder(
              itemCount: ecomerList!.length,
              itemBuilder: (context, index) =>
                    GestureDetector(
                      onTap: () {
                        providerTrue.selectedindex = index;
                        Navigator.of(context).pushNamed('/deat');
                      },
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            leading: Container(
                                height: double.infinity,
                                width: 50,
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade100,
                                    image: DecorationImage(
                                      image: NetworkImage(ecomerList[index].image),
                                    ))),
                            title: Text(
                              ecomerList[index].title,
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            subtitle: Text(
                                "Rating ${ecomerList[index].rating.rate.toString()}"),
                            trailing: Text(
                              ecomerList[index].price.toString(),
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                    ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
