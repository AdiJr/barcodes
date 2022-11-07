import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:meta/meta.dart';

part 'barcode_state.dart';

class BarcodeCubit extends Cubit<BarcodeState> {
  BarcodeCubit() : super(BarcodeInitial());

  Future<void> beginBarcodeScan() async {
    final String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
      '#FF0000',
      'Cancel',
      false,
      ScanMode.BARCODE,
    );

    emit(BarcodeScanSuccess(barcodeScanRes));
  }
}
