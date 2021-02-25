import 'package:flutter/material.dart';
import 'package:taoju5/bapp/domain/model/order/order_logistics_model.dart';
import 'package:taoju5/bapp/ui/pages/order/order_detail/subpage/logistics/widget/packet_logistics_station_card.dart';
import 'dart:math' as math;
import 'package:get/get.dart';
import 'package:taoju5/bapp/ui/widgets/base/x_expansion_panel.dart';

class PacketLogisticsCard extends StatefulWidget {
  final PacketLogisticsModel packet;
  PacketLogisticsCard({Key key, @required this.packet}) : super(key: key);

  @override
  _PacketLogisticsCardState createState() => _PacketLogisticsCardState();
}

class _PacketLogisticsCardState extends State<PacketLogisticsCard> {
  PacketLogisticsModel get packet => widget.packet;

  bool isOpen = false;

  int get visibleCount => math.min(packet.stationList.length, 3);

  List<PacketStationModel> get hiddenStation =>
      packet.stationList.sublist(visibleCount);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text(packet.name), Text(packet.status)],
          ),
          Text("快递公司:${packet.company}"),
          Text("快递公司:${packet.no}"),
          Text("快递信息:"),
          ListView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.all(0),
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int i) {
              return PacketLogisticsStationCard(
                  station: packet.stationList[i],
                  stationList: packet.stationList.sublist(0, visibleCount));
            },
            itemCount: visibleCount,
          ),
          Visibility(
              child: XExpansionPanel(
                  title: Visibility(
                    visible: !isOpen,
                    child: ActionChip(
                      backgroundColor: Get.theme.primaryColor,
                      label: Text("更多快递信息"),
                      onPressed: () {
                        setState(() {
                          isOpen = true;
                        });
                      },
                    ),
                  ),
                  children: [
                for (PacketStationModel item in hiddenStation)
                  PacketLogisticsStationCard(
                      station: item, stationList: hiddenStation)
              ]))
        ],
      ),
    );
  }
}
