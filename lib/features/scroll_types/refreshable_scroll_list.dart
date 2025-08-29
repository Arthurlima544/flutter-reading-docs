import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RefreshableScrollListExample extends StatelessWidget {
  const RefreshableScrollListExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(child: Center(child: RefreshableWidget())),
      ),
    );
  }
}

class RefreshableWidget extends StatefulWidget {
  const RefreshableWidget({super.key});

  @override
  State<RefreshableWidget> createState() => _RefreshableWidgetState();
}

class _RefreshableWidgetState extends State<RefreshableWidget> {
  late Future<List<String>> itens;
  final _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();
  final _scrollController = ScrollController();
  bool _isRefreshing = false;

  @override
  void initState() {
    super.initState();
    itens = getData();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<List<String>> getData() async {
    await Future.delayed(const Duration(seconds: 2));
    return List<String>.generate(100, (i) => 'Item ${Random().nextInt(100)}');
  }

  Future<void> _handleRefresh() async {
    _isRefreshing = true;
    setState(() {
      itens = getData();
    });
    await itens;
    _isRefreshing = false;
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerSignal: (event) {
        if (event is PointerScrollEvent &&
            event.scrollDelta.dy < 0 &&
            _scrollController.position.pixels == 0 &&
            !_isRefreshing) {
          _refreshIndicatorKey.currentState?.show();
        }
      },
      child: RefreshIndicator(
        key: _refreshIndicatorKey,
        color: Colors.blueAccent,
        backgroundColor: Colors.white60,
        strokeWidth: 2,
        displacement: 50,
        onRefresh: _handleRefresh,
        child: FutureBuilder<List<String>>(
          future: itens,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return SingleChildScrollView(
                controller: _scrollController,
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  children: [
                    const Text("TITLE.....", style: TextStyle(fontSize: 24)),
                    ..._buildWidgetList(snapshot.data!),
                  ],
                ),
              );
            }
            if (snapshot.hasError) {
              return Center(child: Text("Error: ${snapshot.error}"));
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }

  List<Widget> _buildWidgetList(List<String> data) {
    return List.generate(
      data.length,
      (i) => ListTile(title: Text(data[i]), leading: Icon(Icons.check)),
    );
  }
}
