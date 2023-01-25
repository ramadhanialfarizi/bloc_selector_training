import 'package:bloc_selector_training/bloc_state/bloc_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePages extends StatelessWidget {
  const HomePages({super.key});

  @override
  Widget build(BuildContext context) {
    UserBloc userState = context.read<UserBloc>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bloc Selector"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // "blocSelector" dan "blocBuilder" itu sama
              /*
                bloc Builder => membutuhkan bloc untuk stream data
                bloc selector => membutuhkan selector untuk stream data
              
              */
              // bloc selector memerlukan 3 parameter
              // BlocSelector<nama_state, tipe_data_dari_state, tipe_data_untuk_di_build>()
              BlocSelector<UserBloc, Map<String, dynamic>, String>(
                selector: (state) => state['name'],
                builder: (context, state) {
                  print("nama di build");
                  return Text(
                    "Name : $state",
                    style: TextStyle(fontSize: 20),
                  );
                },
              ),
              BlocSelector<UserBloc, Map<String, dynamic>, int>(
                selector: (state) => state['age'],
                builder: (context, state) {
                  print("umur di build");
                  return Text(
                    "Age : $state",
                    style: TextStyle(fontSize: 20),
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                onChanged: (value) => userState.changeName(value),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      userState.changeAge(userState.state['age'] - 1);
                    },
                    icon: Icon(Icons.remove),
                  ),
                  IconButton(
                    onPressed: () {
                      userState.changeAge(userState.state['age'] + 1);
                    },
                    icon: Icon(Icons.add),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
