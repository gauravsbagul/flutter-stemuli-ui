import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/dashboard.dart';
import '../providers/profile.dart';
import 'package:STEMuli/style/color.dart';
import '../widgets/dashboard/volunteerDasboardCard.dart';

class DashboardScreen extends StatefulWidget {
  static const routeName = '/dashboard';

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool isData = false;
  dynamic profilaData;
  dynamic dashBoardData;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void getData() async {
    final dashBoardDataRes =
        await Provider.of<Dashboard>(context).getDashboard();

    setState(() {
      isData = true;
      dashBoardData = dashBoardDataRes;
    });
  }

  void getProfile() async {
    final profilaDataRes =
        await Provider.of<Profile>(context, listen: false).getUserProfile();
    setState(() {
      profilaData = profilaDataRes;
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!isData) {
      getData();
      getProfile();
    }
  }

  @override
  Widget build(BuildContext context) {
    final dashBoardDataResponse =
        dashBoardData != null && isData ? dashBoardData['response'] : null;
    print('DASHBOARDDATA: $dashBoardDataResponse');
    final profileResponse =
        profilaData != null ? profilaData['response'] : null;
    print('PROFILERESPONSE: $profileResponse');
    return Scaffold(
      backgroundColor: HexColor('#F3F5F9'),
      appBar: AppBar(
        elevation: 0,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Consumer<Dashboard>(builder: (ctx, dashboard, _) {
          return Stack(
            children: <Widget>[
              Container(
                child: !isData
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.fromLTRB(25, 0, 25, 20),
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(32),
                                bottomRight: Radius.circular(32),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Mentor\'s Dashboard',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Muli-Bold.ttf',
                                    fontSize: 22,
                                  ),
                                ),
                                SizedBox(height: 20),
                                Row(
                                  children: <Widget>[
                                    CircleAvatar(
                                      radius: 40,
                                      backgroundColor: Colors.blueAccent,
                                      backgroundImage: profileResponse != null
                                          ? NetworkImage(
                                              profileResponse['profile_picture']
                                                  ['url'],
                                            )
                                          : null,
                                    ),
                                    SizedBox(width: 10),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        profileResponse != null
                                            ? Text(
                                                "Hi ${profileResponse['user']['name']}",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'Muli-Bold.ttf',
                                                ),
                                              )
                                            : null,
                                        SizedBox(height: 10),
                                        Text(
                                          'Wellsfargo',
                                          style: TextStyle(
                                            color: Colors.white38,
                                            fontFamily: 'Muli-Bold.ttf',
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Tasks',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Muli.ttf',
                                    fontSize: 20,
                                    color: HexColor('#344356'),
                                  ),
                                ),
                                Text(
                                  'Student progress depend on this',
                                  style: TextStyle(
                                    fontFamily: 'Muli.ttf',
                                    fontSize: 16,
                                    color: HexColor('#9b9b9b'),
                                    letterSpacing: 0.29,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 20.0),
                                  height: 200.0,
                                  child: new ListView(
                                    scrollDirection: Axis.horizontal,
                                    children: <Widget>[
                                      VolunteerDashboardCart(),
                                      SizedBox(width: 10),
                                      VolunteerDashboardCart(),
                                      SizedBox(width: 10),
                                      VolunteerDashboardCart(),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 300,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(16)),
                                  ),
                                  child: Column(
                                    children: <Widget>[
                                      Image.asset('assets/images/friends.png'),
                                      Padding(
                                        padding: EdgeInsets.all(10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              'Virtual mentorship',
                                              style: TextStyle(
                                                  color: HexColor('#344356'),
                                                  fontWeight: FontWeight.w700,
                                                  fontFamily: 'Muli.ttf',
                                                  fontSize: 22),
                                            ),
                                            Text('18 new slots available'),
                                            InkWell(
                                              onTap: () {},
                                              child: Container(
                                                width: double.infinity,
                                                height: 50,
                                                decoration: BoxDecoration(
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(6),
                                                  ),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    'JOIN NOW',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
