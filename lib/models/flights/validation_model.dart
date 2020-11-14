import 'package:flutter/material.dart';
import 'package:ota/models/profile/responses/family_list.dart';

class ValidationModel
{
  int index ;
  int passangerType;
  bool isFilled ;
  bool isPrimaryFilled =false;
  bool isFamilyMemberSelected =false;
  RelationResult userInfo;
  TextEditingController firstName =  TextEditingController();
  TextEditingController lastName =  TextEditingController();
  TextEditingController nationality =  TextEditingController();
  TextEditingController dob =  TextEditingController();
  TextEditingController passportNumber =  TextEditingController();
  TextEditingController passportExpiry =  TextEditingController();

  TextEditingController firstNameChild =  TextEditingController();
  TextEditingController lastNameChild =  TextEditingController();
  TextEditingController nationalityChild =  TextEditingController();
  TextEditingController dobChild =  TextEditingController();
  TextEditingController passportNumberChild =  TextEditingController();
  TextEditingController passportExpiryChild =  TextEditingController();

  TextEditingController firstNameInfant =  TextEditingController();
  TextEditingController lastNameInfant =  TextEditingController();
  TextEditingController nationalityInfant =  TextEditingController();
  TextEditingController dobInfant =  TextEditingController();
  TextEditingController passportNumberInfant =  TextEditingController();
  TextEditingController passportExpiryInfant =  TextEditingController();

  ValidationModel(
  this.index,
      this.passangerType,
      this.isFilled,
      );

  ValidationModel.primary(
      this.index,
      this.passangerType,
      this.isFilled,
      this.isPrimaryFilled
      );
}