import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'course_page_university_update_comp_model.dart';
export 'course_page_university_update_comp_model.dart';

class CoursePageUniversityUpdateCompWidget extends StatefulWidget {
  const CoursePageUniversityUpdateCompWidget({super.key});

  @override
  State<CoursePageUniversityUpdateCompWidget> createState() =>
      _CoursePageUniversityUpdateCompWidgetState();
}

class _CoursePageUniversityUpdateCompWidgetState
    extends State<CoursePageUniversityUpdateCompWidget> {
  late CoursePageUniversityUpdateCompModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CoursePageUniversityUpdateCompModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
