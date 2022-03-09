import 'package:flutter/material.dart';

class GstDetails extends StatefulWidget {
  const GstDetails({Key key}) : super(key: key);

  @override
  State<GstDetails> createState() => _GstDetailsState();
}

class _GstDetailsState extends State<GstDetails> {
  final GlobalKey<FormState> _gstKey = GlobalKey<FormState>();

  final _gstController = TextEditingController();
  final _cgstController = TextEditingController();
  final _sgstController = TextEditingController();

  final _gstFocusNode = FocusNode();
  final _cgstFocusNode = FocusNode();
  final _sgstFocusNode = FocusNode();

  @override
  void dispose() {
    _gstFocusNode.dispose();
    _cgstFocusNode.dispose();
    _sgstFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("GST Details"),),
      drawer: const ListTile(title: Text('HomePage'),),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Form(
            key: _gstKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const ListTile(
                  title: Text(
                    'Enter appropriate GST details',
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                ),
                ListTile(
                  title: TextFormField(
                    autofocus: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "GSTIN NO.",
                    ),
                    controller: _gstController,
                    focusNode: _gstFocusNode,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'GSTIN NO. is Required';
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ListTile(
                  title: TextFormField(
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: "CGST%"),
                    controller: _cgstController,
                    focusNode: _cgstFocusNode,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'CGST is Required';
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ListTile(
                  title: TextFormField(
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: "SGST%"),
                    controller: _sgstController,
                    focusNode: _sgstFocusNode,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.done,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'SGST is Required';
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      OutlinedButton(
                        onPressed: () {},
                        child: const Text('Skip'),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Row(
                          children: [
                            const Text(
                              'Next',
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w500,
                                fontSize: 40,
                              ),
                            ),
                            Card(
                              elevation: 4,
                              color: Colors.redAccent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40),
                              ),
                              child: const SizedBox(
                                width: 70,
                                height: 70,
                                child: Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

