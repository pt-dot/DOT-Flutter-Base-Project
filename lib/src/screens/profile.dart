import 'package:base_flutter/src/data/constants.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: <Widget>[
          _topPanel(context)
        ],
      )
    );
  }

  Widget _topPanel(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: EdgeInsets.all(dpConverter(context, 5.0)),
      child: Stack(
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              _userAvatar(context),
              SizedBox(width: dpConverter(context, 5.0)),
              Flexible(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _userFullName(context),
                    _userEmail(context)
                  ],
                ),
              )
            ],
          ),
          Align(
            alignment: Alignment.topRight,
            child: InkWell(
              child: Text('Detail', style: TextStyle(color: AppColors.grey, fontSize: TextSizeConst.regular)),
              onTap: () => null,
            ),
          )
        ],
      )
    );
  }

  Widget _userAvatar(context) {
    return CircleAvatar(
      radius: dpConverter(context, 6.5), 
      backgroundImage: NetworkImage('https://i.imgur.com/XcTBj1y.png')
    ); 
  }

  Widget _userFullName(context) {
    return  Container(
      padding: EdgeInsets.only(right: dpConverter(context, 10.0)),
      child: Text('Michael John', style: TextStyleConst.titleText)
    );
      
  }

  Widget _userEmail(context) {
    return Container(
      padding: EdgeInsets.only(right: dpConverter(context, 10.0)),
      child: Text('michaeljohn@gmail.com', style: TextStyle(color: AppColors.grey, fontSize: TextSizeConst.regular)),
    );
  }

}