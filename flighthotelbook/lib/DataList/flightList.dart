import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import '../customshapeclipper.dart';
// import '../main.dart';

final Color discountBackgroundColor = Color(0xffffe08d);
final Color flightBorderColor = Color(0xffe6e6e6);
final Color chipBackgroundColor = Color(0xfff6f6f6);

class InheritedFlightListing extends InheritedWidget {
  final String fromLocation, toLocation;

  InheritedFlightListing({this.fromLocation, this.toLocation, Widget child})
      : super(child: child);

  static InheritedFlightListing of(BuildContext context) {
    return (context
        .dependOnInheritedWidgetOfExactType<InheritedFlightListing>());
  }

  @override
  bool updateShouldNotify(InheritedFlightListing oldWidget) {
    return true;
  }
}

class FlightListingScreen extends StatelessWidget {
  final String fromLocation, toLocation;
  FlightListingScreen({this.fromLocation, this.toLocation});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search Result"),
        elevation: 0,
        centerTitle: true,
        leading: GestureDetector(
          child: Icon(Icons.arrow_back),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            // FlightListTopPart(
            //   fromLocation: fromLocation,
            //   toLocation: toLocation,
            // ),
            //FlightListBottomPart()
          ],
        ),
      ),
    );
  }
}

// class FlightListTopPart extends StatelessWidget {
//   final String fromLocation, toLocation;

//   const FlightListTopPart({this.fromLocation, this.toLocation});
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: <Widget>[
//         ClipPath(
//           clipper: CustomShapeClipper(),
//           child: Container(
//             height: 200,
//             decoration: BoxDecoration(
//                 gradient: LinearGradient(colors: [firstColor, secondColor])),
//           ),
//         ),
//         Column(
//           children: <Widget>[
//             SizedBox(
//               height: 20,
//             ),
//             Card(
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(20))),
//               margin: EdgeInsets.symmetric(horizontal: 20),
//               elevation: 10,
//               child: Container(
//                 padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//                 child: Row(
//                   mainAxisSize: MainAxisSize.max,
//                   children: <Widget>[
//                     Expanded(
//                       flex: 5,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: <Widget>[
//                           Text(
//                             "${InheritedFlightListing.of(context).fromLocation}",
//                             style: TextStyle(fontSize: 18),
//                           ),
//                           Divider(
//                             color: Colors.black,
//                             height: 20,
//                           ),
//                           Text(
//                             "${InheritedFlightListing.of(context).toLocation}",
//                             style: TextStyle(
//                                 fontSize: 18, fontWeight: FontWeight.bold),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Spacer(),
//                     Expanded(
//                         flex: 1,
//                         child: Icon(
//                           Icons.import_export,
//                           color: Colors.black,
//                           size: 32,
//                         ))
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         )
//       ],
//     );
//   }
// }

// class FlightListBottomPart extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.all(5),
//       child: Column(
//         children: <Widget>[
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//               "Best Deal For six months",
//               style: TextStyle(color: Colors.black, fontSize: 16),
//             ),
//           ),
//           SizedBox(
//             height: 30,),
//             StreamBuilder(
//               stream: Firestore.instance.collection("flightDeals").snapshots() ,
//              // initialData: initialData , 
//               builder: (BuildContext context, AsyncSnapshot snapshot){
//                 return !snapshot.hasData?CircularProgressIndicator(): _buildDealsList(context,snapshot.data.documents);
//               },
//             ),
//         ],
//       ),
//     );
//   }
// }
// Widget _buildDealsList(BuildContext context,List<DocumentSnapshot > snapshots){
//   return ListView.builder(
//     itemCount: snapshots.length,
//     shrinkWrap: true,
//             physics: ClampingScrollPhysics(),
//             scrollDirection: Axis.vertical,
//             itemBuilder: (context,index){
//               return FlightDetailsCard();
//             },
//     );
// }

// class FlightDetail{
//   final String airlines,date,discount,rating;
//   final int newPrice,oldPrice;

//   FlightDetail.fromMap(Map<String,dynamic> map):
//   assert (map["airlines"] !=null),
//   assert (map["date"] !=null),
//   assert (map["discount"] !=null),
//   assert (map["rating"] !=null),
//   airlines = map["airlines"],
//   date = map["date"],
//   discount =map["discount"],
//   oldPrice = map["oldPrice"],
//   newPrice = map["newPrice"],
//   rating =map["rating"] ;

// FlightDetail.fromSnapshot(DocumentSnapshot snapshot):this.fromMap(snapshot.data);
// }

// class FlightDetailsCard extends StatelessWidget {
//   final FlightDetail flightDetail;

//   const FlightDetailsCard({ this.flightDetail});
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: <Widget>[
//         Container(
//           margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//           padding: EdgeInsets.only(top: 20, bottom: 10),
//           decoration: BoxDecoration(
//               // gradient:
//               //     LinearGradient(colors: [Colors.white, Colors.greenAccent]),
//               borderRadius: BorderRadius.all(Radius.circular(20)),
//               border: Border.all(color: Colors.black26)),
//           child: Column(
//             children: <Widget>[
//               Row(
//                 children: <Widget>[
//                   SizedBox(
//                     width: 10,
//                   ),
//                   Text(
//                     "Rs${flightDetail.newPrice}",
//                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(
//                     width: 10,
//                   ),
//                   Text(
//                     "Rs${flightDetail.oldPrice}",
//                     style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.normal,
//                         decoration: TextDecoration.lineThrough),
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: 5,
//               ),
//               Wrap(
//                 spacing: 8,
//                 alignment: WrapAlignment.start,
//                 children: <Widget>[
//                   FlightDetailChip(flightDetail.date, Icons.calendar_today),
//                   FlightDetailChip(flightDetail.airlines, Icons.flight_takeoff),
//                   FlightDetailChip(flightDetail.rating, Icons.star),
//                 ],
//               )
//             ],
//           ),
//         ),
//         Positioned(
//             top: 20,
//             right: 0,
//             child: Container(
//                 decoration: BoxDecoration(
//                     color: Colors.black12,
//                     borderRadius: BorderRadius.all(Radius.circular(5))),
//                 child: Text("${flightDetail.discount}%")))
//       ],
//     );
//   }
// }

// class FlightDetailChip extends StatelessWidget {
//   final String label;
//   final IconData icon;
//   const FlightDetailChip(this.label, this.icon);
//   @override
//   Widget build(BuildContext context) {
//     return RawChip(
//       label: Text(label),
//       backgroundColor: Colors.black12,
//       labelStyle: TextStyle(fontSize: 14, color: Colors.black),
//       avatar: Icon(icon),
//       shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.all(Radius.circular(10))),
//     );
//   }
// }
