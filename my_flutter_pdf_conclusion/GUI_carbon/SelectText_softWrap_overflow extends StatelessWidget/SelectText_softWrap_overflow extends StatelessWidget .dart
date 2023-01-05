class SelectText_softWrap_overflow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ///////  SelectableText
        SelectableText(
          """ We Provide High Quality Oil Spill Response, Waste Management and Water Treatment 
           Services. We Are Ready to Guide Your Business and Processes towards a More 
           Sustainable Future. Oil Spill Response Expert. IMO Level 1,2 & 3. Total WM Services.""",
          showCursor: true,
          toolbarOptions: ToolbarOptions(
              copy: true, cut: true, paste: true, selectAll: true),
          cursorColor: Colors.red,
          cursorWidth: 20.0,
        ),
        //// //////////////////// [ without any effect]
        Container(
          margin: EdgeInsets.all(10.0),
          color: Colors.yellow,
          child: Text(
              """ We Provide High Quality Oil Spill Response, Waste Management and Water Treatment 
           Services. We Are Ready to Guide Your Business and Processes towards a More 
           Sustainable Future. Oil Spill Response Expert. IMO Level 1,2 & 3. Total WM Services."""),
        ),
        ///////  [softWrap: false, // all text in one line]
        Container(
          margin: EdgeInsets.all(10.0),
          height: 25.0,
          color: Colors.red,
          child: Text(
            """ We Provide High Quality Oil Spill Response, Waste Management and Water Treatment 
           Services. We Are Ready to Guide Your Business and Processes towards a More 
           Sustainable Future. Oil Spill Response Expert. IMO Level 1,2 & 3. Total WM Services.""",
            softWrap: false, // all text in one line
          ),
        ),
        //// //////////////////// [ TextOverflow.ellipsis ]
        Container(
          margin: EdgeInsets.all(10.0),
          height: 25.0,
          color: Colors.red,
          child: Text(
            """ We Provide High Quality Oil Spill Response, Waste Management and Water Treatment 
           Services. We Are Ready to Guide Your Business and Processes towards a More 
           Sustainable Future. Oil Spill Response Expert. IMO Level 1,2 & 3. Total WM Services.""",
            overflow: TextOverflow.ellipsis,
          ),
        ),

        //// ////////////////////[ TextOverflow.clip ]
        Container(
          margin: EdgeInsets.all(10.0),
          height: 25.0,
          color: Colors.red,
          child: Text(
            """ We Provide High Quality Oil Spill Response, Waste Management and Water Treatment 
           Services. We Are Ready to Guide Your Business and Processes towards a More 
           Sustainable Future. Oil Spill Response Expert. IMO Level 1,2 & 3. Total WM Services.""",
            overflow: TextOverflow.clip,
          ),
        ),
        //////////////////////// [ TextOverflow.fade]
        Container(
          margin: EdgeInsets.all(10.0),
          height: 25.0,
          color: Colors.red,
          child: Text(
            """ We Provide High Quality Oil Spill Response, Waste Management and Water Treatment 
           Services. We Are Ready to Guide Your Business and Processes towards a More 
           Sustainable Future. Oil Spill Response Expert. IMO Level 1,2 & 3. Total WM Services.""",
            overflow: TextOverflow.fade,
          ),
        ),
        ////////////////////  [ TextOverflow.visible]
        Container(
          margin: EdgeInsets.all(10.0),
          height: 25.0,
          color: Colors.red,
          child: Text(
            """ We Provide High Quality Oil Spill Response, Waste Management and Water Treatment 
           Services. We Are Ready to Guide Your Business and Processes towards a More 
           Sustainable Future. Oil Spill Response Expert. IMO Level 1,2 & 3. Total WM Services.""",
            overflow: TextOverflow.visible,
          ),
        ),
        ///////////////
      ],
    );
  }
}

