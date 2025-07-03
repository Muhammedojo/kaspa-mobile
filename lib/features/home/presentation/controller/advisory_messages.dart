import 'package:flutter/material.dart';
import '../../../../core/data/model/advisory.dart';
import '../contract/advisory_messages.dart';
import '../view/advisory_messages.dart';
import '../widget/advisory_message_preview.dart';


class AdvisoryMessageScreen extends StatefulWidget {
  const AdvisoryMessageScreen({super.key});

  @override
  State<AdvisoryMessageScreen> createState() => _AdvisoryMessageScreenState();
}

class _AdvisoryMessageScreenState extends State<AdvisoryMessageScreen>
    implements AdvisoryMessageControllerContract {
  late final AdvisoryMessageViewContract view;

  

  @override
  void initState() {

    super.initState();
    view = AdvisoryMessageView(controller: this);
  }

  @override
  void dispose() {
    super.dispose();
  }

    @override
    previewLogModal(Advisory data) {
    showModalBottomSheet(
        context:context,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return AdvisoryMessagePreviewWidget(
            data: data,
          );
        });
  }


  @override
  Widget build(BuildContext context) {
    return view.build(context);
  }
}

