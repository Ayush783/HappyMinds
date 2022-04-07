import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:happyminds/home/model/psychiatrist.dart';

class ChatView extends StatelessWidget {
  const ChatView({Key? key, this.ps}) : super(key: key);

  final Psychiatrist? ps;
  static final TextEditingController _text = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: Colors.black,
            ),
          ),
          titleSpacing: 0,
          title: Text(
            ps!.name!,
            style: GoogleFonts.poppins(color: Colors.black),
          ),
        ),
        body: Stack(
          children: [
            Container(
              height: size.height,
              width: size.width,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xfff2709c),
                    Color(0xffff9472),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.02, 0.8],
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        borderRadius: BorderRadius.circular(50),
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  offset: const Offset(0, 1),
                                  blurRadius: 6,
                                  color: Colors.black.withOpacity(0.06),
                                ),
                                BoxShadow(
                                  offset: const Offset(0, 2),
                                  color: Colors.black.withOpacity(0.16),
                                  blurRadius: 32,
                                )
                              ]),
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.call),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 3, horizontal: 16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(32),
                          ),
                          child: Row(
                            children: [
                              const SizedBox(width: 8),
                              Expanded(
                                child: TextFormField(
                                  controller: _text,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintStyle: GoogleFonts.poppins(),
                                      hintText: 'Type your message'),
                                  style: GoogleFonts.poppins(),
                                  keyboardType: TextInputType.multiline,
                                  cursorColor: Colors.white,
                                  textInputAction: TextInputAction.newline,
                                  maxLines: null,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.send,
                            color: Colors.white,
                          ),
                        ),
                        splashRadius: 24,
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

// class ChatScreen extends ConsumerWidget {
//   const ChatScreen({Key? key}) : super(key: key);

//   static GlobalKey key2 = GlobalKey();
//   static final ScrollController _controller = ScrollController();
//   static final TextEditingController _text = TextEditingController();
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final size = MediaQuery.of(context).size;
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           leading: Container(),
//           backgroundColor: ksub,
//           bottom: PreferredSize(
//             preferredSize: Size(size.width, 60),
//             child: CustomAppbar2(title: 'Chat Support'),
//           ),
//           elevation: 0,
//         ),
//         body: BlocListener<ChatBloc, ChatState>(
//           listener: (context, state) {
//             log(state.toString());
//           },
//           child: Stack(
//             children: [
//               Positioned(
//                 top: 0,
//                 bottom: 162,
//                 left: 20,
//                 right: 20,
//                 child: BlocBuilder<ChatBloc, ChatState>(
//                   builder: (context, state) {
//                     return SingleChildScrollView(
//                       controller: _controller,
//                       reverse: true,
//                       child: Column(
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.symmetric(vertical: 16),
//                             child: Row(
//                               crossAxisAlignment: CrossAxisAlignment.end,
//                               children: [
//                                 Image.asset(
//                                   'assets/icons/chat_operator.png',
//                                   height: 32,
//                                 ),
//                                 SizedBox(width: 8),
//                                 Expanded(
//                                   child: Container(
//                                     padding: EdgeInsets.all(20),
//                                     decoration: BoxDecoration(
//                                       color: Colors.white,
//                                       borderRadius: BorderRadius.circular(6),
//                                       boxShadow: [
//                                         BoxShadow(
//                                           blurRadius: 5,
//                                           offset: Offset(0, 2),
//                                           color: Colors.black.withOpacity(0.2),
//                                         ),
//                                       ],
//                                     ),
//                                     child: RichText(
//                                       text: TextSpan(
//                                         text: 'Operator',
//                                         style: kTextStyle1.copyWith(height: 2),
//                                         children: [
//                                           TextSpan(
//                                             text: '  from Wagen Wizard\n',
//                                             style: kTextStyle4,
//                                           ),
//                                           TextSpan(
//                                               text: 'Hi there 👋\n',
//                                               style: kTextStyle4),
//                                           TextSpan(
//                                               text:
//                                                   'What brings you to desk today?',
//                                               style: kTextStyle4),
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           BlocBuilder<ChatBloc, ChatState>(
//                             builder: (context, state) {
//                               if (state.loading!)
//                                 return Center(
//                                   child: SizedBox(
//                                     height: 16,
//                                     width: 16,
//                                     child: CircularProgressIndicator(
//                                       strokeWidth: 3,
//                                       color: kprimaryColor,
//                                     ),
//                                   ),
//                                 );
//                               else
//                                 return ListView.builder(
//                                   physics: NeverScrollableScrollPhysics(),
//                                   itemBuilder: (context, index) => Padding(
//                                     padding: const EdgeInsets.only(bottom: 10),
//                                     child: Row(
//                                       mainAxisAlignment: msgs![index].isUser!
//                                           ? MainAxisAlignment.end
//                                           : MainAxisAlignment.start,
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.end,
//                                       children: [
//                                         Container(
//                                           decoration: BoxDecoration(
//                                               color: kCardColor,
//                                               borderRadius:
//                                                   BorderRadius.circular(6)),
//                                           padding: EdgeInsets.all(10),
//                                           constraints: BoxConstraints(
//                                               maxWidth: size.width * 0.75),
//                                           child: Text(
//                                             msgs[index].msg!,
//                                             style: kTextStyle4,
//                                           ),
//                                         ),
//                                         if (msgs[index].isUser! &&
//                                             msgs[index].status !=
//                                                 MessageStatus.sent)
//                                           Container(
//                                             width: 12,
//                                             height: 12,
//                                             padding: msgs[index].status ==
//                                                     MessageStatus.failed
//                                                 ? EdgeInsets.zero
//                                                 : EdgeInsets.all(4),
//                                             child: msgs[index].status ==
//                                                     MessageStatus.sending
//                                                 ? CircularProgressIndicator(
//                                                     color: kCardColor,
//                                                     strokeWidth: 2,
//                                                   )
//                                                 : Icon(
//                                                     Icons.error_outline_rounded,
//                                                     color: kRed,
//                                                     size: 12,
//                                                   ),
//                                           )
//                                       ],
//                                     ),
//                                   ),
//                                   itemCount: msgs!.length,
//                                   shrinkWrap: true,
//                                   cacheExtent: 10,
//                                 );
//                             },
//                           ),
//                         ],
//                       ),
//                     );
//                   },
//                 ),
//               ),
              
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

