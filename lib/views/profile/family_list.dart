import 'package:flutter/material.dart';
import 'package:ota/app/Router.dart';
import 'package:ota/customviews/shimmer_container.dart';
import 'package:ota/models/profile/responses/family_list.dart';
import 'package:ota/utils/colors.dart';
import 'package:ota/utils/dialog.dart';
import 'package:ota/utils/styles.dart';
import 'package:ota/viewmodels/profile/family_list_viewmodel.dart';
import 'package:provider/provider.dart';

class FamilyList extends StatefulWidget {
  @override
  _FamilyListState createState() =>
      _FamilyListState();
}

class _FamilyListState extends State<FamilyList> {
  var height;

  var width;

  final GlobalKey<State> _keyLoader =
      new GlobalKey<State>();

  @override
  Widget build(BuildContext context) {
    height =
        MediaQuery.of(context).size.height / 10;

    width =
        MediaQuery.of(context).size.width / 10;

    return ChangeNotifierProvider<
        FamilyMembersViewModel>(
      create: (context) =>
          FamilyMembersViewModel(),
      child: Consumer<FamilyMembersViewModel>(
        builder: (context, model, child) {
          return Scaffold(
            backgroundColor: CustomColors.White,
            appBar: AppBar(
              title: Text(
                'Family Members',
                style: CustomStyles.appbar,
              ),
              leading: new IconButton(
                icon: new Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                  size: 13,
                ),
                onPressed: () =>
                    Navigator.of(context).pop(),
              ),
              actions: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.add_circle_outline,
                    color: CustomColors.White,
                    size: 20,
                  ),
                  // Icon(Icons.clear, color: Colors.white,size: 20,),
                  onPressed: () {
                    RelationResult relation;
                    _navigateToAddScreen(
                        context, model, relation);
                  },
                ),
              ],
              elevation: 0.0,
              backgroundColor:
                  CustomColors.BackGround,
            ),
            body: Container(
              margin: EdgeInsets.all(15),
              height: MediaQuery.of(context)
                  .size
                  .height,
              child: model.loading
                  ? ShimmerContainer(
                      MediaQuery.of(context)
                          .size
                          .height)
                  : model.relationsList.isError
                      ? Center(
                          child: Column(
                            mainAxisAlignment:
                                MainAxisAlignment
                                    .center,
                            crossAxisAlignment:
                                CrossAxisAlignment
                                    .center,
                            children: <Widget>[
//                              Container(
//                                margin: EdgeInsets
//                                    .only(
//                                        top: 40),
//                                child:
//                                    Image.asset(
//                                  'assets/images/flights.png',
//                                  height: 150,
//                                ),
//                              ),
                              Padding(
                                padding: EdgeInsets
                                    .only(
                                        top: 40),
                                child: Text(
                                    'Something Went Wrong',
                                    textAlign:
                                        TextAlign
                                            .center,
                                    style: CustomStyles
                                        .medium20
                                        .copyWith(
                                            color:
                                                CustomColors.disabledButton)),
                              ),
                            ],
                          ),
                        )
                      : model.relationsList.result
                              .isEmpty
                          ? Center(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment
                                        .center,
                                crossAxisAlignment:
                                    CrossAxisAlignment
                                        .center,
                                children: <
                                    Widget>[
//                                  Container(
//                                    margin: EdgeInsets
//                                        .only(
//                                            top:
//                                                40),
//                                    child: Image
//                                        .asset(
//                                      'assets/images/flights.png',
//                                      height: 150,
//                                    ),
//                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets
                                            .all(
                                                7.0),
                                    child: Text(
                                        'Family Members Not Added',
                                        textAlign:
                                            TextAlign
                                                .center,
                                        style: CustomStyles
                                            .medium20
                                            .copyWith(
                                                color: CustomColors.Orange)),
                                  ),
                                ],
                              ),
                            )
                          : ListView.builder(
                              //physics: NeverScrollableScrollPhysics(),

                              primary: false,
                              shrinkWrap: true,
                              padding: EdgeInsets.only(
                                  bottom: MediaQuery.of(
                                              context)
                                          .size
                                          .height *
                                      .12),
                              itemCount: model
                                  .relationsList
                                  .result
                                  .length, // records.length
                              itemBuilder:
                                  (BuildContext
                                          context,
                                      int index) {
                                return GestureDetector(
                                  child: Card(
                                      clipBehavior: Clip
                                          .antiAliasWithSaveLayer,
                                      elevation:
                                          5,
                                      margin:
                                          EdgeInsets
                                              .only(
                                        top: 10,
                                      ),
                                      shape:
                                          RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(
                                                15.0),
                                      ),
                                      child:
                                          Container(
                                        padding:
                                            EdgeInsets.all(
                                                15),
                                        child:
                                            Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <
                                              Widget>[
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Flexible(
                                                  fit: FlexFit.tight,
                                                  child: Text(
                                                    "Name",
                                                    style: CustomStyles.normal14.copyWith(color: CustomColors.BackGround.withOpacity(.7)),
                                                  ),
                                                ),
                                                Flexible(
                                                  fit: FlexFit.tight,
                                                  child: Text(
                                                    model.relationsList.result[index].firstName,
                                                    textAlign: TextAlign.start,
                                                    style: CustomStyles.medium14.copyWith(color: CustomColors.BackGround),
                                                  ),
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height:
                                                  15,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Flexible(
                                                  fit: FlexFit.tight,
                                                  child: Text(
                                                    "Passport",
                                                    style: CustomStyles.normal14.copyWith(color: CustomColors.BackGround.withOpacity(.7)),
                                                  ),
                                                ),
                                                Flexible(
                                                  fit: FlexFit.tight,
                                                  child: Text(
                                                    model.relationsList.result[index].passportNumber,
                                                    textAlign: TextAlign.start,
                                                    style: CustomStyles.medium14.copyWith(color: CustomColors.BackGround),
                                                  ),
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height:
                                                  15,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Flexible(
                                                  fit: FlexFit.tight,
                                                  child: Text(
                                                    "Phone Number",
                                                    style: CustomStyles.normal14.copyWith(color: CustomColors.BackGround.withOpacity(.7)),
                                                  ),
                                                ),
                                                Flexible(
                                                  fit: FlexFit.tight,
                                                  child: Text(
                                                    model.relationsList.result[index].phoneNumber,
                                                    textAlign: TextAlign.start,
                                                    style: CustomStyles.medium14.copyWith(color: CustomColors.BackGround),
                                                  ),
                                                )
                                              ],
                                            ),
                                            Visibility(
                                                visible: model.visible[index],
                                                child: Column(
                                                  children: [
                                                    SizedBox(
                                                      height: 15,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      children: [
                                                        Flexible(
                                                          fit: FlexFit.tight,
                                                          child: Text(
                                                            "Passport Expiry",
                                                            style: CustomStyles.normal14.copyWith(color: CustomColors.BackGround.withOpacity(.7)),
                                                          ),
                                                        ),
                                                        Flexible(
                                                          fit: FlexFit.tight,
                                                          child: Text(
                                                            model.relationsList.result[index].passportExpiry,
                                                            textAlign: TextAlign.start,
                                                            style: CustomStyles.medium14.copyWith(color: CustomColors.BackGround),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 15,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      children: [
                                                        Flexible(
                                                          fit: FlexFit.tight,
                                                          child: Text(
                                                            "Date od Birth",
                                                            style: CustomStyles.normal14.copyWith(color: CustomColors.BackGround.withOpacity(.7)),
                                                          ),
                                                        ),
                                                        Flexible(
                                                          fit: FlexFit.tight,
                                                          child: Text(
                                                            model.relationsList.result[index].dob,
                                                            textAlign: TextAlign.start,
                                                            style: CustomStyles.medium14.copyWith(color: CustomColors.BackGround),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 15,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      children: [
                                                        Flexible(
                                                          fit: FlexFit.tight,
                                                          child: Text(
                                                            "Email Id",
                                                            style: CustomStyles.normal14.copyWith(color: CustomColors.BackGround.withOpacity(.7)),
                                                          ),
                                                        ),
                                                        Flexible(
                                                          fit: FlexFit.tight,
                                                          child: Text(
                                                            model.relationsList.result[index].email,
                                                            textAlign: TextAlign.start,
                                                            style: CustomStyles.medium14.copyWith(color: CustomColors.BackGround),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 15,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      children: [
                                                        Flexible(
                                                          fit: FlexFit.tight,
                                                          child: Text(
                                                            "Country Code",
                                                            style: CustomStyles.normal14.copyWith(color: CustomColors.BackGround.withOpacity(.7)),
                                                          ),
                                                        ),
                                                        Flexible(
                                                          fit: FlexFit.tight,
                                                          child: Text(
                                                            model.relationsList.result[index].countryCode,
                                                            textAlign: TextAlign.start,
                                                            style: CustomStyles.medium14.copyWith(color: CustomColors.BackGround),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 15,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      children: [
                                                        Flexible(
                                                          fit: FlexFit.tight,
                                                          child: Text(
                                                            "Phone Code",
                                                            style: CustomStyles.normal14.copyWith(color: CustomColors.BackGround.withOpacity(.7)),
                                                          ),
                                                        ),
                                                        Flexible(
                                                          fit: FlexFit.tight,
                                                          child: Text(
                                                            model.relationsList.result[index].phoneCountryCode.toString(),
                                                            textAlign: TextAlign.start,
                                                            style: CustomStyles.medium14.copyWith(color: CustomColors.BackGround),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 15,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      children: [
                                                        Flexible(
                                                          fit: FlexFit.tight,
                                                          child: Text(
                                                            "Country Code",
                                                            style: CustomStyles.normal14.copyWith(color: CustomColors.BackGround.withOpacity(.7)),
                                                          ),
                                                        ),
                                                        Flexible(
                                                          fit: FlexFit.tight,
                                                          child: Text(
                                                            model.relationsList.result[index].countryCode,
                                                            textAlign: TextAlign.start,
                                                            style: CustomStyles.medium14.copyWith(color: CustomColors.BackGround),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 15,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      children: [
                                                        Flexible(
                                                          fit: FlexFit.tight,
                                                          child: Text(
                                                            "Nationality ",
                                                            style: CustomStyles.normal14.copyWith(color: CustomColors.BackGround.withOpacity(.7)),
                                                          ),
                                                        ),
                                                        Flexible(
                                                          fit: FlexFit.tight,
                                                          child: Text(
                                                            model.relationsList.result[index].nationality,
                                                            textAlign: TextAlign.start,
                                                            style: CustomStyles.medium14.copyWith(color: CustomColors.BackGround),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 15,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      children: [
                                                        Flexible(
                                                          fit: FlexFit.tight,
                                                          child: Text(
                                                            "Gender ",
                                                            style: CustomStyles.normal14.copyWith(color: CustomColors.BackGround.withOpacity(.7)),
                                                          ),
                                                        ),
                                                        Flexible(
                                                          fit: FlexFit.tight,
                                                          child: Text(
                                                            model.relationsList.result[index].gender == 0 ? "Male" : "Female",
                                                            textAlign: TextAlign.start,
                                                            style: CustomStyles.medium14.copyWith(color: CustomColors.BackGround),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 15,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      children: [
                                                        Flexible(
                                                          fit: FlexFit.tight,
                                                          child: Text(
                                                            "Relation ",
                                                            style: CustomStyles.normal14.copyWith(color: CustomColors.BackGround.withOpacity(.7)),
                                                          ),
                                                        ),
                                                        Flexible(
                                                          fit: FlexFit.tight,
                                                          child: Text(
                                                            model.relationsList.result[index].relation,
                                                            textAlign: TextAlign.start,
                                                            style: CustomStyles.medium14.copyWith(color: CustomColors.BackGround),
                                                          ),
                                                        )
                                                      ],
                                                    )
                                                  ],
                                                )),
                                            SizedBox(
                                              height:
                                                  15,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    model.showDetails(index);
                                                  },
                                                  child: Row(
                                                    children: [
                                                      Icon(
                                                        !model.visible[index] ? Icons.visibility : Icons.visibility_off,
                                                        color: CustomColors.disabledButton,
                                                      ),
                                                      SizedBox(
                                                        width: 4,
                                                      ),
                                                      Text(
                                                        !model.visible[index] ? "View More" : "View Less",
                                                        style: CustomStyles.medium14.copyWith(color: CustomColors.disabledButton),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: (){
                                                    _navigateToAddScreen(context, model, model.relationsList.result[index]);
                                                  },
                                                  child: Row(
                                                    children: [
                                                      Icon(
                                                        Icons.edit,
                                                        color: CustomColors.disabledButton,
                                                      ),
                                                      SizedBox(
                                                        width: 4,
                                                      ),
                                                      Text(
                                                        "Edit",
                                                        style: CustomStyles.medium14.copyWith(color: CustomColors.disabledButton),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    showRemoveDialog(index, model);
                                                  },
                                                  child: Row(
                                                    children: [
                                                      Icon(
                                                        Icons.delete,
                                                        color: CustomColors.disabledButton,
                                                      ),
                                                      SizedBox(
                                                        width: 4,
                                                      ),
                                                      Text(
                                                        "Remove",
                                                        style: CustomStyles.medium14.copyWith(color: CustomColors.disabledButton),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      )),
                                  onTap:
                                      () async {
                                    ;
                                  },
                                );
                              }),
            ),
          );
        },
      ),
    );
  }

  Future<void> _navigateToAddScreen(
      BuildContext context,
      FamilyMembersViewModel model,
      RelationResult relation) async {
    final result = await Navigator.pushNamed(
        context, Routes.add_family_members,
        arguments: relation);

    print(result);

    if (result == "done") {
      model.getFamilyMembersList();
    }
  }

  void showRemoveDialog(
      int index, FamilyMembersViewModel model) {
    Dialog simpleDialog = Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Container(
          padding: EdgeInsets.all(5),
          height: 100.0,
          width: 300.0,
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.start,
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.all(8.0),
                child: Text(
                  "Remove member ?",
                  style: CustomStyles.medium16,
                  textAlign: TextAlign.start,
                ),
              ),
//          SizedBox(height: 10,),
//
//          Text("Remove member ?",style: CustomStyles.medium16,textAlign: TextAlign.start,),

              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.end,
                crossAxisAlignment:
                    CrossAxisAlignment.center,
                children: [
                  FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'No',
                      style: CustomStyles.medium14
                          .copyWith(
                              color: CustomColors
                                  .BackGround),
                    ),
//              shape: RoundedRectangleBorder(
//              borderRadius: BorderRadius.circular(15.0),side: BorderSide(color: CustomColors.disabledButton,width: 2))
                  ),
                  FlatButton(
                    child: Text(
                      'Yes',
                      style: CustomStyles.medium14
                          .copyWith(
                              color: CustomColors
                                  .BackGround),
                    ),
//                shape: RoundedRectangleBorder(
//                borderRadius: BorderRadius.circular(15.0),
//                side: BorderSide(color: CustomColors.disabledButton,width: 2)
//                ),
                    onPressed: () {
                      Navigator.pop(context);
                      Dialogs.showLoadingDialog(
                          context, _keyLoader);

                      model
                          .removeMember(index)
                          .then((value) {
                        Navigator.of(
                                _keyLoader
                                    .currentContext,
                                rootNavigator:
                                    true)
                            .pop();
                        if (value.isError) {
                          showFailedDialog(
                              context);
                        } else {
                          model
                              .getFamilyMembersList();
                        }
                      });
                    },
                  ),
                ],
              )
            ],
          )),
    );
    showDialog(
        context: context,
        builder: (BuildContext context) =>
            simpleDialog);
  }

  void showFailedDialog(BuildContext context) {
    Dialog simpleDialog = Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Container(
          padding: EdgeInsets.all(5),
          height: 370.0,
          width: 300.0,
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center,
            crossAxisAlignment:
                CrossAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                height: 310.0,
                width: 300.0,
                child: Text(
                    "Failed To Remove Member"),
              ),
              SizedBox(
                height: 20,
              ),
              FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('OK'),
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(
                              15.0),
                      side: BorderSide(
                          color: CustomColors
                              .disabledButton,
                          width: 2)))
            ],
          )),
    );
    showDialog(
        context: context,
        builder: (BuildContext context) =>
            simpleDialog);
  }
}
