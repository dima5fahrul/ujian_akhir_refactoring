// ListView.builder(
//                 shrinkWrap: true,
//                 physics: const NeverScrollableScrollPhysics(),
//                 itemCount: 3,
//                 itemBuilder: (context, index) {
//                   return GestureDetector(
//                     onTap: () {},
//                     child: Container(
//                       width: 390,
//                       height: 115,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                         color: Colors.white,
//                         boxShadow: [
//                           BoxShadow(
//                             color: const Color(0xFF000000).withOpacity(0.25),
//                             blurRadius: 4,
//                             offset: const Offset(0, 4),
//                           ),
//                         ],
//                       ),
//                       child: Container(
//                         margin: const EdgeInsets.all(10),
//                         child: Row(
//                           children: [
//                             Container(
//                               margin: const EdgeInsets.only(right: 10),
//                               alignment: Alignment.centerLeft,
//                               width: 50,
//                               child: Image.asset(items[index].logoBg),
//                             ),
//                             Flexible(
//                               fit: FlexFit.tight,
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     items[index].job,
//                                     style: const TextStyle(
//                                       fontSize: 18,
//                                       fontWeight: FontWeight.w600,
//                                       color: Colors.black,
//                                     ),
//                                   ),
//                                   Container(
//                                     transformAlignment: Alignment.centerLeft,
//                                     child: Text(
//                                       items[index].name,
//                                       style: const TextStyle(
//                                         fontSize: 12,
//                                         fontWeight: FontWeight.w500,
//                                         color: Colors.black,
//                                       ),
//                                     ),
//                                   ),
//                                   Container(
//                                     margin: const EdgeInsets.only(top: 5),
//                                     height: 27,
//                                     child: Row(
//                                       children: [
//                                         Container(
//                                           margin:
//                                               const EdgeInsets.only(right: 8),
//                                           padding: const EdgeInsets.only(
//                                               left: 10, right: 10),
//                                           height: 27,
//                                           alignment: Alignment.center,
//                                           decoration: BoxDecoration(
//                                             borderRadius:
//                                                 BorderRadius.circular(10),
//                                             color: const Color(0xFFEEEEEE),
//                                           ),
//                                           child: Text(items[index].category,
//                                               style: const TextStyle(
//                                                 fontSize: 13,
//                                                 fontWeight: FontWeight.w500,
//                                                 color: Colors.black,
//                                               )),
//                                         ),
//                                         Container(
//                                           width: 70,
//                                           height: 27,
//                                           alignment: Alignment.center,
//                                           decoration: BoxDecoration(
//                                             borderRadius:
//                                                 BorderRadius.circular(10),
//                                             color: const Color(0xFFEEEEEE),
//                                           ),
//                                           child: Text(
//                                             '${items[index].contract} Year',
//                                             style: const TextStyle(
//                                               fontSize: 13,
//                                               fontWeight: FontWeight.w500,
//                                               color: Colors.black,
//                                             ),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             Container(
//                               margin: const EdgeInsets.only(top: 15),
//                               alignment: Alignment.topRight,
//                               child: Text(
//                                 items[index].time,
//                                 style: const TextStyle(
//                                   fontSize: 10,
//                                   fontWeight: FontWeight.w500,
//                                   color: Colors.grey,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               ),