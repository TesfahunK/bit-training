import 'package:bit_initial/ui/widgets/setting-tile.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ListTile(
            leading: Container(
              clipBehavior: Clip.antiAlias,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              height: 70,
              width: 70,
              child: Image.network(
                "https://img.freepik.com/free-photo/portrait-white-man-isolated_53876-40306.jpg?t=st=1657982071~exp=1657982671~hmac=600f8cc47f5202be32b09f2b3c7419b217b2df7b53bbe874d6802ff4bb2dafc7&w=1480",
                fit: BoxFit.cover,
              ),
            ),
            title: Text(
              "William John Malik",
              style: TextStyle(
                  color: Color(0xff37474f),
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              "Aggressive Investor",
              style: TextStyle(
                  color: Color(0xff37474f),
                  fontSize: 12,
                  fontWeight: FontWeight.w600),
            ),
            trailing: Icon(Icons.chevron_right),
          ),
          Divider(),
          SizedBox(
            height: 30,
          ),
          SettingListTile(
            title: "Personal Data",
            icon: Icons.person,
          ),
          SettingListTile(
            title: "Settings",
            icon: Icons.settings,
          ),
          SettingListTile(title: "E-Statements", icon: Icons.file_copy),
          SettingListTile(title: "Referral Code", icon: Icons.favorite),
          Container(
              margin: EdgeInsets.symmetric(vertical: 10), child: Divider()),
          SettingListTile(
            title: "FAQs",
            icon: Icons.more_horiz_sharp,
          ),
          SettingListTile(title: "Our Handbook", icon: Icons.edit),
          SettingListTile(
            title: "Community",
            icon: Icons.group,
          ),
          Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.deepPurpleAccent.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.headset_mic,
                  color: Colors.purple,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Feel free to ask, we ready to help",
                  style: TextStyle(color: Colors.purple, fontSize: 12),
                )
              ],
            ),
          ),
          SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}
