
import 'package:auto_route/annotations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo_structure/data/repository/auth_repo.dart';
import 'package:flutter_demo_structure/generated/l10n.dart';
import 'package:flutter_demo_structure/model/sample_model.dart';
import 'package:flutter_demo_structure/values/export.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


@RoutePage()
class SamplePage extends StatefulWidget {
  const SamplePage({super.key});

  @override
  State<SamplePage> createState() => _SamplePageState();
}

class _SamplePageState extends State<SamplePage> {


  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("Json Parsing" ,style: textExtraBold.copyWith(color: Colors.black26),),
      ),
      body: FutureBuilder(
          future: jsonToList(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    final item = snapshot.data?[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0).r,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.yellow.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(20).r),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0).r,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              showLine(S.current.title, item?.title ?? "null"),
                              10.verticalSpace,
                              showLine(
                                  S.current.description, item?.description ?? "null"),
                              10.verticalSpace,
                              showLine(
                                  S.current.price, item?.price.toString() ?? "null"),
                              10.verticalSpace,
                              CachedNetworkImage(
                                imageUrl: item?.images[0] ?? "null",
                                placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                                errorWidget: (context, url, error) => Center(child: Icon(Icons.error)),
                              height: 100.r ,
                              width: 100.r,)
                              ,
                              10.verticalSpace,
                              showLine(
                                  S.current.category, item?.category.name.name ?? "null" ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              }
              else if(snapshot.hasError){
                return Center(child: Text(S.current.dataNotLoaded,style: textExtraBold.copyWith(color: Colors.red),));
              }
            }else if(snapshot.connectionState == ConnectionState.waiting){
              return Center(child: CircularProgressIndicator());
            }
            return Container();
          }),
    );
  }

  Row showLine(String title, String value) {
    return Row(
      children: [
        Text(
          "$title :-",
          style: textBold.copyWith(color: Colors.blue),
        ),
        3.horizontalSpace,
        Expanded(
          child: Text(
            value,

            style: textRegular.copyWith(),
            maxLines: 2,
          ),
        ),
      ],
    );
  }

  Future<List<SampleModel>> jsonToList() async {
    final String response =
        await rootBundle.loadString('assets/json/sample.json');
    return sampleModelFromJson(response);
  }
}
