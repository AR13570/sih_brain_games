// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pointsmodel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class pointsmodelAdapter extends TypeAdapter<pointsmodel> {
  @override
  final int typeId = 0;

  @override
  pointsmodel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return pointsmodel(
      p1: fields[0] as double,
      p2: fields[1] as double,
      p3: fields[2] as double,
      p4: fields[3] as double,
      p5: fields[4] as double,
      p6: fields[5] as double,
    );
  }

  @override
  void write(BinaryWriter writer, pointsmodel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.p1)
      ..writeByte(1)
      ..write(obj.p2)
      ..writeByte(2)
      ..write(obj.p3)
      ..writeByte(3)
      ..write(obj.p4)
      ..writeByte(4)
      ..write(obj.p5)
      ..writeByte(5)
      ..write(obj.p6);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is pointsmodelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
