import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:triggin_app/design_files/colors.dart';
import 'package:triggin_app/screens/login.dart';
import 'package:triggin_app/webservices/APIs.dart';

import '../class_files/class.dart';
import '../design_files/text_styles.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Drawer list items
  final List<Menu> _dItems = [
    Menu(
        dTitle: 'Home',
        droute: '',
        dicon0: const Icon(Icons.home),
        dicon1: const Icon(Icons.home, color: TgnColors.drawerText2)),
    Menu(
        dTitle: 'My Catalogue',
        droute: '',
        dicon0: const Icon(Icons.home),
        dicon1: const Icon(Icons.home, color: TgnColors.drawerText2)),
    Menu(
        dTitle: 'Suppliers',
        droute: '',
        dicon0: const Icon(Icons.home),
        dicon1: const Icon(Icons.home, color: TgnColors.drawerText2)),
    Menu(
        dTitle: 'Payments',
        droute: '',
        dicon0: const Icon(Icons.home),
        dicon1: const Icon(Icons.home, color: TgnColors.drawerText2)),
    Menu(
        dTitle: 'Orders',
        droute: '',
        dicon0: const Icon(Icons.home),
        dicon1: const Icon(Icons.home, color: TgnColors.drawerText2)),
    Menu(
        dTitle: 'Invoice',
        droute: '',
        dicon0: const Icon(Icons.home),
        dicon1: const Icon(Icons.home, color: TgnColors.drawerText2)),
    Menu(
        dTitle: 'Add Buyers',
        droute: '',
        dicon0: const Icon(Icons.home),
        dicon1: const Icon(Icons.home, color: TgnColors.drawerText2)),
    Menu(
        dTitle: 'Add Sellers',
        droute: '',
        dicon0: const Icon(Icons.home),
        dicon1: const Icon(Icons.home, color: TgnColors.drawerText2)),
    Menu(
        dTitle: 'Rate Cards',
        droute: '',
        dicon0: const Icon(Icons.home),
        dicon1: const Icon(Icons.home, color: TgnColors.drawerText2)),
    Menu(
        dTitle: 'LogOut',
        droute: '',
        dicon0: const Icon(Icons.logout_rounded),
        dicon1: const Icon(Icons.logout_rounded, color: TgnColors.drawerText2)),
  ];

  //HomePage Category List Items
  final List<HomeItems> _cItems = [
    HomeItems(
        svgIcon: 'assets/triggin_icons/Bakery.svg',
        cTitle: 'Bakery',
        cRoute: ''),
    HomeItems(
        svgIcon: 'assets/triggin_icons/Vegetables.svg',
        cTitle: 'Vegetables',
        cRoute: ''),
    HomeItems(
        svgIcon: 'assets/triggin_icons/Bevarages.svg',
        cTitle: 'Bevarages',
        cRoute: ''),
    HomeItems(
        svgIcon: 'assets/triggin_icons/Proteins.svg',
        cTitle: 'Proteins',
        cRoute: ''),
    HomeItems(
        svgIcon: 'assets/triggin_icons/Bakery.svg',
        cTitle: 'Bakery',
        cRoute: ''),
    HomeItems(
        svgIcon: 'assets/triggin_icons/Vegetables.svg',
        cTitle: 'Vegetables',
        cRoute: ''),
    HomeItems(
        svgIcon: 'assets/triggin_icons/Bevarages.svg',
        cTitle: 'Bevarages',
        cRoute: ''),
    HomeItems(
        svgIcon: 'assets/triggin_icons/Proteins.svg',
        cTitle: 'Proteins',
        cRoute: ''),
    HomeItems(
        svgIcon: 'assets/triggin_icons/Bakery.svg',
        cTitle: 'Bakery',
        cRoute: ''),
    HomeItems(
        svgIcon: 'assets/triggin_icons/Vegetables.svg',
        cTitle: 'Vegetables',
        cRoute: ''),
    HomeItems(
        svgIcon: 'assets/triggin_icons/Bevarages.svg',
        cTitle: 'Bevarages',
        cRoute: ''),
    HomeItems(
        svgIcon: 'assets/triggin_icons/Proteins.svg',
        cTitle: 'Proteins',
        cRoute: ''),
  ];

  final List<HomeItems> _cardItems = [
    HomeItems(
        svgIcon: 'assets/triggin_icons/My Buyers.svg',
        cTitle: 'My Buyers',
        cRoute: ''),
    HomeItems(
        svgIcon: 'assets/triggin_icons/Suppliers.svg',
        cTitle: 'Suppliers',
        cRoute: ''),
    HomeItems(
        svgIcon: 'assets/triggin_icons/Payment.svg',
        cTitle: 'Payment',
        cRoute: ''),
    HomeItems(
        svgIcon: 'assets/triggin_icons/Invoice.svg',
        cTitle: 'Invoice',
        cRoute: ''),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: TgnColors.homepageBg,
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: TgnColors.primaryText,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            'Home',
            style: TgnTxtStyles.getTxtStyle(fontSize: 16.0),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                ))
          ],
        ),
        drawer: Drawer(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                " Triggin",
                style: TgnTxtStyles.getDrawerTxt(fontSize: 16, click: true),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ListView.builder(
                      itemCount: _dItems.length,
                      itemBuilder: (BuildContext context, i) {
                        return ListTile(
                          horizontalTitleGap: 0.0,
                          dense: true,
                          contentPadding: const EdgeInsets.only(
                              left: 5.0, top: 0.0, bottom: 0.0),
                          onTap: () {
                            setState(() {
                              for (int j = 0; j < _dItems.length; j++) {
                                if (i == j) {
                                  _dItems[i].isSelected = true;
                                } else {
                                  _dItems[j].isSelected = false;
                                }
                              }
                            });
                            if(i == (_dItems.length-1)) {
                              SharedPrefs.clearSharedPreferences();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Login()),
                              );
                            }
                          },
                          leading: _dItems[i].isSelected
                              ?  _dItems[i].dicon1
                              :
                                  _dItems[i].dicon0,

                          title: Text(
                            _dItems[i].dTitle,
                            style: TgnTxtStyles.getDrawerTxt(
                                fontSize: 16,
                                click: _dItems[i].isSelected ? true : false),
                          ),
                        );
                      }),
                ),
              ),
            ],
          ),
        )),
        body: Column(children: [
          ListTile(
            title: Card(
              borderOnForeground: true,
              elevation: 0,
              margin: EdgeInsets.zero,
              child: TextField(
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: const EdgeInsets.all(10),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  hintText: "Search for Product",
                  hintStyle: const TextStyle(
                      color: TgnColors.greyText,
                      fontSize: 16,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Roboto'),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                    child: IconButton(
                      icon: const Icon(
                        Icons.search,
                        textDirection: TextDirection.ltr,
                        color: TgnColors.greyText,
                        size: 23,
                      ),
                      onPressed: () {
                        //search button
                      },
                    ),
                  ),
                ),
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.search,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Explore by Category',
                    style: TgnTxtStyles.gethomeTxt(
                        fontSize: 14, weight: FontWeight.w500),
                  ),
                  InkWell(
                    onTap: () {},
                    child: const Text(
                      'See All(36)',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 10,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.underline,
                        color: TgnColors.blueTxt,
                      ),
                    ),
                  )
                ],
              ),
              subtitle: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                    children: _cItems.map((e) {
                  return Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 4.0),
                          child: SvgPicture.asset(
                            e.svgIcon,
                          ),
                        ),
                        Text(
                          e.cTitle,
                          style: TgnTxtStyles.gethomeTxt(
                              fontSize: 10, weight: FontWeight.w400),
                        )
                      ],
                    ),
                  );
                }).toList()),
              ),
            ),
          ),
          Expanded(
            child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
              return Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    height: 140,
                    child: Card(
                      elevation: 0,
                      margin: const EdgeInsets.all(8),
                      borderOnForeground: true,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      color: TgnColors.cardBg,
                      child: Stack(
                        children: const [
                          Positioned(
                              top: 25,
                              right: 85,
                              child: Text(
                                'GROCERY',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: TgnColors.cardBgText,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 31,
                                ),
                              ))
                        ],
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 93.0),
                          child: ListTile(
                            title: SizedBox(
                              height: 120,
                              child: Card(
                                elevation: 4,
                                borderOnForeground: true,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: _cardItems.map((e) {
                                      return Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          InkWell(
                                            onTap: () {},
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 4.0),
                                              child: SvgPicture.asset(
                                                e.svgIcon,
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {},
                                            child: Text(
                                              e.cTitle,
                                              style: TgnTxtStyles.getTxtStyle(
                                                  fontSize: 12),
                                            ),
                                          )
                                        ],
                                      );
                                    }).toList()),
                              ),
                            ),
                          ),
                        ),
                        ListTile(
                          title: SizedBox(
                            height: 120,
                            child: Card(
                              elevation: 4,
                              borderOnForeground: true,
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                    color: TgnColors.drawerText2, width: 1),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Stack(children: [
                                Positioned(
                                    top: 0,
                                    left: 0,
                                    bottom: 0,
                                    child: Image.asset(
                                      'assets/bg_assets/HomeRect.jpg',
                                      fit: BoxFit.fitHeight,
                                    )),
                                Center(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                          'assets/triggin_icons/vector/Invite Suppliers.svg'),
                                      Text(
                                        'Invite Suppliers',
                                        style: TgnTxtStyles.getTxtStyle(
                                            fontSize: 16),
                                      )
                                    ],
                                  ),
                                )
                              ]),
                            ),
                          ),
                        ),
                        ListTile(
                          title: SizedBox(
                            height: 120,
                            child: Card(
                              elevation: 4,
                              borderOnForeground: true,
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                    color: TgnColors.drawerText2, width: 1),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Stack(children: [
                                Positioned(
                                    top: 0,
                                    left: 0,
                                    bottom: 0,
                                    child: Image.asset(
                                      'assets/bg_assets/HomeRect.jpg',
                                      fit: BoxFit.fitHeight,
                                    )),
                                Center(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                          'assets/triggin_icons/vector/Invite Buyers.svg'),
                                      Text(
                                        'Invite Buyers',
                                        style: TgnTxtStyles.getTxtStyle(
                                            fontSize: 16),
                                      )
                                    ],
                                  ),
                                )
                              ]),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              );
            }),
          ),
        ]),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterDocked,
        floatingActionButton: Container(
          decoration: const BoxDecoration(
              shape: BoxShape.circle, gradient: TgnColors.linearGradientbtns),
          child: FloatingActionButton(
            backgroundColor: Colors.transparent,
            onPressed: () {},
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          elevation: 0,
          child: Card(
            elevation: 4,
            margin: EdgeInsets.zero,
            child: SizedBox(
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.home,
                        color: TgnColors.btnGradient2,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.home,
                        color: TgnColors.btnGradient2,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.home,
                        color: TgnColors.btnGradient2,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.home,
                        color: TgnColors.btnGradient2,
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
