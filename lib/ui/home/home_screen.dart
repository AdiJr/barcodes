import 'package:barcode_widget/barcode_widget.dart';
import 'package:barcodes/bloc/barcode_cubit/barcode_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static String route = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final TextEditingController controller;
  String code = '';

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton(
              onPressed: () =>
                  BlocProvider.of<BarcodeCubit>(context).beginBarcodeScan(),
              child: Text('Scan Barcode'),
            ),
            const SizedBox(height: 20),
            BlocBuilder<BarcodeCubit, BarcodeState>(
              builder: (context, state) {
                if (state is BarcodeScanSuccess) {
                  return Text(
                    state.code,
                    style: TextStyle(fontSize: 23, color: Colors.white),
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
            OutlinedButton(
              onPressed: () {
                if (code.isNotEmpty) {
                  setState(() {
                    code = '';
                    controller.clear();
                  });
                } else {
                  showDialog<void>(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: TextFormField(
                          controller: controller,
                          decoration: InputDecoration(hintText: 'Enter code'),
                        ),
                        actions: [
                          OutlinedButton(
                            onPressed: () {
                              setState(() {
                                code = controller.text;
                              });
                              Navigator.pop(context);
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: Text(
                code.isNotEmpty ? 'Clear Barcode' : 'Generate Barcode',
              ),
            ),
            const SizedBox(height: 20),
            if (code.isNotEmpty)
              SizedBox(
                width: 300,
                child: BarcodeWidget(
                  barcode: Barcode.code128(),
                  data: code,
                ),
              ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
