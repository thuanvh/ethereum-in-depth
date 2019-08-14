pragma solidity >=0.4.21;

import "./Greeter.sol";

contract Wallet {
  Greeter internal greeter;

  constructor() public {
    greeter = new Greeter();
  }

  function () external payable {
    bytes4 methodId = Greeter(0).thanks.selector;
    (bool status,) = address(greeter).delegatecall(abi.encode(methodId));
    require(status);
  }
}
