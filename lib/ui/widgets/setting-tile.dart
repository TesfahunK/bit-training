import 'package:flutter/material.dart';

class SettingListTile extends StatelessWidget {
  final IconData icon;
  final String? title;

  const SettingListTile({Key? key, required this.icon, this.title = "Abebe"})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: ListTile(
        leading: Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.05),
                borderRadius: BorderRadius.circular(10)),
            height: 40,
            width: 40,
            child: Center(
                child: Icon(
              icon,
              size: 20,
              color: Color(0xff1a237e),
            ))),
        title: Text(
          title!,
          style: TextStyle(
              color: Color(0xff37474f),
              fontSize: 12,
              fontWeight: FontWeight.w600),
        ),
        trailing: Icon(Icons.chevron_right),
      ),
    );
  }
}
