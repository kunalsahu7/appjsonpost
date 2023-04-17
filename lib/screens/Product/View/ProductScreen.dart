import 'package:appjsonpost/screens/Product/Model/ProductModel.dart';
import 'package:appjsonpost/screens/Product/Provider/ProductModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  ProductProvider? productProviderT;
  ProductProvider? productProviderF;

  @override
  Widget build(BuildContext context) {
    productProviderF = Provider.of<ProductProvider>(context, listen: false);
    productProviderT = Provider.of<ProductProvider>(context, listen: true);

    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
          future: productProviderF!.GetApiCall(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text("${snapshot.error}");
            } else if (snapshot.hasData) {
              List<dynamic>? p1 = snapshot.data;
              return ListView.builder(
                itemBuilder: (context, index) {
                  return Stack(
                    children: [

                      ListTile(
                        title: Text(
                          "${p1[index].product_name}",
                        ),
                        subtitle: Text(
                          "${p1[index].product_price}",
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                          onPressed: () async {
                            String msg = await productProviderF!.PostApiCall();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("$msg"),
                              ),
                            );
                          },
                          icon: Icon(Icons.add),
                        ),
                      ),
                    ],
                  );
                },
                itemCount: p1!.length,
              );
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
