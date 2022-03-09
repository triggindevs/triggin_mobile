import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:triggin_app/design_files/colors.dart';
import 'package:triggin_app/design_files/text_styles.dart';
import 'package:triggin_app/widgets/circular_btn.dart';

import '../class_files/class.dart';
import 'category_type.dart';

class BusinessType extends StatefulWidget {
  const BusinessType({Key key}) : super(key: key);

  @override
  _BusinessTypeState createState() => _BusinessTypeState();
}

class _BusinessTypeState extends State<BusinessType> {
  final List<BsListData> _bstView = [
    BsListData(
      bstTitle: 'Manufacturers',
      bstRoute: '',
      bstIcon: 'assets/triggin_icons/manufacture.svg'
    ),
    BsListData(
      bstTitle: 'Dealers / Distributors Wholesaler / Stockist',
      bstRoute: '',
        bstIcon: 'assets/triggin_icons/distributor.svg'
    ),
    BsListData(
      bstTitle: 'Retailer / Franchise / Outlet / Brand Outlet',
      bstRoute: '',
        bstIcon: 'assets/triggin_icons/retailer.svg'
    ),
    BsListData(
      bstTitle: 'Brand Owner / Franchise Owner',
      bstRoute: '',
        bstIcon: 'assets/triggin_icons/owner.svg'
    ),
  ];

  @override
  Widget build(BuildContext context) {
    bool _typeSelected = false;
    return SafeArea(
      child: Scaffold(
         backgroundColor: TgnColors.bgColor,
          appBar: AppBar(
             iconTheme: const IconThemeData(
                  color: TgnColors.primaryText, //change your color here
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text(
              ' Business Type',
              style: TgnTxtStyles.getTxtStyle(fontSize: 20.0),
            ),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search,
                    textDirection: TextDirection.rtl,
                  ))
            ],
          ),
        body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          // constraints variable has the size info
          return Stack(
            children: [
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Image.asset('assets/bg_assets/Rectangle.jpg'),
              ),
              Column(
                children: [
                  SizedBox(
                    // color: Colors.redAccent,
                    height: constraints.maxHeight * 0.077,
                    child: const ListTile(title: Text(' Select which is appropriate to you')),
                  ),
                  SizedBox(
                    height: constraints.maxHeight * 0.77,
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: constraints.maxHeight * 0.027),
                      child: Card(
                        margin: EdgeInsets.zero,
                        borderOnForeground: true,
                        elevation: 2,
                        child: Stack(
                          children: [
                            Positioned(
                                top: 0,
                                left: 0,
                                child:
                                    Image.asset('assets/bg_assets/Semi.jpg')),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(

                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('LOGO',
                                      style: TgnTxtStyles.getTxtStyle(
                                          fontSize: 36)),
                                  Expanded(
                                    child: Center(
                                      child: ListView.builder(
                                         shrinkWrap: true,
                                        itemCount: _bstView.length,
                                        itemBuilder: (BuildContext context, i) {
                                          return Padding(
                                            padding: EdgeInsets.only(
                                                bottom: constraints.maxHeight * 0.024),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color:
                                                        TgnColors.trigginBorder,
                                                    width: 1),
                                                borderRadius:
                                                    const BorderRadius.all(
                                                  Radius.circular(5),
                                                ),
                                                gradient: _bstView[i].isSelected
                                                    ? TgnColors.linearGradientbtns
                                                    : null,
                                              ),
                                              child: ListTile(
                                                onTap: () {
                                                  setState(() {
                                                    for (int j = 0;
                                                        j < _bstView.length;
                                                        j++) {
                                                      if (i == j) {
                                                        _bstView[i].isSelected =
                                                            true;
                                                      } else {
                                                        _bstView[j].isSelected =
                                                            false;
                                                      }
                                                    }
                                                    _typeSelected = true;
                                                    print(_typeSelected);
                                                  });
                                                },
                                                leading: CircleAvatar(
                                                    backgroundColor:
                                                        _bstView[i].isSelected
                                                            ? Colors.white
                                                            : TgnColors.avatarBg,
                                                    child: SvgPicture.asset(
                                                      _bstView[i].bstIcon,
                                                    ),),
                                                title: Text(
                                                  _bstView[i].bstTitle,
                                                  style: _bstView[i].isSelected
                                                      ? TgnTxtStyles.tileTxtStyle
                                                      : TgnTxtStyles.getTxtStyle(
                                                          fontSize: 12), //12
                                                ),
                                                trailing: _bstView[i].isSelected
                                                    ? const Icon(
                                                        Icons
                                                            .check_circle_rounded,
                                                        color: Colors.white,
                                                      )
                                                    : const Icon(
                                                        Icons.circle_outlined,
                                                      ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),),
                                  Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text('Next',
                                                  style:
                                                      TgnTxtStyles.getTxtStyle(
                                                          fontSize: 24)),
                                              Container(
                                                margin: const EdgeInsets.only(
                                                    bottom: 2, top: 4),
                                                height: 5.0,
                                                width: 80.0,
                                                color: TgnColors.primaryText,
                                              ),
                                            ],
                                          ),
                                          InkWell(
                                            splashColor: TgnColors.bgColor,
                                            onTap: () {
                                              print('clicked');
                                             // if (_typeSelected == true) {
                                                 print('clicked1');
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const CategoryType()),
                                                );
                                               print('clicked3');
                                            },
                                            child: const CirGradBtn(),
                                          ),
                                        ],
                                      ),const SizedBox(
                                    height: 15,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    //color: Colors.transparent,
                    height: constraints.maxHeight * 0.15,
                  ),
                ],
              ),
            ],
          );
        }),
      ),
    );
  }
}
