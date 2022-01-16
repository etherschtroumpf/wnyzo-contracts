// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";


contract WNYZO is ERC20, ERC20Burnable
{

    event Burn(address indexed burner, uint256 value, string addr);

    constructor() payable ERC20("Wrapped NYZO", "wNYZO") {
        _mint(msg.sender, 500000 * 10 ** 6);
    }

    function decimals() public pure override returns (uint8) {
		return 6;
	}

    /**
     * @dev Burns a specific amount of tokens.
     * @param amount The amount of token to be burned.
     * @param addr NYZO address.
     */
    function burn(uint256 amount, string memory addr) public {
        super.burn(amount);
        emit Burn(msg.sender, amount, addr);
    }
}
