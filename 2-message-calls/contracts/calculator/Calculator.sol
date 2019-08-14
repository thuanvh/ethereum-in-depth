pragma solidity >=0.4.21;

import "./Product.sol";
import "./Addition.sol";
import "./ResultStorage.sol";

contract Calculator is ResultStorage {
  Product public product;
  Addition public addition;

  constructor() public {
    product = new Product();
    addition = new Addition();
  }

  function add(uint256 x) public {
    bytes4 methodId = Addition(0).calculate.selector;
    (bool status,) = (address(addition).delegatecall(abi.encode(methodId, x)));
    require(status);
  }

  function mul(uint256 x) public {
    bytes4 methodId = Product(0).calculate.selector;
    (bool status,) = (address(product).delegatecall(abi.encode(methodId, x)));
    require(status);
  }
}
