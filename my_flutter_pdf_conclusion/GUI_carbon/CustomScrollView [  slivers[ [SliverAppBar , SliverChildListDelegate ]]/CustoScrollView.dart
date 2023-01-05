  CustomScrollView customScrollview() {
    return CustomScrollView(
      slivers: [
        ///-------------- -----  ----   SliverAppBar
        SliverAppBar(
          snap: true,
          pinned: true,
          floating: true,
          //////  ---------- FlexibleSpaceBar  ----- ////////
          flexibleSpace: FlexibleSpaceBar(
            //centerTitle: true,
            title: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14.0),
                gradient: LinearGradient(
                  colors: [
                    Colors.green,
                    Colors.green.shade900,
                  ],
                ),
              ),
              child: Text("hi ya pro ---",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ) //TextStyle
                  ),
            ),

            // يتم التحكم بها لتختفي
            background: FlutterLogo(
              size: 230,
            ),
          ),
          //////  ---------- FlexibleSpaceBar  ----- ////////
          expandedHeight: 220,
          backgroundColor: Colors.greenAccent[400],
          leading: IconButton(
            icon: Icon(Icons.menu),
            tooltip: 'Menu',
            onPressed: () {},
          ), //IconButton
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.comment),
              tooltip: 'Comment Icon',
              onPressed: () {},
            ), //IconButton
            IconButton(
              icon: Icon(Icons.settings),
              tooltip: 'Setting Icon',
              onPressed: () {},
            ), //IconButton
          ], //<Widget>[]
        ),

        ///-------------- -----  ----     body
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Container(
                height: 250.0,
                child: ListTile(
                  tileColor: Colors.amber,
                  leading: Text("hi"),
                ),
              ),
              Container(
                height: 250.0,
                child: ListTile(
                  tileColor: Colors.amber,
                  leading: Text("hi"),
                ),
              ),
              Container(
                height: 250.0,
                child: ListTile(
                  tileColor: Colors.amber,
                  leading: Text("hi"),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
