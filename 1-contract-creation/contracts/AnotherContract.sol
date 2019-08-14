pragma solidity ^0.5.8;

import './MyContract.sol';

contract AnotherContract {
  MyContract public myContract;

  constructor() public {
    myContract = new MyContract();
  }
}
