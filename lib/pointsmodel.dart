import 'package:hive/hive.dart';

part 'pointsmodel.g.dart';
@HiveType(typeId: 0)
class pointsmodel extends HiveObject{
  pointsmodel({required this.p1,required this.p2,required this.p3,required this.p4,required this.p5,required this.p6,
    //required this.d1,required this.d2,required this.d3,required this.d4,required this.d5,required this.d6,
  });
  @HiveField(0)
  double p1=0;
  @HiveField(1)
  double p2=0;
  @HiveField(2)
   double p3=0;
  @HiveField(3)
   double p4=0;
  @HiveField(4)
   double p5=0;
  @HiveField(5)
   double p6=0;
  /*@HiveField(6)
  double d1=0;
  @HiveField(7)
  double d2=0;
  @HiveField(8)
  double d3=0;
  @HiveField(9)
  double d4=0;
  @HiveField(10)
  double d5=0;
  @HiveField(11)
  double d6=0;*/
}
