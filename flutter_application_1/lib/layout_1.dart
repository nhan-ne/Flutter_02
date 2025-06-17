import 'package:flutter/material.dart';

class Layout extends StatelessWidget {
  const Layout({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Expanded(flex: 1, child: Container(color: Colors.red)),
                Expanded(flex: 1, child: Container(color: Colors.brown)),
                Expanded(flex: 1, child: Container(color: Colors.red)),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Expanded(flex: 1, child: Container(color: Colors.amber)),
                Expanded(
                  flex: 1,
                  child: Container(
                    child: Column(
                      children: [
                        Expanded(
                          // Thêm Expanded ở đây
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(color: Colors.green),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(color: Colors.red),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          // Và ở đây
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(color: Colors.indigoAccent),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(flex: 1, child: Container(color: Colors.amber)),
              ],
            ),
          ),
          Expanded(
            flex: 4,
            child: Row(
              children: [
                Expanded(flex: 1, child: Container(color: Colors.purpleAccent)),
                Expanded(flex: 1, child: Container(color: Colors.indigo)),
                Expanded(flex: 1, child: Container(color: Colors.purpleAccent)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
