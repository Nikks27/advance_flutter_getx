import 'package:flutter/material.dart';


class EmpModel
{
  late int empId;
  late String name,workTitle;

  EmpModel(this.empId, this.name, this.workTitle);

  factory EmpModel.fromMap(Map m1)
  {
    return EmpModel(m1['empId'], m1['name'], m1['workTitle']);
  }
}