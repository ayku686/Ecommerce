import 'dart:convert';

import 'package:ecommerce/Screens/product_details.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Models/product.dart';
import '../Utilities/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Product> prod = [];
  ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController(initialScrollOffset: 0.0);
  }

  @override
  Widget build(BuildContext context) {
    var hscale = MediaQuery.of(context).size.height / 826.9;
    var wscale = MediaQuery.of(context).size.width / 392.7;
    return FutureBuilder(
        future: fetchProducts(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
              backgroundColor: const Color.fromRGBO(197, 187, 175, 1),
              body: SingleChildScrollView(
                reverse: true,
                controller: _scrollController,
                child: Column(children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 60*hscale,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('ECOMMERCE',
                                  style: GoogleFonts.mukta(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 30*hscale,
                                      color:
                                          const Color.fromRGBO(28, 28, 29, 1))),
                              IconButton(
                                  onPressed: () {},
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                    const Color.fromRGBO(179, 188, 192, 1),
                                  )),
                                  icon: const Icon(
                                    Icons.menu,
                                    color: Color.fromRGBO(28, 28, 29, 1),
                                  ))
                            ],
                          ),
                          SizedBox(
                            height: 15*hscale,
                          ),
                          Container(
                            height: 65*hscale,
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              color: Color.fromRGBO(226, 227, 227, 1),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Container(
                                        height: 50*hscale,
                                        width: 50*wscale,
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(50)),
                                          color:
                                              Color.fromRGBO(222, 126, 71, 1),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(vertical: 8.0*hscale,horizontal: 8*wscale),
                                          child: Image.asset(
                                              'assets/images/location.png',
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(vertical: 8.0*hscale,horizontal: 8*wscale),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Send to',
                                            style: GoogleFonts.notoSerif(
                                              fontSize: 16*hscale,
                                              color: Colors.black54,
                                            ),
                                          ),
                                          Text(
                                            'New Delhi, India',
                                            style: GoogleFonts.karla(
                                                fontSize: 18*hscale,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w700,
                                                letterSpacing: -1),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 8.0*hscale,horizontal: 8*wscale),
                                  child: Container(
                                    width: 110*wscale,
                                    height: 65*hscale,
                                    decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(30)),
                                      color: Color.fromRGBO(222, 126, 71, 1),
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Change',
                                      style: GoogleFonts.mukta(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w800,
                                          fontSize: 18*hscale),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      )),
                  SizedBox(
                    height: 20*hscale,
                  ),
                  SizedBox(
                    height: 130*hscale,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Widgets.circle('assets/images/search.png', 'Search',hscale,wscale),
                          Widgets.circle('assets/images/gucci.png', 'Gucci',hscale,wscale),
                          Widgets.circle(
                              'assets/images/lv.png', 'Louie Vuitton',hscale,wscale),
                          Widgets.circle('assets/images/nike-64.png', 'Nike',hscale,wscale),
                          Widgets.circle('assets/images/puma-64.png', 'Puma',hscale,wscale),
                          Widgets.circle('assets/images/adidas.png', 'Adidas',hscale,wscale),
                          Widgets.circle('assets/images/Reebok.png', 'Reebok',hscale,wscale),
                          Widgets.circle('assets/images/next.png', 'See All',hscale,wscale),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 160*hscale,
                    child: ImageSlideshow(
                      isLoop: true,
                      children: [
                        Image.network(
                            'https://img.freepik.com/free-vector/realistic-christmas-sale-banner-with-red-page_1361-3133.jpg?w=1380&t=st=1697866559~exp=1697867159~hmac=1a39f0bcc36626940cdd2f2a29570e0bb371b88b3ca93ac90b852aeab64a9d62',
                            fit: BoxFit.fill),
                        Image.network(
                            'https://img.freepik.com/free-vector/modern-black-friday-sale-banner-background_1361-3705.jpg?w=1380&t=st=1697866904~exp=1697867504~hmac=f89622e9d2ffe8dae537d16412b12351a7e37c4ef0f9cc57ff759729f5f1bb79',
                            fit: BoxFit.fill),
                        Image.network(
                            'https://img.freepik.com/free-vector/happy-diwali-sale-banner-with-discount-details-pink-background_1017-39845.jpg?w=1380&t=st=1697866959~exp=1697867559~hmac=3a7ccba5ba217a0cc255e28cb38028ecefd06a5da3a6c4cef96e02194567c707',
                            fit: BoxFit.fill)
                      ],
                    ),
                  ),
                  Container(
                    color: const Color.fromRGBO(226, 227, 227, 1),
                    child: Column(
                      children: [
                         SizedBox(
                          height: 20*hscale,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.0*wscale),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Most Popular',
                                style: GoogleFonts.roboto(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20*hscale),
                              ),
                              Text(
                                'View more',
                                style: GoogleFonts.karla(
                                    color:
                                        const Color.fromRGBO(222, 126, 71, 1),
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18*hscale),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8*wscale),
                          child: GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            // Important for the GridView inside a Column
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 10.0*hscale,
                              crossAxisSpacing: 10.0*wscale,
                              childAspectRatio: 1.0,
                            ),
                            itemCount: 15,
                            itemBuilder: (context, index) {
                              return Container(
                                color: Colors.transparent,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    GestureDetector(
                                      onTap: (){
                                        Navigator.push(context,
                                            MaterialPageRoute(builder: (context) => ProductDetails(product: prod[index])));
                                      },
                                      child: Container(
                                        height:140*hscale,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(8)
                                          ),
                                          child: Image.network(prod[index].images[0],fit: BoxFit.fill)),
                                    ),
                                    SizedBox(height: 5*hscale),
                                    Text(prod[index].title,
                                        style: GoogleFonts.robotoCondensed(
                                      fontSize: 18*hscale,
                                          fontWeight: FontWeight.w600,
                                    ),
                                    maxLines: 1),
                                    Text('\$${prod[index].price.toString()}')
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
            );
          } else {
            return const Center(
                child: CircularProgressIndicator(
              color: Color.fromRGBO(222, 126, 71, 1),
            ));
          }
        });
  }

  Future<List<Product>> fetchProducts() async {
    var response =
        await http.get(Uri.parse('https://api.escuelajs.co/api/v1/products'));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var list = List<Product>.from(data.map((v) => Product.fromJson(v)));
      prod.addAll(list);
      return list;
    } else {
      throw 'Failed to fetch products';
    }
  }
}
