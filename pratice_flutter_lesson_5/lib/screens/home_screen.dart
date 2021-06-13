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
                              diemToan: double.parse(_diemToanController.text),
                              diemVan: double.parse(_diemVanController.text),
                              diemAnh: double.parse(_diemAnhController.text),
                            ).runtimeType ==
                            double
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
                        : alertValidateInput(),
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
    if ((diemTrungBinh > 0) && (diemTrungBinh < 10)) {
      return diemTrungBinh;
    }
  }

  Widget alertValidateInput() {
    return AlertDialog(
      title: const Text("NHẬP LỖI !!!"),
      content: const Text('Vui lòng kiểm ra và nhậ lại số điểm !'),
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
