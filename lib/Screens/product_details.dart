import 'package:ecommerce/Models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDetails extends StatefulWidget {
  final Product product;
  const ProductDetails({super.key,required this.product});
  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  late Product _product;

  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    _product = widget.product;
  }
  @override
  Widget build(BuildContext context) {
    var hscale = MediaQuery.of(context).size.height / 826.9;
    var wscale = MediaQuery.of(context).size.width / 392.7;
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 350*hscale,
                color: Colors.white70,
                child: Column(
                  children: [
                    SizedBox(
                      height: 50*hscale,
                    ),
                    SizedBox(
                      height: 24*hscale,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(onPressed: (){
                            Navigator.pop(context);
                          }, icon:const Icon(
                              Icons.arrow_back_ios_new_outlined
                          )),
                          Text('Details',style: GoogleFonts.notoSans(
                            fontSize: 20*hscale,
                            fontWeight: FontWeight.w600
                          ),),
                          IconButton(onPressed: (){}, icon: const Icon(
                              Icons.shopping_cart
                          ))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40*hscale,
                    ),
                    SizedBox(
                      height: 230*hscale,
                      child: ImageSlideshow(
                          children:[
                            // Image.asset('assets/images/lv.png')
                            for(String image in _product.images)
                                Image.network(image),
                          ]),
                    ),
                  ],
                ),
              ),
              Container(
                color: const Color.fromRGBO(234, 234, 234, 1).withOpacity(.6),
                height: 600*hscale,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(_product.title,
                        style: GoogleFonts.poppins(
                            fontSize: 28*hscale,
                        ),maxLines: 1),
                      SizedBox(
                        height: 5*hscale,
                      ),
                      Text('\$${_product.price.toString()}',
                      style: GoogleFonts.orbitron(
                        fontSize: 20*hscale,
                        fontWeight: FontWeight.w900
                      ),),
                      SizedBox(
                        height: 5*hscale,
                      ),
                      Text(_product.description,
                      style: GoogleFonts.exo(
                        fontSize: 18*hscale,
                        height: 1.3*hscale
                      ),)

                    ],
                  ),
                ),
              )
            ],
        ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 720.0*hscale,left: 35*wscale),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: const Color.fromARGB(255, 72, 94, 142)
              ),
              height: 66*hscale ,
              width: 320*wscale ,
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(const Color.fromRGBO(222, 126, 71, 1)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)))
                  ),
                  onPressed: null,
                  child: Text('Add to cart',
                    style: GoogleFonts.poppins(
                        fontSize: 16*hscale,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        letterSpacing: -0.5
                    ),
                    textAlign: TextAlign.center,
                  )),
            )
          )])
    );
  }
}
