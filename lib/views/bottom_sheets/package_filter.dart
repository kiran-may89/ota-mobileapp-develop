import 'package:flutter/material.dart';
import 'package:ota/utils/colors.dart';
import 'package:ota/utils/styles.dart';
import 'package:ota/viewmodels/package/package_results_viewmodels.dart';
import 'package:provider/provider.dart';

class PackageFilter extends StatefulWidget {
  PackageResultsViewModel model;

  BuildContext context;

  PackageFilter(this.model, this.context);

  @override
  _PackageFilterState createState() =>
      _PackageFilterState(model, context);
}

class _PackageFilterState
    extends State<PackageFilter> {
  PackageResultsViewModel model;

  BuildContext context;

  _PackageFilterState(this.model, this.context);

  @override
  Widget build(context) {
    return ChangeNotifierProvider.value(
        value: model,
        child: Consumer<PackageResultsViewModel>(
            builder: (context, model, child) {
          return Expanded(
            child: Container(
              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Flexible(
                    flex: 8,
                    fit: FlexFit.tight,
                    child: Container(
                      child: SingleChildScrollView(
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment:
                              CrossAxisAlignment
                                  .start,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            model.categoryList.result
                                        .length !=
                                    0
                                ? Card(
                                    elevation: 7,
                                    margin:
                                        EdgeInsets
                                            .all(7),
                                    child:
                                        Container(
                                      padding:
                                          EdgeInsets
                                              .all(
                                                  7),
                                      child: Column(
                                        children: <
                                            Widget>[
                                          GestureDetector(
                                            child:
                                                Row(
                                              children: [
                                                Text(
                                                  'Categories',
                                                  style: CustomStyles.medium16.copyWith(color: CustomColors.heading),
                                                ),
                                                Spacer(),
                                                !model.openCategories
                                                    ? Icon(Icons.expand_more)
                                                    : Icon(Icons.keyboard_arrow_up)
                                              ],
                                            ),
                                            onTap:
                                                () {
                                              model
                                                  .openCloseCategories();
                                            },
                                          ),
                                          Visibility(
                                              visible:
                                                  model.openCategories,
                                              child: ListView.builder(
                                                  shrinkWrap: true,
                                                  primary: false,
                                                  itemCount: model.categoryList.result.length, // records.length
                                                  itemBuilder: (BuildContext context, int index) {
                                                    return GestureDetector(
                                                      onTap: () {
                                                        model.filterItemsAddAndRemove(index);
                                                      },
                                                      child: Container(
                                                        //height: 20,
                                                        child: Column(
                                                          mainAxisSize: MainAxisSize.min,
                                                          children: [
                                                            SizedBox(
                                                              height: 5,
                                                            ),
                                                            Row(
                                                              children: <Widget>[
                                                                Flexible(
                                                                    fit: FlexFit.tight,
                                                                    child: Text(
                                                                      model.categoryList.result[index].name,
                                                                      style: CustomStyles.heading.copyWith(color: model.checkAppliedCategories(index) ? CustomColors.BackGround : CustomColors.heading.withOpacity(.5)),
                                                                    )),
                                                                Icon(
                                                                  Icons.check_circle,
                                                                  color: model.checkAppliedCategories(index) ? CustomColors.BackGround : CustomColors.heading.withOpacity(.5),
                                                                )
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              height: 5,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  })),
                                        ],
                                      ),
                                    ),
                                  )
                                : SizedBox.shrink(),
                            SizedBox(height: 10),
                            model.destinationList.result
                                        .length !=
                                    0
                                ? Card(
                                    elevation: 7,
                                    margin:
                                        EdgeInsets
                                            .all(7),
                                    child:
                                        Container(
                                      padding:
                                          EdgeInsets
                                              .all(
                                                  7),
                                      child: Column(
                                        children: <
                                            Widget>[
                                          GestureDetector(
                                            child:
                                                Row(
                                              children: [
                                                Text(
                                                  'Destinations',
                                                  style: CustomStyles.medium16.copyWith(color: CustomColors.heading),
                                                ),
                                                Spacer(),
                                                !model.openDestinations
                                                    ? Icon(Icons.expand_more)
                                                    : Icon(Icons.keyboard_arrow_up)
                                              ],
                                            ),
                                            onTap:
                                                () {
                                              model.openCloseDestinations();
                                            },
                                          ),
                                          Visibility(
                                              visible:
                                                  model.openDestinations,
                                              child: ListView.builder(
                                                  shrinkWrap: true,
                                                  primary: false,
                                                  itemCount: model.destinationList.result.length, // records.length
                                                  itemBuilder: (BuildContext context, int index) {
                                                    return GestureDetector(
                                                      onTap: () {
                                                        model.destinationsAddAndRemove(index);
                                                      },
                                                      child: Container(
                                                        //height: 20,
                                                        child: Column(
                                                          mainAxisSize: MainAxisSize.min,
                                                          children: [
                                                            SizedBox(
                                                              height: 5,
                                                            ),
                                                            Row(
                                                              children: <Widget>[
                                                                Flexible(
                                                                    fit: FlexFit.tight,
                                                                    child: Text(
                                                                      model.destinationList.result[index].name,
                                                                      style: CustomStyles.heading.copyWith(color: model.checkAppliedDestinations(index) ? CustomColors.BackGround : CustomColors.heading.withOpacity(.5)),
                                                                    )),
                                                                Icon(
                                                                  Icons.check_circle,
                                                                  color: model.checkAppliedDestinations(index) ? CustomColors.BackGround : CustomColors.heading.withOpacity(.5),
                                                                )
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              height: 5,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  })),
                                        ],
                                      ),
                                    ),
                                  )
                                : SizedBox.shrink(),
                            SizedBox(height: 10),

                          ],
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 2,
                    child: Row(
                      mainAxisAlignment:
                          MainAxisAlignment
                              .spaceBetween,
                      children: <Widget>[
                        Flexible(
                            fit: FlexFit.tight,
                            child: FlatButton(
                              onPressed: () {
                                model
                                    .clearFilters();

                                Navigator.pop(
                                    context);
                              },
                              padding:
                                  EdgeInsets.all(
                                      15),
                              child: Text(
                                'CLEAR ALL',
                                style: CustomStyles
                                    .button_style
                                    .copyWith(
                                        color: CustomColors
                                            .disabledButton),
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius
                                          .circular(
                                              15.0),
                                  side: BorderSide(
                                      color: CustomColors
                                          .disabledButton,
                                      width: 2)),
                            )),
                        SizedBox(
                          width: 20,
                        ),
                        Flexible(
                            fit: FlexFit.tight,
                            child: FlatButton(
                              color: CustomColors
                                  .Orange,
                              onPressed: () {
                                model
                                    .applyFilters();

                                Navigator.pop(
                                    context);
                              },
                              padding:
                                  EdgeInsets.all(
                                      15),
                              child: Text(
                                'APPLY',
                                style: CustomStyles
                                    .button_style,
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius
                                          .circular(
                                              15.0),
                                  side: BorderSide(
                                      color:
                                          CustomColors
                                              .Orange,
                                      width: 2)),
                            ))
                      ],
                    ),
                  ),
                  SizedBox(height: 10)
                ],
              ),
            ),
          );
        }));
  }
}
