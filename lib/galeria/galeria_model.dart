import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class GaleriaModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for fecha widget.
  DateTimeRange? fechaSelectedDay;
  DateTime? datePicked;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    fechaSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
  }

  void dispose() {}

  /// Additional helper methods are added here.

}
