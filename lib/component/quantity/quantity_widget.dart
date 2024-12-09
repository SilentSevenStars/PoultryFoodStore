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
import 'quantity_model.dart';
export 'quantity_model.dart';

class QuantityWidget extends StatefulWidget {
  const QuantityWidget({
    super.key,
    required this.product,
    required this.order,
  });

  final DocumentReference? product;
  final DocumentReference? order;

  @override
  State<QuantityWidget> createState() => _QuantityWidgetState();
}

class _QuantityWidgetState extends State<QuantityWidget> {
  late QuantityModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuantityModel());

    _model.textController ??=
        TextEditingController(text: FFAppState().quantityValue.toString());
    _model.textFieldFocusNode ??= FocusNode();

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
            padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FlutterFlowIconButton(
                      borderRadius: 30.0,
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
                              _model.textController?.text =
                                  FFAppState().quantityValue.toString();
                              _model.textFieldFocusNode?.requestFocus();
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                _model.textController?.selection =
                                    TextSelection.collapsed(
                                  offset: _model.textController!.text.length,
                                );
                              });
                            });
                          } else {
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: const Text('oops'),
                                  content:
                                      const Text('No quantity of items can be place'),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(alertDialogContext),
                                      child: const Text('Ok'),
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        },
                      ),
                      Expanded(
                        child: SizedBox(
                          width: 200.0,
                          child: TextFormField(
                            controller: _model.textController,
                            focusNode: _model.textFieldFocusNode,
                            onFieldSubmitted: (_) async {
                              _model.quantityCheck =
                                  await actions.quantityCheck(
                                int.parse(_model.textController.text),
                              );
                              if ((containerProductRecord.stock >
                                      _model.quantityCheck!) &&
                                  (_model.quantityCheck! > 1)) {
                                FFAppState().quantityValue =
                                    int.parse(_model.textController.text);
                                safeSetState(() {});
                                safeSetState(() {
                                  _model.textController?.text =
                                      FFAppState().quantityValue.toString();
                                  _model.textFieldFocusNode?.requestFocus();
                                  WidgetsBinding.instance
                                      .addPostFrameCallback((_) {
                                    _model.textController?.selection =
                                        TextSelection.collapsed(
                                      offset:
                                          _model.textController!.text.length,
                                    );
                                  });
                                });
                              } else {
                                if (containerProductRecord.stock <
                                    _model.quantityCheck!) {
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: const Text('Oops'),
                                        content: const Text(
                                            'This quantity are more than stock have'),
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
                                  FFAppState().quantityValue =
                                      containerProductRecord.stock;
                                  safeSetState(() {});
                                  safeSetState(() {
                                    _model.textController?.text =
                                        FFAppState().quantityValue.toString();
                                    _model.textFieldFocusNode?.requestFocus();
                                    WidgetsBinding.instance
                                        .addPostFrameCallback((_) {
                                      _model.textController?.selection =
                                          TextSelection.collapsed(
                                        offset:
                                            _model.textController!.text.length,
                                      );
                                    });
                                  });
                                } else {
                                  if (_model.quantityCheck! < 1) {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title: const Text('Oops'),
                                          content: const Text(
                                              'This item needs number of items to be added'),
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
                                    FFAppState().quantityValue = 1;
                                    safeSetState(() {});
                                    safeSetState(() {
                                      _model.textController?.text =
                                          FFAppState().quantityValue.toString();
                                      _model.textFieldFocusNode?.requestFocus();
                                      WidgetsBinding.instance
                                          .addPostFrameCallback((_) {
                                        _model.textController?.selection =
                                            TextSelection.collapsed(
                                          offset: _model
                                              .textController!.text.length,
                                        );
                                      });
                                    });
                                  }
                                }
                              }

                              safeSetState(() {});
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
                              hintText: 'TextField',
                              hintStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0x00000000),
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
                            cursorColor:
                                FlutterFlowTheme.of(context).primaryText,
                            validator: _model.textControllerValidator
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
                        onPressed: () async {
                          if (containerProductRecord.stock >
                              FFAppState().quantityValue) {
                            FFAppState().quantityValue =
                                FFAppState().quantityValue + 1;
                            safeSetState(() {});
                            safeSetState(() {
                              _model.textController?.text =
                                  FFAppState().quantityValue.toString();
                              _model.textFieldFocusNode?.requestFocus();
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                _model.textController?.selection =
                                    TextSelection.collapsed(
                                  offset: _model.textController!.text.length,
                                );
                              });
                            });
                          } else {
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: const Text('oops'),
                                  content: const Text('Not enough stock'),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(alertDialogContext),
                                      child: const Text('Ok'),
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FFButtonWidget(
                      onPressed: () async {
                        await actions.updateItemList(
                          widget.product!,
                          int.parse(_model.textController.text),
                          functions.subTotal(containerProductRecord.price,
                              int.parse(_model.textController.text)),
                          widget.order!,
                        );
                        FFAppState().quantityValue = 1;
                        safeSetState(() {});

                        context.pushNamed(
                          'cartPage',
                          queryParameters: {
                            'order': serializeParam(
                              widget.order,
                              ParamType.DocumentReference,
                            ),
                          }.withoutNulls,
                        );
                      },
                      text: 'Add',
                      options: FFButtonOptions(
                        height: 40.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
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
              ],
            ),
          ),
        );
      },
    );
  }
}
