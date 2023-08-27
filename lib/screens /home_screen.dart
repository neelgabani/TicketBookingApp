import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ticketbookingapp/utils/app_info_list.dart';
import 'package:ticketbookingapp/utils/app_styles.dart';
import 'package:ticketbookingapp/screens%20/hotel_screen.dart';
import 'package:ticketbookingapp/screens%20/ticket_view.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Styles.bgColor,
      body: ListView(
        children: [
         Container(
           padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
           children: [
             const Gap(40),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                   Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text("Good morning", style: Styles.headLineStyle3,
                       ),
                       const Gap(5),
                       Text("Book Tickets", style: Styles.headLineStyle1,
                       )
                     ],
                   ),
                 Container(
                   width: 50,
                   height: 50,
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(10),
                     image: const DecorationImage(
                       fit: BoxFit.fitHeight,
                       image: AssetImage(
                         "assets/images/img_1.png"
                       )
                     )
                   ),
                 )
               ],

             ),
              const Gap(25),
             Container(
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(10),
                 color: const Color(0xfff4f6fd)
               ),
               padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
               child: Row(
                 children: [
                   const Icon(FluentSystemIcons.ic_fluent_search_regular),
                   Text(
                     "Search", style: Styles.headLineStyle4,
                   )
                 ],
               ),
             ),
             const Gap(25),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Text("Upcoming Flights", style: Styles.headLineStyle2,),
                 InkWell(
                   onTap: (){
                     print("you have tapped");
                   },

                 child: Text("View all", style: Styles.textStyle.copyWith(color: Styles.primaryColor),)
                 ),
               ],
             )
           ],
      )

          ),
          const Gap(15),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: ticketList.map((singleTicket) => Ticketview(ticket: singleTicket)).toList(),
            ),
          ),
          const Gap(15),
          Container(
            padding:  const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Hotels", style: Styles.headLineStyle2,),
                InkWell(
                    onTap: (){
                      print("you have tapped");
                    },

                    child: Text("View all", style: Styles.textStyle.copyWith(color: Styles.primaryColor),)
                ),
              ],
            ),
          ),
          const Gap(15),
          SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: hotelList.map((singleHotel) =>  HotelScreen(hotel: singleHotel)).toList()
              ),

          ),
        ],
      ),
    );
  }
}
