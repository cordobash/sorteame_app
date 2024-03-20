// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Sorteo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SorteoAdapter extends TypeAdapter<Sorteo> {
  @override
  final int typeId = 1;

  @override
  Sorteo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Sorteo()
      .._tituloSorteo = fields[0] as String?
      .._ganadorSorteo = fields[1] as String?
      .._cantidadParticipantes = fields[2] as int?;
  }

  @override
  void write(BinaryWriter writer, Sorteo obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj._tituloSorteo)
      ..writeByte(1)
      ..write(obj._ganadorSorteo)
      ..writeByte(2)
      ..write(obj._cantidadParticipantes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SorteoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
