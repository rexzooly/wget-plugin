# Wget Plugin

This is a Lua plugin for AMS 8.x product line. It was created by Rexzooly Kai Black (Kingzooly) and is designed to provide a user-friendly way of performing web calls using Wget.

You will need to download the wget.exes yourself and rename them wget32.exe and wget64.exe and set the path with __PathToWget in the [source.lua](https://github.com/rexzooly/wget-plugin/blob/main/source.lua) file.

## Usage

The plugin provides several functions to customize the behavior of the web calls. The most important ones are:

### `Wget.WebCall(s_URL, tArguments, sUA, bPost, tPost, sMore)`

This function performs a web call using the given URL, arguments, user agent, and more. The result of the web call is returned as a boolean (success) and a string (data).

### `Wget.SetQuiet(bQM)`

This function sets the quiet mode flag. When enabled, the plugin won't show any output.

### `Wget.SetSwitchs(sMore)`

This function sets additional switches for the Wget command line.

### `Wget.SetBit(sMore)`

This function sets the bitness of the Wget executable (32 or 64 bit).

### `Wget.DisableCleanUP(sMore)`

This function disables the cleanup of the temporary files.

### `Wget.ChangeTempDIR(sPath)`

This function changes the path of the temporary files.

### `Wget.SetTimeout(nTime)`

This function sets the timeout for the web call.

## Example

Here's an example of how to use the plugin:

```lua
local Wget = require("Wget")

local success, data = Wget.WebCall("https://example.com", AutoPlayMediaStudio. false. nil);

if success then
   --
else
    --
end
```

## About
This plugin was created by Rexzooly Kai Black (Kingzooly) for the AMS 8.x product line. The version of the plugin is 0.0.0.4, and it was last updated on April 2023. For more information, please visit the [official fourm post](https://forums.indigorose.com/forum/autoplay-media-studio-8-5/autoplay-media-studio-8-plugins-and-addons/307251-wget) and for the complied lmd.

## Download
Download the recreated plugin for plug and play like most plugins for AMS then please download it from the forum post [HERE](https://forums.indigorose.com/forum/autoplay-media-studio-8-5/autoplay-media-studio-8-plugins-and-addons/307251-wget)

### Thanks
This wouldn't be possible without [wget](https://www.gnu.org/software/wget/) so I would like to thank everyone whom as made that project possible.
