import 'package:exchange/screen/history/Trade/Buy.dart';
import 'package:exchange/screen/history/Trade/price.dart';
import 'package:exchange/screen/history/Trade/total_ada.dart';
import 'package:flutter/material.dart';
import '../../../config/constantClass.dart';
import '../../home/Gainer.dart';
import '../../home/Loser.dart';
import '../../home/hotDeals.dart';
import '../Complete_Order.dart';
import '../Open_Orders.dart';
import '../Product_History.dart';
import '../Transactions.dart';
import 'Nodata.dart';
import 'Sell.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
class Trade extends StatefulWidget {
  @override
  State<Trade> createState() => _TradeState();
}

class _TradeState extends State<Trade> {
  @override
  var _selectedValue = 0.000001;
  TabController _tabController;
  List<DropdownMenuItem<double>> _dropDownItems = [
    DropdownMenuItem<double>(
      value: 0.000001,
      child: Text('0.000001', style: TextStyle(fontSize: 12),),),
    DropdownMenuItem<double>(
      value: 0.00001,
      child: Text('0.00001', style: TextStyle(fontSize: 12)),),
    DropdownMenuItem<double>(
      value: 0.0001,
      child: Text('0.0001', style: TextStyle(fontSize: 12)),),
    DropdownMenuItem<double>(
      value: 0.001,
      child: Text('0.001', style: TextStyle(fontSize: 12)),),
    DropdownMenuItem<double>(
      value: 0.01,
      child: Text('0.01', style: TextStyle(fontSize: 12)),
    ),
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: day == false ? Colors.black : Color(0xfff6f6f6),
      body: Padding(
        padding: const EdgeInsets.only(top: 30.0, left: 5, bottom: 5),
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              height: 50,
              width: 400,
              color: day == false ? Color(0xff181818) : Colors.white,
              child: Text("BTC/USDT", style: TextStyle(color: day == false ? Colors.white : Color(0xff0a0909), fontSize: 18, fontWeight: FontWeight.bold),),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                color: day == false ? Color(0xff181818) : Colors.white,
              ),
              child: Row(
                children: [
                  Column(
                    children: [
                      Container(
                        height: 450,
                        width: 200,
                        color: day == false ? Color(0xff181818) : Colors.white,
                        child: Expanded(
                          child: Container(
                            child: DefaultTabController(
                              length: 2,
                              child: Card(
                                color: day == false ? Color(0xff181818) : Color(0xffffffff),
                                child: new Scaffold(
                                  backgroundColor: day == false ? Color(0xff181818) : Color(0xffffffff),
                                  appBar: PreferredSize(
                                    preferredSize: Size.fromHeight(
                                        5.0), // here the desired height
                                    child: Container(
                                      color: day == false ? Color(0xff181818) : Color(0xffffffff),
                                      child: new AppBar(
                                        backgroundColor: day == false ? Color(0xff181818) : Color(0xffffffff),
                                        elevation: 0.0,
                                        centerTitle: true,
                                        flexibleSpace: Container(
                                          color: day == false ? Color(0xff181818) : Color(0xffffffff),
                                          child: Padding(
                                            padding: const EdgeInsets.all(0),
                                            child: Container(
                                              child: new TabBar(
                                                isScrollable: true,
                                                labelPadding: EdgeInsets.all(10),
                                                controller: _tabController,
                                                indicatorColor: Color(0xfff9bf30),
                                                labelColor: day == false ? Colors.white : Colors.grey,
                                                labelStyle: TextStyle(
                                                    fontWeight: FontWeight.bold, decorationThickness: 2, decorationColor: Color(0xfff9bf30)),
                                                unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
                                                unselectedLabelColor: day == false ? Colors.white60 : Colors.black45,
                                                tabs: [
                                                  new Tab(
                                                    child: Row(
                                                      children: <Widget>[
                                                        Padding(padding: const EdgeInsets.only(left: 5.0, right: 10.0),
                                                          child: Text("Buy", style: TextStyle(fontFamily: "IBM Plex Sans",),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  new Tab(
                                                    child: Row(
                                                      children: <Widget>[
                                                        Padding(padding: const EdgeInsets.only(left: 50.0,
                                                          ),
                                                          child: Text("Sell", style: TextStyle(fontFamily: "IBM Plex Sans",),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        automaticallyImplyLeading: false,
                                      ),
                                    ),
                                  ),
                                  body: Container(
                                    color: day == false ? Color(0xff181818) : Color(0xffffffff),
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 0.0),
                                      child: new TabBarView(
                                        controller: _tabController,
                                        children: [
                                          buy(),
                                          sell(),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: Container(
                      height: 460,
                      width: 182,
                      color: day == false ? Color(0xff181818) : Colors.white,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text("Price", style: TextStyle(color: Colors.grey, fontSize: 12)),
                                  Text("(USDT)", style: TextStyle(color: Colors.grey, fontSize: 10)),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  price(),
                                ],
                              ),
                              Column(
                                children: [
                                  Text("Total", style: TextStyle(color: Colors.grey, fontSize: 12)),
                                  Text("(ADA)", style: TextStyle(color: Colors.grey, fontSize: 12)),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  ada(),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 1),
                                margin: EdgeInsets.only(left: 25),
                                height: 20,
                                width: 120,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                child: Row(
                                  children: [
                                    DropdownButton<double>(
                                      underline: SizedBox(),
                                      value: _selectedValue,
                                      items: _dropDownItems,
                                      onChanged: (value) {
                                        setState(() {
                                          _selectedValue = value;
                                        });
                                      },
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.only(left: 10),
                                height: 20,
                                width: 25,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                child: IconButton(
                                  padding: EdgeInsets.only(bottom: 5),
                                  iconSize: 15,
                                  color: Colors.grey,
                                  onPressed: () {

                                  },
                                  icon: const Icon(
                                    Icons.receipt_sharp,
                                    color: Colors.grey,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            SingleChildScrollView(
              child: Container(
                height: 155,
                width: 400,
                color: day == false ? Color(0xff181818) : Colors.white,
                child: Expanded(
                  child: Container(
                    child: DefaultTabController(
                      length: 3,
                      child: Card(color: day == false ? Color(0xff181818) : Color(0xffffffff),
                        child: new Scaffold(backgroundColor: day == false ? Color(0xff181818) : Color(0xffffffff),
                          appBar: PreferredSize(
                            preferredSize: Size.fromHeight(
                                20.0), // here the desired height
                            child: Container(
                              color: day == false ? Color(0xff181818) : Color(0xffffffff),
                              child: new AppBar(
                                backgroundColor: day == false ? Color(0xff181818) : Color(0xffffffff),
                                elevation: 0.0,
                                centerTitle: true,
                                flexibleSpace: Container(
                                  color: day == false ? Color(0xff181818) : Color(0xffffffff),
                                  child: Padding(
                                    padding: const EdgeInsets.all(0),
                                    child: Container(
                                      child: new TabBar(
                                        isScrollable: true,

                                        labelPadding: EdgeInsets.all(10),

                                        controller: _tabController,
                                        indicatorColor: Color(0xfff9bf30),
                                        labelColor: day == false ? Colors.white : Colors.grey,

                                        // indicatorColor: Colors.blue,
                                        labelStyle: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            decorationThickness: 2,
                                            decorationColor: Color(0xfff9bf30)),

                                        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
                                        unselectedLabelColor: day == false ? Colors.white60 : Colors.black45,

                                        indicatorSize: TabBarIndicatorSize.tab,

                                        tabs: [
                                          new Tab(
                                            child: Row(
                                              children: <Widget>[
                                                Padding(padding: const EdgeInsets.only(left: 5.0, right: 10.0),
                                                  child: Text("Open Orders", style: TextStyle(fontFamily: "IBM Plex Sans",),),
                                                )
                                              ],
                                            ),
                                          ),
                                          new Tab(
                                            child: Row(
                                              children: <Widget>[
                                                Padding(padding: const EdgeInsets.only(left: 5.0, right: 10.0),
                                                  child: Text("Open History", style: TextStyle(),),
                                                )
                                              ],
                                            ),
                                          ),
                                          new Tab(
                                            child: Row(
                                              children: <Widget>[
                                                Padding(padding: const EdgeInsets.only(left: 5.0, right: 10.0),
                                                  child: Text("Funds", style: TextStyle(fontFamily: "IBM Plex Sans",),),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                automaticallyImplyLeading: false,
                              ),
                            ),
                          ),
                          body: Container(
                            color: day == false ? Color(0xff181818) : Color(0xffffffff),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 0.0),
                              child: new TabBarView(
                                controller: _tabController,
                                children: [
                                  RemainingopenOrders(),
                                  CompleteopenOrders(),
                                  Nodata(),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
