// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

interface ERC20Interface {
    function totalSupply() external view returns (uint);

    function balanceOf(address account) external view returns (uint balance);

    function allowance(
        address owner,
        address spender
    ) external view returns (uint remaining);

    function transfer(
        address recipient,
        uint amount
    ) external returns (bool successs);

    function approve(
        address spender,
        uint amount
    ) external returns (bool success);

    function transferFrom(
        address sender,
        address recipient,
        uint amount
    ) external returns (bool success);

    event Transfer(address indexed from, address indexed to, uint value);
    event Approval(address indexed owner, address indexed spender, uint value);
}

contract KryptoShark is ERC20Interface {
    string public symbol;
    string public name;
    uint public decimals;
    uint public _totalSupply;

    mapping(address => uint) balances;
    mapping(address => mapping(address => uint)) allowed;

    constructor() {
        symbol = "KTS";
        name = "Krypto Shark Token";
        decimals = 18;
        _totalSupply = 1_000_001_000_000_000_000_000_000;
        balances[msg.sender] = _totalSupply;
        emit Transfer(address(0), msg.sender, _totalSupply);
    }

    function totalSupply() public view returns (uint) {
        // return _totalSupply - balances[address(0)];
        return _totalSupply;
    }

    function balanceOf(address account) public view returns (uint balance) {
        return balances[account];
    }

    function transfer(
        address recipient,
        uint amount
    ) public returns (bool success) {
        balances[msg.sender] = balances[msg.sender] - amount;
        balances[recipient] = balances[recipient] + amount;
        emit Transfer(msg.sender, recipient, amount);
        return true;
    }

    function approve(
        address spender,
        uint amount
    ) public returns (bool success) {
        allowed[msg.sender][spender] = amount;
        emit Approval(msg.sender, spender, amount);
        return true;
    }

    function transferFrom(
        address sender,
        address recipient,
        uint amount
    ) public returns (bool success) {
        // balances[sender] = balances[sender]-amount;
        allowed[sender][msg.sender] = allowed[sender][msg.sender] - amount;
        balances[recipient] = balances[recipient] + amount;
        emit Transfer(sender, recipient, amount);
        return true;
    }

    function allowance(
        address owner,
        address spender
    ) public view returns (uint remaining) {
        return allowed[owner][spender];
    }
}
