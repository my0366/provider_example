import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/provider/base_provider.dart';

class BaseScreen extends StatefulWidget {

  final Widget body;
  Widget? floatingActionButton;

  BaseScreen(this.body, {super.key, this.floatingActionButton});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      floatingActionButton: widget.floatingActionButton,
      body: Stack (
        children: [
          SafeArea(child: widget.body),
          Consumer<BaseProvider>(
            builder: (context, provider, _) {
              if (provider.state.isLoading) {
                return _loadingWidget();
              }
              return Container();
            },
          ),
        ],
      ),
    );
  }


  Widget _loadingWidget() {
    return Container(
      color: Colors.black.withOpacity(0.5),
      child: const Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      ),
    );
  }
}
