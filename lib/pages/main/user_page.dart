import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/pages/common_screen.dart';
import 'package:provider_example/provider/base_provider.dart';
import 'package:provider_example/provider/user_provider.dart';
import 'package:provider_example/utils/toast_util.dart';

class UserPage extends StatefulWidget {
  UserPage({super.key, required this.userProvider});

  UserProvider userProvider;

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {

  @override
  void initState() {
    super.initState();
    widget.userProvider.baseProvider = context.read<BaseProvider>();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(_buildPage(context));
  }

  Widget _buildPage(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                widget.userProvider.updateCount().then((value) {
                  ToastUtil.showToast("성공했습니다.", context);
                });
              },
              child: const Text("증가", style: TextStyle(fontSize: 20)),
            ),
          ],
        ),
        const SizedBox(height: 8),
        InkWell(
          onTap: () {

          },
          child: const Text("물결 테스트", style: TextStyle(fontSize: 20),),
        )
      ],
    );
  }
}
