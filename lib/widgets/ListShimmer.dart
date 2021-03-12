import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:toggl_client_app/utils/InterfaceUtilities.dart';

class ListShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: 7,
            itemBuilder: (context, index) {
              return Container(
                // height: InterfaceUtilities.getPercentageOfScreenHeight(context, 0.06),
                margin:
                EdgeInsets.all(10.0),
                padding: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                          InterfaceUtilities.borderRadiusMedium),
                    )),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(color: Colors.white,height: 17.0,width: InterfaceUtilities.getPercentageOfScreenWidth(context, 0.3),),
                    SizedBox(
                      height: 5.0,
                    ),
                    Container(color: Colors.white,height: 17.0,width: InterfaceUtilities.getPercentageOfScreenWidth(context, 0.5),),
                    SizedBox(
                      height: 5.0,
                    ),
                    Container(color: Colors.white,height: 17.0,width: InterfaceUtilities.getPercentageOfScreenWidth(context, 0.7),),
                  ],
                ),
              );
            }),
        baseColor: Theme.of(context).primaryColor,
        highlightColor: Colors.grey[300]
    );
  }
}
