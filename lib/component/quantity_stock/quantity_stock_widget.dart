import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'quantity_stock_model.dart';
export 'quantity_stock_model.dart';

class QuantityStockWidget extends StatefulWidget {
  const QuantityStockWidget({
    super.key,
    this.product,
    required this.addStock,
  });

  final DocumentReference? product;
  final DocumentReference? addStock;

  @override
  State<QuantityStockWidget> createState() => _QuantityStockWidgetState();
}

class _QuantityStockWidgetState extends State<QuantityStockWidget> {
  late QuantityStockModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuantityStockModel());

    _model.quantityTxtTextController ??=
        TextEditingController(text: FFAppState().quantityValue.toString());
    _model.quantityTxtFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<ProductRecord>(
      stream: ProductRecord.getDocument(widget.product!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50.0,
              height: 50.0,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  FlutterFlowTheme.of(context).primary,
                ),
              ),
            ),
          );
        }

        final containerProductRecord = snapshot.data!;

        return Container(
          width: double.infinity,
          height: 200.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
          ),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FlutterFlowIconButton(
                      borderRadius: 8.0,
                      buttonSize: 40.0,
                      fillColor: FlutterFlowTheme.of(context).primary,
                      icon: Icon(
                        Icons.clear,
                        color: FlutterFlowTheme.of(context).info,
                        size: 24.0,
                      ),
                      onPressed: () async {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      containerProductRecord.productName,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Inter',
                            letterSpacing: 0.0,
                          ),
                    ),
                    Text(
                      'Stock: ${containerProductRecord.stock.toString()}',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Inter',
                            letterSpacing: 0.0,
                          ),
                    ),
                  ],
                ),
                Container(
                  width: 200.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FlutterFlowIconButton(
                        borderRadius: 8.0,
                        buttonSize: 40.0,
                        fillColor: FlutterFlowTheme.of(context).primary,
                        icon: FaIcon(
                          FontAwesomeIcons.minus,
                          color: FlutterFlowTheme.of(context).info,
                          size: 24.0,
                        ),
                        onPressed: () async {
                          if (FFAppState().quantityValue > 1) {
                            FFAppState().quantityValue =
                                FFAppState().quantityValue + -1;
                            safeSetState(() {});
                            safeSetState(() {
                              _model.quantityTxtTextController?.text =
                                  FFAppState().quantityValue.toString();
                            });
                          }
                        },
                      ),
                      Expanded(
                        child: SizedBox(
                          width: double.infinity,
                          child: TextFormField(
                            controller: _model.quantityTxtTextController,
                            focusNode: _model.quantityTxtFocusNode,
                            onFieldSubmitted: (_) async {
                              if ((containerProductRecord.stock >
                                      functions.convertToInt(_model
                                          .quantityTxtTextController.text)) &&
                                  (functions.convertToInt(_model
                                          .quantityTxtTextController.text) >
                                      1)) {
                                FFAppState().quantityValue = int.parse(
                                    _model.quantityTxtTextController.text);
                                safeSetState(() {});
                                safeSetState(() {
                                  _model.quantityTxtTextController?.text =
                                      FFAppState().quantityValue.toString();
                                });
                              } else {
                                if (functions.convertToInt(
                                        _model.quantityTxtTextController.text) >
                                    containerProductRecord.stock) {
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: const Text('Out of Stock'),
                                        content: const Text('This is the maximum'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: const Text('Ok'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                } else {
                                  if (functions.convertToInt(_model
                                          .quantityTxtTextController.text) <
                                      1) {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title: const Text('Less than'),
                                          content: const Text(
                                              'You cannot have a quantity less than 1'),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
                                              child: const Text('Ok'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  }
                                }
                              }
                            },
                            autofocus: false,
                            obscureText: false,
                            decoration: InputDecoration(
                              isDense: true,
                              labelStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                              hintText: 'Quantity',
                              hintStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                ),
                            keyboardType: TextInputType.number,
                            cursorColor:
                                FlutterFlowTheme.of(context).primaryText,
                            validator: _model.quantityTxtTextControllerValidator
                                .asValidator(context),
                          ),
                        ),
                      ),
                      FlutterFlowIconButton(
                        borderRadius: 8.0,
                        buttonSize: 40.0,
                        fillColor: FlutterFlowTheme.of(context).primary,
                        icon: Icon(
                          Icons.add,
                          color: FlutterFlowTheme.of(context).info,
                          size: 24.0,
                        ),
                        onPressed: (containerProductRecord.stock <=
                                FFAppState().quantityValue)
                            ? null
                            : () async {
                                if (containerProductRecord.stock >
                                    FFAppState().quantityValue) {
                                  FFAppState().quantityValue =
                                      FFAppState().quantityValue + 1;
                                  safeSetState(() {});
                                  safeSetState(() {
                                    _model.quantityTxtTextController?.text =
                                        FFAppState().quantityValue.toString();
                                  });
                                }
                              },
                      ),
                    ],
                  ),
                ),
                FFButtonWidget(
                  onPressed: () async {
                    await actions.updateStockItemList(
                      widget.addStock!,
                      widget.product!,
                      int.parse(_model.quantityTxtTextController.text),
                      functions.subTotalCost(containerProductRecord.cost,
                          int.parse(_model.quantityTxtTextController.text)),
                    );
                    FFAppState().quantityValue = 1;
                    safeSetState(() {});

                    context.pushNamed(
                      'AddStockCart',
                      queryParameters: {
                        'addStock': serializeParam(
                          widget.addStock,
                          ParamType.DocumentReference,
                        ),
                      }.withoutNulls,
                    );
                  },
                  text: 'Add',
                  options: FFButtonOptions(
                    height: 40.0,
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    iconPadding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Inter',
                          color: Colors.white,
                          letterSpacing: 0.0,
                        ),
                    elevation: 0.0,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
