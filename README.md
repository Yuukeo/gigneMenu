# gigneMenu

This resource for ESX adds stack menu.

### Requirements
  * [es_extended](https://github.com/ESX-Org/es_extended)

## Download & Installation

### Using Git
```
cd resources
git clone https://github.com/xtrsyz/gigneMenu
```

### Manually
- Download https://github.com/xtrsyz/gigneMenu/archive/master.zip
- Put it in the `resource` directory


## Usage
```
start gigneMenu
```

for create menu
```lua
function gigneMenu()
  TriggerEvent('gigne:registerMenu', 'medSystem', {title = 'medSystem', label = 'medSystem', menu = 'medSystem'})
  TriggerEvent('gigne:registerMenu', 'medSystem', {key = 'medSystem', event = 'gigne:medSystem', label = 'Periksa korban'})
  TriggerEvent('gigne:registerMenu', 'dragDeadOrDying', {key = 'medSystem', event = 'menu:dragDeadOrDying', label = 'Bawa korban'})
end

RegisterNetEvent('gigne:startMenu')
AddEventHandler('gigne:startMenu', function()
  gigneMenu()
end)

RegisterNetEvent('gigne:medSystem')
AddEventHandler('gigne:medSystem', function()
  medSystem()
end)

gigneMenu()
```

# Legal
### License
gigneMenu - stack menu script for ESX

Copyright (C) 2020 Satria Adhi

This program Is free software: you can redistribute it And/Or modify it under the terms Of the GNU General Public License As published by the Free Software Foundation, either version 3 Of the License, Or (at your option) any later version.

This program Is distributed In the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty Of MERCHANTABILITY Or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License For more details.

You should have received a copy Of the GNU General Public License along with this program. If Not, see http://www.gnu.org/licenses/.