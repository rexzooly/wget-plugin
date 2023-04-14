--wget starting table

__64 = "64";
__32 = "32";
-- Set your Wget Path here.
__PathToWget = "";
Wget = {
	Version = {
		Plugin = {Build = "0.0.0.4", Notes = "This Plugin was created by Rexzooly Kai Black(Kingzooly) for AMS 8.x product line."},
	},
	DefaultBin = __64,
	RootTemp = _TempFolder.."\\",
	UA = true,
	QM = true,
	More = "",
	Time = 20,
	CleanUp = true,
	Post = false,
	Type = "data",
	Home = "https://www.gnu.org/software/wget/"
}

function Wget.HomePage()
	File.OpenURL(Wget.Home,SW_SHOWNORMAL);
end

function Wget.WebCall(s_URL, tArguments, sUA, bPost, tPost, sMore)
	
	if type(Wget.Time) == "number" and Wget.Time > 0 then
		sURL = "--timeout=" .. Wget.Time .. " \""..s_URL.."\"";
	else
		sURL = "--timeout=20 \""..s_URL.."\"";
	end
	
	if sUA == nil then
		sUserAgent = "404";
	else
		sUserAgent = sUA;
	end
	
	if bPost then
		bPost = bPost;
	else
		bPost = false;
	end

	if sMore == nil then
		sMore = "";
 	end

	local ArgumentsString = "";
	
	if tArguments ~= nil then
		for K, V in pairs(tArguments) do
			if (ArgumentsString == "") then
				ArgumentsString = "?"..tostring(K).."="..tostring(V);
			else
				ArgumentsString = ArgumentsString.."&"..tostring(K).."="..tostring(V );
			end
		end
	end
	
	if (File.DoesExist(__PathToWget.."\\wget"..Wget.DefaultBin..".exe")) then
		return __runner(sURL, ArgumentsString, sUserAgent, bPost, tPost, sMore);
	else
		return false;
	end
end

function __runner(sURL, ArgumentsString, sUserAgent, bPost, tPost, sMore)
	
	QM = "";
	UA = "";
	More = "";
	if Wget.QM then
		QM = "-q ";
	end	
	
	if bPost and type(tPost) == "table" then
		local postData = ""
		for key, value in pairs(tPost) do
			postData = postData .. key .. "=" .. value .. "&"
		end

		postData = string.sub(postData, 1, -2) -- remove last '&'
		
		QM = QM.."--post-data"..Wget.Type.."=\""..postData.."\" ";
	end
	
	if Wget.More ~= "" then
		More = " "..Wget.More.." ";
	end
	
	if Wget.More == "" and sMore ~= "" then
		More = More .. " " ..sMore.." "; 
	end
	
	if Wget.UA and (sUserAgent ~= "404") then
		UA = "--user-agent=\""..sUserAgent.."\"";
	end
	
	File.Run(__PathToWget.."\\wget"..Wget.DefaultBin..".exe", QM..UA.." -O \""..Wget.RootTemp.."\\~Wams.temp\" "..sURL..ArgumentsString..More, "",-1, true);	
	
	if (File.DoesExist(Wget.RootTemp.."\\~Wams.temp")) then		
		wGetToMemory = TextFile.ReadToString(Wget.RootTemp.."\\~Wams.temp");
		
		if Wget.CleanUp then
			File.Delete(Wget.RootTemp.."\\~Wams.temp", true, true, true);
		end
		return true, wGetToMemory;
	else
		return false;
	end
end

function Wget.SetQuiet(bQM)
	Wget.QM = bQM;
end

function Wget.SetSwitchs(sMore)
	sMore = string.gsub(sMore, "-H=", "--header=");
	Wget.More = sMore;
end

function Wget.SetBit(sMore)
	Wget.DefaultBin = sMore;
end

function Wget.DisableCleanUP(sMore)
	Wget.CleanUp = sMore;
end

function Wget.ChangeTempDIR(sPath)
	Wget.RootTemp = sPath
	
	if Folder.DoesExist(sPath)then
		return true
	else
		return false
	end
end

function Wget.SetTimeout(nTime)
	Wget.Time = nTime;
end

WgetTimeoutDefault = 900;
WgetTimeoutAMS = 20;
AutoPlayMediaStudio_4Classic = "AutoPlay Media Studio 4.0";
AutoPlayMediaStudio_5Classic = "AutoPlay Media Studio 5.0";
AutoPlayMediaStudio_6Classic = "AutoPlay Media Studio 6.0";
AutoPlayMediaStudio_7Classic = "AutoPlay Media Studio 7.0";
AutoPlayMediaStudio = "AutoPlay Media Studio 8.0";
Windows10_FireFox = "Mozilla/5.0 (Windows; U; Windows NT 10; en-GB; rv:89.0) Gecko/20100101 Firefox/89.0";
Windows81_FireFox = "Mozilla/5.0 (Windows; U; Windows NT 6.3; en-GB; rv:89.0) Gecko/20100101 Firefox/89.0";
Windows8_FireFox = "Mozilla/5.0 (Windows; U; Windows NT 6.2; en-GB; rv:89.0) Gecko/20100101 Firefox/89.0";
Windows7_FireFox = "Mozilla/5.0 (Windows; U; Windows NT 6.1; en-GB; rv:89.0) Gecko/20100101 Firefox/89.0";
WindowsVista_FireFox = "Mozilla/5.0 (Windows; U; Windows NT 6.0; en-GB; rv:10.0) Gecko/20100101 Firefox/52.9";
Windows2003_FireFox = "Mozilla/5.0 (Windows; U; Windows NT 5.2; en-GB; rv:10.0) Gecko/20100101 Firefox/52.9";
WindowsXP_FireFox = "Mozilla/5.0 (Windows; U; Windows NT 5.1; en-GB; rv:10.0) Gecko/20100101 Firefox/52.9";
Windows2000_FireFox = "Mozilla/5.0 (Windows; U; Windows NT 5.0; en-GB; rv:10.0) Gecko/20100101 Firefox/52.9";

Windows10_Chrome = "Mozilla/5.0 (Windows; U; Windows NT 10; en-GB; rv:89.0)";
Windows81_Chrome = "Mozilla/5.0 (Windows; U; Windows NT 6.3; en-GB; rv:89.0)";
Windows8_Chrome = "Mozilla/5.0 (Windows; U; Windows NT 6.2; en-GB; rv:89.0)";
Windows7_Chrome = "Mozilla/5.0 (Windows; U; Windows NT 6.1; en-GB; rv:89.0)";
WindowsVista_Chrome = "Mozilla/5.0 (Windows; U; Windows NT 6.0; en-GB; rv:10.0)";
Windows2003_Chrome = "Mozilla/5.0 (Windows; U; Windows NT 5.2; en-GB; rv:10.0)";
WindowsXP_Chrome = "Mozilla/5.0 (Windows; U; Windows NT 5.1; en-GB; rv:10.0)";
Windows2000_Chrome = "Mozilla/5.0 (Windows; U; Windows NT 5.0; en-GB; rv:10.0)";
