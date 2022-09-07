import 'package:flutter/material.dart';
class bordingsecreen {
  final String image;
  final String title;
  final String text;

  bordingsecreen({
    required this.image,
    required this.text,
    required this.title,
  });
}
class hmome_secreen extends StatelessWidget {
  hmome_secreen({Key? key}) : super(key: key);
  var controller =PageController();
  int index =0;

  List<bordingsecreen> itme=[
    bordingsecreen(image: "assets/fee.jpg",text: "FMEE ",title: "Page : 1"),
    bordingsecreen(image: "assets/22.jpg",text: "MTN ",title: "Page : 2"),
    bordingsecreen(image: "assets/4.png",text: "IMAGE 2",title: "Page : 3"),


  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                physics: BouncingScrollPhysics(),
                itemBuilder:(context,index)=>bulidbordingsecreen(itme[index]),
                itemCount: itme.length,
                controller: controller,
              ),
            ),
            Row(
              children: [
                Text(
                  ">>>",

                ),
                Spacer(),
                FloatingActionButton(onPressed: (){
                  controller.nextPage(duration: Duration(
                    milliseconds: 750,
                  ), curve: Curves.fastLinearToSlowEaseIn);
                },child: Icon(
                  Icons.arrow_forward_ios,
                ),)
              ],
            )
          ],
        ),
      ),
    );
  }
  Widget bulidbordingsecreen(bordingsecreen model)=> Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        child: Image(
            image: AssetImage('${model.image}'),
        ),
      ),

      SizedBox(height: 10.0,),
      Text(
        "${model.title}",
        style: TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.bold,

        ),

      ),
      SizedBox(height: 30.0,),
      Text(
        "${model.text}",
      ),
      SizedBox(height: 15.0,)
    ],
  );
}
