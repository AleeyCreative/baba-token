// SPDX-License-Identifier: MIT
pragma solidity ^0.8.x;

contract BabaToken {
    string public name = "Baba Token";
    string public symbol = "BBT";
    uint256 public totalSupply;

    event Transfer(
        address indexed _from,
        address indexed _to,
        uint amount
    );
 
    event Approve(
        address indexed _from,
        address indexed _to,
        uint amount
    );

    mapping(address => uint) public balanceof;
    mapping(address => mapping(address => uint)) public allowance;

    constructor (uint _initialValue)  {
        balanceof[msg.sender] = _initialValue;
        totalSupply = _initialValue;
    }

    
    function transfer(address _to, uint amount) public returns(bool success) {
        require(balanceof[msg.sender] > amount);
        balanceof[msg.sender] -= amount;
        balanceof[_to] += amount;
        emit Transfer(msg.sender, _to, amount);
        return true;
    }
    
    function approve(address _spender, uint _amount) public returns(bool success) {
        allowance[msg.sender][_spender] = _amount;
        emit Approve(msg.sender, _spender,_amount);
        return true;
    }

    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        require(_value <= balanceof[_from]);
        require(_value <= allowance[_from][msg.sender]);

        balanceof[_from] -= _value;
        balanceof[_to] += _value;

        emit Transfer(_from, _to, _value);
        allowance[_from][msg.sender] -= _value;
        return true;
    }


}