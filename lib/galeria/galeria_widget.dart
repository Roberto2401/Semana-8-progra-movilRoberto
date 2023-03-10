import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'galeria_model.dart';
export 'galeria_model.dart';

class GaleriaWidget extends StatefulWidget {
  const GaleriaWidget({Key? key}) : super(key: key);

  @override
  _GaleriaWidgetState createState() => _GaleriaWidgetState();
}

class _GaleriaWidgetState extends State<GaleriaWidget> {
  late GaleriaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GaleriaModel());
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        title: InkWell(
          onTap: () async {
            context.safePop();
          },
          child: Text(
            'Galeria de imagenes NASA',
            style: FlutterFlowTheme.of(context).title2.override(
                  fontFamily: 'Poppins',
                  color: Colors.white,
                  fontSize: 22.0,
                ),
          ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2.0,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: MasonryGridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                  itemCount: 0,
                  itemBuilder: (context, index) {
                    return [][index]();
                  },
                ),
              ),
              FlutterFlowCalendar(
                color: FlutterFlowTheme.of(context).primaryColor,
                weekFormat: false,
                weekStartsMonday: false,
                onChange: (DateTimeRange? newSelectedDate) async {
                  _model.fechaSelectedDay = newSelectedDate;
                  final _datePickedDate = await showDatePicker(
                    context: context,
                    initialDate: getCurrentTimestamp,
                    firstDate: getCurrentTimestamp,
                    lastDate: DateTime(2050),
                  );

                  if (_datePickedDate != null) {
                    setState(() {
                      _model.datePicked = DateTime(
                        _datePickedDate.year,
                        _datePickedDate.month,
                        _datePickedDate.day,
                      );
                    });
                  }
                  setState(() {});
                },
                titleStyle: TextStyle(),
                dayOfWeekStyle: TextStyle(),
                dateStyle: TextStyle(),
                selectedDateStyle: TextStyle(),
                inactiveDateStyle: TextStyle(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
