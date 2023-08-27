import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gap/gap.dart';
import 'package:ticketbookingapp/utils/app_layout.dart';
import 'package:ticketbookingapp/utils/app_styles.dart';
import 'package:ticketbookingapp/widgets%20/thick_container.dart';

class Ticketview extends StatelessWidget {
  final Map<String, dynamic> ticket;
  const Ticketview({Key? key, required this.ticket}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size= Applayout.getsize(context);
    return SizedBox(
      width: size.width*0.85,
      height: Applayout.getHeight(200),
      child: Container(
        margin: EdgeInsets.only(right: Applayout.getHeight(16)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /*
            showing blue part of ticket
             */
            Container(
              decoration: BoxDecoration(
                color: Color(0xff526799),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(Applayout.getHeight(21)), topRight: Radius.circular(Applayout.getHeight(21)))
              ),
              padding: EdgeInsets.all(Applayout.getHeight(16)),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(ticket['from']['code'], style: Styles.headLineStyle3.copyWith(color: Colors.white)),
                      Expanded(child: Container()),
                      Thickcontainer(),
                      Expanded(child: Stack(
                        children: [
                          SizedBox(
                            height: Applayout.getHeight(24),
                            child: LayoutBuilder(
                              builder: (BuildContext , BoxConstraints constraints ) {
                                print("The width is ${constraints.constrainWidth()}");
                                return Flex(
                                    direction: Axis.horizontal,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    mainAxisSize: MainAxisSize.max,
                                    children: List.generate((constraints.constrainWidth()/6).floor(), (index) => const SizedBox(
                                      width: 3,height: 1, child: DecoratedBox(decoration: BoxDecoration(color: Colors.white) ),
                                    ) ));
                              },
                            ),
                          ),
                          Center(
                            child: Transform.rotate(angle: 1.5, child: const Icon(Icons.local_airport_rounded, color: Colors.white,),
                            ),
                          )],
                      )),
                      Thickcontainer(),
                      Expanded(child: Container()),
                      Text(ticket['to']['code'], style: Styles.headLineStyle3.copyWith(color: Colors.white))
                    ],
                  ),
                  const Gap(3),
                  Row(
                    mainAxisAlignment:MainAxisAlignment.spaceBetween ,
                    children: [
                      SizedBox(
                        width: Applayout.getWidth(100),child: Text(ticket['from']['name'], style: Styles.headLineStyle4.copyWith(color: Colors.white)),
                      ),
                      Text(ticket['flying_time'], style: Styles.headLineStyle4.copyWith(color: Colors.white),),
                      SizedBox(
                        width: Applayout.getWidth(100),child: Text(ticket['to']['name'],textAlign: TextAlign.end, style: Styles.headLineStyle4.copyWith(color: Colors.white)),
                      )
                    ],
                  )
                ],
              ),
            ),
            /*
            showing orange part of ticket
             */
            Container(
              color: Styles.orangeColor,//const Color(0xfff37b67),
              child: Row(
                children: [
                   SizedBox(
                    height: Applayout.getHeight(20),
                    width: Applayout.getWidth(10),
                    child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(Applayout.getHeight(10)),
                        bottomRight: Radius.circular(Applayout.getHeight(10))

                      )
                    )),
                  ),
                  Expanded(child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: LayoutBuilder
                      (builder: (BuildContext , BoxConstraints constraints ) {
                      return Flex(
                        direction: Axis.horizontal,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: List.generate((constraints.constrainWidth()/15).floor(), (index) => const SizedBox(
                          width: 5,height: 1,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                                color:  Colors.white
                            ),
                          ),
                        )),
                      );
                    },

                    ),
                  )),
                  const SizedBox(
                    height: 20,
                    width: 10,
                    child: DecoratedBox(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10)

                            )
                        )),
                  ),
                ],
              ),
            ),
            /*
            bottom part of orange part of ticket
             */
            Container(
              decoration: BoxDecoration(
                  color: Styles.orangeColor,  //Color(0xff526799),
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(21), bottomRight: Radius.circular(21))
              ),
              padding: const EdgeInsets.only(left: 16, right: 16, top: 10,bottom: 16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(ticket['date'],style: Styles.headLineStyle3.copyWith(color: Colors.white),),
                          const Gap(5),
                          Text("Date",style: Styles.headLineStyle4.copyWith(color: Colors.white),)
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(ticket['departure_time'],style: Styles.headLineStyle3.copyWith(color: Colors.white),),
                          const Gap(5),
                          Text("Departure Time",style: Styles.headLineStyle4.copyWith(color: Colors.white),)
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(ticket['number'].toString(),style: Styles.headLineStyle3.copyWith(color: Colors.white),),
                          const Gap(5),
                          Text("Number",style: Styles.headLineStyle4.copyWith(color: Colors.white),)
                        ],
                      ),
                    ],
                  )
                ],
              )
            )
          ],
        ),
      ),
    );
  }
}
