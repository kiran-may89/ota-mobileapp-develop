import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ota/utils/colors.dart';
import 'package:ota/utils/styles.dart';
import 'package:ota/viewmodels/transfer_view_models/transfer_results_model.dart';
import 'package:ota/viewmodels/transfer_view_models/transfer_results_model.dart';
import 'package:ota/viewmodels/transfer_view_models/transfer_results_model.dart';
import 'package:provider/provider.dart';

/*
class TransferFilter extends st {

  TransferResultsModel model;

  BuildContext context;

  TransferFilter(this.model, this.context);

  @override
  _TransferFilterState createState() => _TransferFilterState(model,context);
}*/

class TransferFilterState extends StatelessWidget {


  TransferResultsModel model;

  BuildContext context;

  TransferFilterState(this.model, this.context);



  @override
  Widget build(BuildContext context) {



    return ChangeNotifierProvider.value(

    value: model,

    child:

    Consumer<TransferResultsModel>(builder: (context, model,child){


    return

    Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,

      children: <Widget>[
        SizedBox(height: 20,),
        Text('Price Range',style: CustomStyles.medium14.copyWith(color: CustomColors.heading.withOpacity(.5)),),
        SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(5),
              child: Text(model.transferSearchResponse.result.vechiles.first.currency+" "+ model.priceRange.start.floor().toString(),style: CustomStyles.normal12.copyWith(color: CustomColors.BackGround),),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: CustomColors.disabledButton)
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: Text(model.transferSearchResponse.result.vechiles.first.currency+" "+ model.priceRange.end.floor().toString(),style: CustomStyles.normal12.copyWith(color: CustomColors.BackGround),),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: CustomColors.disabledButton)
              ),
            )

        ],),
        SizedBox(height: 20,),


        RangeSlider(

          min: model.minPriceRange,
          max: model.maxPriceRange,
           activeColor:CustomColors.BackGround ,
           inactiveColor: CustomColors.disabledButton,

          values: model.priceRange,

          onChanged: (RangeValues value) {

            model.changePriceRangeSelection(value);

          },
        ),

        SizedBox(height: 20,),

        Text('Cab Type',style: CustomStyles.medium14.copyWith(color: CustomColors.heading.withOpacity(.5)),),

        SizedBox(height: 5),

        Row(children: <Widget>[

          Expanded(child:
//          Row(children: <Widget>[
//
//            Radio(
//              activeColor: CustomColors.BackGround,
//              value: 1,
//              groupValue: model.cabType,
//              onChanged: model.cabSelection_Changes,
//            ),
//            Text("Standard", style: model.cabType==1?CustomStyles.calenderStyle.copyWith(color: CustomColors.BackGround):CustomStyles.calenderStyle
//              ,),
//          ],),
          checkbox("Standard", model.standardFilter, 'standard')
          ,flex: 1,),

          Expanded(child:
//          Row(children: <Widget>[
//
//            Radio(
//              activeColor: CustomColors.BackGround,
//              value: 2,
//              groupValue: model.cabType,
//              onChanged: model.cabSelection_Changes,
//            ), Text("Minivan", style: model.cabType==2?CustomStyles.calenderStyle.copyWith(color: CustomColors.BackGround):CustomStyles.calenderStyle
//              ,),
//          ],)
          checkbox("Minivan", model.minivanFilter, 'minivan')
          , flex: 1,),

          Expanded(child:
//          Row(children: <Widget>[
//
//            Radio(
//              activeColor: CustomColors.BackGround,
//              value: 3,
//              groupValue: model.cabType,
//              onChanged: model.cabSelection_Changes,
//            ),
//            Text("Minibus", style: model.cabType==3?CustomStyles.calenderStyle.copyWith(color: CustomColors.BackGround):CustomStyles.calenderStyle
//              ,),
//          ],),
          checkbox("Minibus", model.minibusFilter, 'minibus'),
          flex: 1,),


        ],),

        SizedBox(height: 20),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Flexible(
                fit: FlexFit.tight,
                child: FlatButton(onPressed: () {
                  model.clearFilters();

                  Navigator.pop(context);


                },padding: EdgeInsets.all(15),
                  child: Text('CLEAR ALL',
                    style: CustomStyles.button_style.copyWith(
                        color: CustomColors.disabledButton),),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),side: BorderSide(color: CustomColors.disabledButton,width: 2)),

                )
            ),
            SizedBox(width: 20,),
            Flexible(
                fit: FlexFit.tight,
                child: FlatButton(color: CustomColors.Orange,
                  onPressed: () {

                  model.applyFilters();

                  Navigator.pop(context);



                  },padding: EdgeInsets.all(15),
                  child: Text('APPLY',
                    style: CustomStyles.button_style,),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),side: BorderSide(color: CustomColors.Orange,width: 2)),

                ))

          ],
        ),
        SizedBox(height: 10),







//           RangeSlider(
//  values: _values,
//  min: 0,
//  max: 100,
//  onChanged: (RangeValues values) {
//    setState(() {
//      if (values.end - values.start >= 20) {
//        _values = values;
//      } else {
//        if (_values.start == values.start) {
//          _values = RangeValues(_values.start, _values.start + 20);
//        } else {
//          _values = RangeValues(_values.end - 20, _values.end);
//        }
//      }
//    });
//  }
//);








      ],



    );

    }

    )

    );


  }


  Widget checkbox(String title, bool boolValue,cabType) {
  return Theme(
  data: ThemeData(
  unselectedWidgetColor: CustomColors.disabledButton,

  selectedRowColor: CustomColors.BackGround,

  ),
  child: CheckboxListTile(
  checkColor: CustomColors.White,
  activeColor: CustomColors.BackGround,
  dense: true,
  value: boolValue,
  contentPadding: EdgeInsets.symmetric(horizontal: 1),
  onChanged: (bool value) {

  model.cabSelection_Changes(value,cabType);

  },
  title: Text(title,style:CustomStyles.calenderStyle ,),
  controlAffinity: ListTileControlAffinity.leading,
  ),
  );
//      Row(
//      mainAxisAlignment: MainAxisAlignment.center,
//      children: <Widget>[
//        Text(title,style: CustomStyles.calenderStyle,),
//        SizedBox(width: 5,),
//        Checkbox(
//          checkColor: CustomColors.BackGround,
//          activeColor: CustomColors.BackGround,
//          value: boolValue,
//          onChanged: (bool value) {
//
//            model.changeStops(value,stopType);
//
//          },
//        )
//      ],
//    );
  }

}
