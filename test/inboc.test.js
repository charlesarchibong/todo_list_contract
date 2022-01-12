const assert = require('assert');
const Web3 = require('web3');
const ganache = require('ganache-cli');
const { abi, evm } = require('../compile');


const web3 = new Web3(ganache.provider());


let accounts;
let todoList

beforeEach(async () => {
    //Get a list of all accounts and use one of it to deploy the contract
    accounts = await web3.eth.getAccounts();
    todoList = await new web3.eth.Contract(abi)
        .deploy({
            data: evm.bytecode.object,
        })
        .send({ from: accounts[0], gas: '1000000' });

});

describe('TodoList', () => {

    it('deploys a contract', () => {
        console.log(todoList.options.address);
    })

});
