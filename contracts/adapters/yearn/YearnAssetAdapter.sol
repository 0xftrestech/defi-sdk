// Copyright (C) 2020 Zerion Inc. <https://zerion.io>
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program. If not, see <https://www.gnu.org/licenses/>.

pragma solidity 0.6.5;
pragma experimental ABIEncoderV2;

import { ERC20 } from "../../ERC20.sol";
import { ProtocolAdapter } from "../ProtocolAdapter.sol";

interface LPTokenWrapper{
  function balanceOf(address) external view returns (uint256);
}
/**
 * @title Adapter for iearn.finance protocol.
 * @dev Implementation of ProtocolAdapter interface.
 * @author Connor Martin <cnr.mrtn@gmail.com>
 */
contract YearnAssetAdapter is ProtocolAdapter {

    string public constant override adapterType = "Asset";

    string public constant override tokenType = "ERC20";

    address internal constant YEARNREWARDS_YFICLAIMABLE = 0xcc9EFea3ac5Df6AD6A656235Ef955fBfEF65B862;
    address internal constant YEARNREWARDS_STAKEREWARDS = 0x0001FB050Fe7312791bF6475b96569D83F695C9f;




    /**
     * @return Amount of YTokens held by the given account.
     * @dev Implementation of ProtocolAdapter interface function.
     */
    function getBalance(address token, address account) external view override returns (uint256) {
        return ERC20(YEARNREWARDS_STAKEREWARDS).balanceOf(account);
    }
}
