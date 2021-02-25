import 'package:flutter/material.dart';
import 'package:taoju5/bapp/domain/model/order/order_logistics_model.dart';
import 'package:get/utils.dart';

class PacketLogisticsStationCard extends StatefulWidget {
  final PacketStationModel station;
  final List<PacketStationModel> stationList;
  const PacketLogisticsStationCard(
      {Key key, @required this.station, @required this.stationList})
      : super(key: key);

  @override
  _PacketLogisticsStationCardState createState() =>
      _PacketLogisticsStationCardState();
}

class _PacketLogisticsStationCardState
    extends State<PacketLogisticsStationCard> {
  PacketStationModel get station => widget.station;
  List<PacketStationModel> get stationList => widget.stationList;
  double mHeight = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((callback) {
      RenderObject renderObject = context.findRenderObject();
      setState(() {
        mHeight = (renderObject.semanticBounds.size.height) / 2;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 72,
            child: Column(
              children: [
                Text(station.arriveAtDate ?? "-.--"),
                Text(station.arriveAtTime ?? "-.--"),
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                Container(
                  width: 1,
                  height: mHeight,
                  color: station == stationList?.first
                      ? Colors.transparent
                      : Color(0xFFD3D3D3),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                      color: station == stationList?.first
                          ? Color(0xFF242424)
                          : Colors.white,
                      border: Border.all(
                        color: station == stationList?.first
                            ? Colors.transparent
                            : Color(0xFFD3D3D3),
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                ),
                Container(
                  width: 1,
                  height: mHeight,
                  color: station == stationList?.last
                      ? Colors.transparent
                      : Color(0xFFD3D3D3),
                )
              ],
            ),
          ),
          Expanded(
              child: Container(
            alignment: Alignment.topLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Visibility(
                    visible: !GetUtils.isNullOrBlank(station.description),
                    child: Text(station.description)),
                Visibility(
                    visible: !GetUtils.isNullOrBlank(station.name),
                    child: Text(station.name))
              ],
            ),
          ))
        ],
      ),
    );
  }
}
