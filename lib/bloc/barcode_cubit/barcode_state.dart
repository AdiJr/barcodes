part of 'barcode_cubit.dart';

@immutable
abstract class BarcodeState {}

class BarcodeInitial extends BarcodeState {}

class BarcodeScanSuccess extends BarcodeState {
  BarcodeScanSuccess(this.code);

  final String code;
}
