import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';
import 'package:web_socket_channel/io.dart';

class Services {
  Services();
  final String _rpc = 'http://172.20.10.8:7545';
  final _wsUrl = 'ws://172.20.10.8:7545/';
  final String privateKey =
      'ff46d239ea1894d0e7f490acb7e6f023ad0af314684150f74f12e772d7455af7';
  late final Web3Client web3client;
  String? abiCode;
  EthereumAddress? address;
  EthereumAddress? ownAddress;
  Credentials? credentials;
  DeployedContract? contract;
  ContractFunction? taskCount;
  ContractFunction? todos;
  ContractFunction? createTask;
  ContractEvent? taskCreated;

  Future<void> initiateSetup() async {
    web3client = Web3Client(
      _rpc,
      Client(),
      socketConnector: () => IOWebSocketChannel.connect(_wsUrl).cast<String>(),
    );
    await getAbi();
    await getCredentials();
    await getDeployedContract();
  }

  Future<void> getCredentials() async {
    credentials = EthPrivateKey.fromHex(privateKey);
    ownAddress = await credentials!.extractAddress();
  }

  Future<void> getDeployedContract() async {
    contract = DeployedContract(
      ContractAbi.fromJson(abiCode!, 'TodoList'),
      address!,
    );
    taskCount = contract!.function('taskCount');
    todos = contract!.function('tasks');
    createTask = contract!.function('create');
    taskCreated = contract!.event('TaskCreateEvent');
  }

  Future<String> addTask(String value) async {
    return web3client.sendTransaction(
      credentials!,
      Transaction.callContract(
        contract: contract!,
        function: createTask!,
        parameters: [
          value,
        ],
      ),
    );
  }

  Future<void> getAbi() async {
    final abiString = await rootBundle.loadString('src/abis/TodoList.json');
    final jsonAbi = json.decode(abiString);
    abiCode = json.encode(jsonAbi['abi']);
    address = EthereumAddress.fromHex(jsonAbi['networks']['5777']['address']);
  }
}
