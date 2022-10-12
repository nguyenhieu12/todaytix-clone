import 'dart:ui';

import 'package:readmore/readmore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> with TickerProviderStateMixin {

  int current = 0;

  List<String> items = [
    "Info",
    "Venue"
  ];

  int itemsLength(String item) {
    if (item == "Info")
      return item.length + 22;
    return item.length + 40;
  }

  @override
  Widget build(BuildContext context) {
    double mHeight = MediaQuery.of(context).size.height;
    double mWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        child: Stack(
          // physics: BouncingScrollPhysics(),
          children: [
            Stack(
              children: [
                InkWell(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * (1 - 0.63),
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset('assets/0.png'),
                    /*child: CachedNetworkImage(
                          imageUrl: info.backdrops,
                          fit: BoxFit.cover,
                        ),*/
                  ),
                ),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, top: 10, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CreateIcons(
                          onTap: () => Navigator.pop(context),
                          child: const Icon(
                            CupertinoIcons.arrow_left,
                            color: Colors.black,
                          ),
                        ),
                        Row(
                          children: [
                            CreateIcons(
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (context) => Container(),
                                );
                              },
                              child: const Icon(
                                CupertinoIcons.bookmark,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            CreateIcons(
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (context) => Container(),
                                );
                              },
                              child: const Icon(
                                CupertinoIcons.share,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            BottomInfoSheet(child: [
              Container(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 35),
                color: Colors.white,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: kElevationToShadow[3],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset('assets/1.jfif',
                            width: 120,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              height: 18,
                              child: Text(
                                "  Musical  ",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              "The Piano Lesson on Broadway",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              "Samuel L. Jackson. Danielle Brooks. John David Washington. Need we say more?",
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(height: 5),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  children: [
                    /// CUSTOM TABBAR
                    Stack(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(top: 13, bottom: 15),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(color: Color.fromRGBO(128, 128, 128, 0.2), width: 2, style: BorderStyle.solid),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 31,
                          child: ListView.builder(
                            /*physics: const BouncingScrollPhysics(),*/
                              itemCount: items.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (ctx, index) {
                                return Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          current = index;
                                        });
                                      },
                                      child: Stack(
                                        children: [
                                          Container(
                                            child: Row(
                                              children: [
                                                Center(
                                                  child: Text(items[index],
                                                    style: TextStyle(
                                                      color: current == index
                                                          ? Colors.black
                                                          : Colors.grey,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            margin: const EdgeInsets.only(bottom: 10, right: 20),
                                          ),
                                          AnimatedPositioned(
                                              duration: const Duration(milliseconds: 400),
                                              curve: Curves.fastOutSlowIn,
                                              bottom: 1,
                                              child: Column(
                                                children: [
                                                  Stack(
                                                    children: [
                                                      Container(
                                                        width: itemsLength(items[index]).toDouble(),
                                                        height: current == index
                                                            ? 4
                                                            : 2,
                                                        decoration: ShapeDecoration(
                                                          shape: StadiumBorder(),
                                                          color: current == index
                                                              ? Colors.redAccent
                                                              : Color.fromRGBO(128, 128, 128, 0),
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              )
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              }
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 30, bottom: 25),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Color.fromRGBO(128, 128, 128, 0.2), width: 2, style: BorderStyle.solid),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('About The Piano Lession on Broadway',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5,),
                          ReadMoreText(
                            "See Oscar winner Samuel L. Jackson (Pulp Fiction), Tony and Emmy nominee Danielle Brooks (Orange Is the New Black), and Golden Globe nominee John David Washington (BlacKkKlansman) together on stage in August Wilson's gripping drama. These celebrated actors play a family haunted by the ghosts of their past as they figure out how to forge their future.",
                            trimLines: 4,
                            colorClickableText: Colors.black,
                            moreStyle: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline
                            ),
                            lessStyle: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline
                            ),
                            trimMode: TrimMode.Line,
                            trimCollapsedText: '\nRead More',
                            trimExpandedText: '\nHire',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          ListTile(
                            contentPadding: EdgeInsets.symmetric(horizontal: 0),
                            leading: Icon(Icons.calendar_month_outlined, color: Colors.redAccent,),
                            title: Text('Starting Date',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            subtitle: Text('10 December 2022'),
                          ),
                          ListTile(
                            contentPadding: EdgeInsets.symmetric(horizontal: 0),
                            leading: Icon(Icons.calendar_month_outlined, color: Colors.redAccent,),
                            title: Text('Closing Date',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            subtitle: Text('10 December 2022'),
                          ),
                          ListTile(
                            contentPadding: EdgeInsets.symmetric(horizontal: 0),
                            leading: Icon(Icons.emoji_emotions_outlined, color: Colors.redAccent,),
                            title: Text('Genres',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            subtitle: Text('Concert'),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ])
          ],
        ),
      ),
      bottomNavigationBar: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 30, sigmaY: 50),
          child: Container(
            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
            height: 100,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.85),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('From \$39',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('Save 26%',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Get tickets'
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    minimumSize: Size(250, 50),
                    backgroundColor: Colors.redAccent,
                    textStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18
                    )
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CreateIcons extends StatelessWidget {
  final Widget child;
  final Function()? onTap;
  const CreateIcons({
    Key? key,
    required this.child,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: ClipOval(
        child: Container(
          padding: const EdgeInsets.all(7),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: InkWell(onTap: onTap, child: child),
        )
      ),
    );
  }
}

class BottomInfoSheet extends StatelessWidget {
  final List<Widget> child;
  final double? minSize;
  const BottomInfoSheet({
    Key? key,
    required this.child,
    this.minSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        child: DraggableScrollableSheet(
          initialChildSize: minSize == null ? 0.65 : minSize!,
          minChildSize: minSize == null ? 0.65 : minSize!,
          maxChildSize: 0.86,
          builder: (context, con) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                child: Container(
                  color: Colors.white,
                  child: ListView(
                    controller: con,
                    children: child,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
