import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ota/utils/colors.dart';
import 'package:ota/utils/size_constants.dart';
import 'package:ota/utils/styles.dart';
import 'package:ota/viewmodels/transfer_view_models/transfer_search_view_model.dart';
import 'package:provider/provider.dart';

class SearchTransfer extends StatefulWidget {
  BookTransferViewModel model;

  SearchTransfer(this.model);

  @override
  State<StatefulWidget> createState() => _SearchTransfer();
}

class _SearchTransfer extends State<SearchTransfer> {
  var height;
  var width;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height / 10;

    width = MediaQuery.of(context).size.width / 10;

    // TODO: implement build
    return ChangeNotifierProvider.value(
        value: widget.model,
        child:
            Consumer<BookTransferViewModel>(builder: (context, model, child) {
          return Column(children: [
            SizedBox(
              height: 30,
            ),

            _searchBar(),
            //IconButton(icon: Icons., onPressed: null)

            SizedBox(
              height: 0,
            ),

            _searchResult(),
          ]);
        }));
  }

  Widget _searchBar() {
    return Card(
      elevation: 3,
      margin: EdgeInsets.only(top: 0, bottom: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0.0),
      ),
      child: Container(
        height: height * .8,
        child: Row(
          children: <Widget>[
            Container(
              width: width * 1.5,
              child:

              IconButton(icon: Icon(Icons.arrow_back_ios,color: CustomColors.BackGround,),
                  onPressed: (){
                    Navigator.pop(context);
                  }
              )

            ),
            Container(
              width: width * 8.5,
              alignment: Alignment.centerLeft,
              child: TextFormField(
                textAlign: TextAlign.start,
                // controller:flightType==0 ?model.startFromController:model.destinationController,

                autofocus: true,
                onChanged: (text) {
                  widget.model.getPredcitions(text);
                },

                decoration:   InputDecoration(
                  hintText: widget.model.sourceType ? "From" : "Destination",
                  hintStyle: CustomStyles.medium16,

//                  suffixIcon: IconButton(
//                    color: Colors.red,
//                    onPressed: () {
//                      model.fromTypeHeadController.clear();
//                    },
//                    icon: Icon(
//                      Icons.cancel,
//                      size: SizeConstants.SIZE_20,
//                    ),
//                  ),
                  alignLabelWithHint: true,
                  border: InputBorder.none,
                ),





              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _searchResult() {
    return Flexible(
      child: FutureBuilder(
          initialData: widget.model.predictionList,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return ListView.builder(
                shrinkWrap: true,
                itemCount: widget.model.predictionList.length,
                itemBuilder: (BuildContext context, int item) {
                  return InkWell(

                     onTap: (){


                      widget.model.sourceType?   widget.model.setFromSelected(widget.model.predictionList[item]):
                      widget.model.setSelectedDestination(widget.model.predictionList[item]);

                      Navigator.pop(context);
                      widget.model.predictionList.clear();


                    },

                    child: Container(
                      alignment: Alignment.centerLeft,
                      color: Colors.transparent,
                      margin: EdgeInsets.only(left: 0, right: 0, top: 4, bottom: 4),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(

                                    width: width * 1.5,
                                    //padding: EdgeInsets.only(left: 10,right: 10,top: 0),
                                    child: Image.asset(
                                      'assets/images/location.png',
                                      height: 21,
                                      color: CustomColors.BackGround.withOpacity(.8),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding:
                                      const EdgeInsets.only(top: 10.0, bottom: 10.0),
                                      child: Text(
                                        widget.model.predictionList[item].description,
                                        style: CustomStyles.countDownStyle.copyWith(color: Colors.black87, fontWeight: FontWeight.bold),

                                      ),
                                    ),
                                  )
                                ]),
                            Container(
                              height: 1,
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width,
                              color: CustomColors.disabledButton.withOpacity(.5),
                            )
                          ]),
                    ),
                  );
                });
          }),
    );
  }
}
