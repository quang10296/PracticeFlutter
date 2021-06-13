import 'package:flutter/material.dart';
import 'package:pratice_flutter_lesson_5/config/config_files.dart';
import 'package:pratice_flutter_lesson_5/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  final _diemToanController = TextEditingController();
  final _diemVanController = TextEditingController();
  final _diemAnhController = TextEditingController();

  //style
  final ButtonStyle style = ElevatedButton.styleFrom(
    elevation: 0.0,
    primary: Colors.transparent.withOpacity(0.0),
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
    textStyle: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Age Calculator Application'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: Palette.createQuangColorGradient,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: DEVICE_HEIGHT / 4),
          height: DEVICE_HEIGHT / 2,
          color: Colors.white,
          child: Center(
            child: Column(
              children: [
                TextFieldWidget(
                  placeholder: "Nhập số điểm Toán",
                  textFieldController: _diemToanController,
                ),
                SizedBox(height: 10),
                TextFieldWidget(
                  placeholder: "Nhập số điểm Văn",
                  textFieldController: _diemVanController,
                ),
                SizedBox(height: 10),
                TextFieldWidget(
                  placeholder: "Nhập số điểm Anh",
                  textFieldController: _diemAnhController,
                ),
                Spacer(),
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    gradient: Palette.createQuangColorGradient,
                  ),
                  child: ElevatedButton(
                    style: style,
                    onPressed: () => tinhDiemTrungBinh(
                              diemToan: _diemToanController.text.length == 0
                                  ? -1.0
                                  : double.parse(_diemToanController.text),
                              diemVan: _diemVanController.text.length == 0
                                  ? -1.0
                                  : double.parse(_diemVanController.text),
                              diemAnh: _diemAnhController.text.length == 0
                                  ? -1.0
                                  : double.parse(_diemAnhController.text),
                            ) !=
                            -1.0
                        ? showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: Text(
                                "Điểm Trung Bình : " +
                                    tinhDiemTrungBinh(
                                      diemToan: double.parse(
                                          _diemToanController.text),
                                      diemVan:
                                          double.parse(_diemVanController.text),
                                      diemAnh:
                                          double.parse(_diemAnhController.text),
                                    ).toString(),
                                textAlign: TextAlign.center,
                              ),
                              content: Text(
                                "Xếp Loại : " +
                                    xepLoaiHocSinh(
                                        diemTrungBinh: tinhDiemTrungBinh(
                                      diemToan: double.parse(
                                          _diemToanController.text),
                                      diemVan:
                                          double.parse(_diemVanController.text),
                                      diemAnh:
                                          double.parse(_diemAnhController.text),
                                    )),
                                textAlign: TextAlign.center,
                              ),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () => Navigator.pop(context, 'OK'),
                                  child: const Text('OK'),
                                ),
                              ],
                            ),
                          )
                        : showAlertValidateInput(context),
                    child: const Text('Check'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  double tinhDiemTrungBinh(
      {@required double diemToan,
      @required double diemVan,
      @required double diemAnh}) {
    double diemTrungBinh = (diemAnh + diemToan + diemVan) / 3;
    print(diemTrungBinh != -1.0);
    return diemTrungBinh;
  }

  showAlertValidateInput(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("Cancel"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = TextButton(
      child: Text("Continue"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(
        " LỖI !!! ",
        textAlign: TextAlign.center,
      ),
      content: Text(
        "Số điểm nhập không đúng định dạng \n Vui lòng nhập đúng định dạng số điểm !",
        textAlign: TextAlign.center,
      ),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  String xepLoaiHocSinh({@required double diemTrungBinh}) {
    String xepLoaiHocSinh = "";
    if (diemTrungBinh <= 5.0) {
      xepLoaiHocSinh = "Trung Bình";
    }
    if ((diemTrungBinh <= 8.0) && (diemTrungBinh > 5.0)) {
      xepLoaiHocSinh = "Khá";
    }
    if (diemTrungBinh > 8.0) {
      xepLoaiHocSinh = "Giỏi";
    }
    return xepLoaiHocSinh;
  }
}
