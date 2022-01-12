const path = require('path');
const fs = require('fs');
const solc = require('solc');
const constractPath = path.resolve(__dirname, 'contracts', 'TodoList.sol');

const source = fs.readFileSync(constractPath, 'utf8');

const input = {
    language: 'Solidity',
    sources: {
        'TodoList.sol': {
            content: source,
        },
    },
    settings: {
        outputSelection: {
            '*': {
                '*': ['*'],
            },
        },
    },
};


module.exports = JSON.parse(solc.compile(JSON.stringify(input))).contracts[
    'TodoList.sol'
].TodoList;
