scriptId = 'com.thalmic.examples.myfirstscript'
scriptTitle = "My First Script"
scriptDetailsUrl = ""
appTitle = ""
currentPose = ""
currentRoll = 0
isPlayingMusic = "NO"
isVolumeMuted = "NO"
currentTime = 0

startRead = 0

--myo.setLockingPolicy("none")
--myo.setLockingPolicy("standard")
--myo.unlock(unlockType)
--myo.unlock("timed")
--myo.unlock("hold")
 
function onForegroundWindowChange(app, title)
    --myo.debug("onForegroundWindowChange: " .. app .. ", " .. title)
    appTitle = title
    return true
end


function activeAppName()
	return appTitle
end



function onPoseEdge(pose, edge)
    --myo.debug("onPoseEdge: " .. pose .. ": " .. edge)
    --left/right handed
    --pose = conditionallySwapWave(pose)
    
    local keyEdge = edge == "off" and "up" or "down"
    currentPose = pose;

    if (pose == "waveOut") then
        onWaveOut(keyEdge)        
    elseif (pose == "waveIn") then
        onWaveIn(keyEdge)
    elseif (pose == "fist") then
        onFist(keyEdge)
    elseif (pose == "fingersSpread") then
        onFingersSpread(keyEdge)            
    end
end

function round(num, idp)
  local mult = 10^(idp or 0)
  return math.floor(num * mult + 0.5) / mult
end


--function onPeriodic()
--	if (currentPose == "fist") then
--		if (myo.getPitch() >= 0.8) then
--			myo.unlock("timed")
--		elseif (myo.getPitch() < 0.3) then
--			endValue = myo.getRoll()
--			differenceValue = endValue - startValue
			
			
			--myo.debug("roll: " .. myo.getRoll())

			--myo.debug("volume: " .. round(myo.getRoll(),1))
			
			--myo.debug("average: " .. valueAverage)

			--if (myo.getRoll() > currentRoll) then
			--	myo.debug("INCREASE VOLUME");
			--elseif (myo.getRoll() <= currentRoll) then
			--	myo.debug("DECREASE VOLUME");
			--end
			--currentRoll = myo.getRoll()q
			--myo.debug("CHANGE VOLUME: " .. myo.getRoll() .. ", PITCH: " .. myo.getPitch())
--		end
		
--	end
--end

function onWaveOut(keyEdge)
	if (keyEdge == "down") then
		myo.debug("SWIPE PICTURE RIGHT")
	end
    
    --myo.vibrate("short")
    myo.keyboard("d", keyEdge)
end

function onWaveIn(keyEdge)
	if (keyEdge == "down") then
    	myo.debug("SWIPE PICTURE LEFT")
	end
    --myo.vibrate("short")
    --myo.vibrate("short")
    myo.keyboard("s",keyEdge)
end


function onFist(keyEdge)
	-- air punch
	if (myo.getPitch() >= 0.8) then
		if (keyEdge == "down") then
			myo.keyboard("a",keyEdge)
			if (isVolumeMuted == "NO") then
				myo.debug("MUTE VOLUME")
				isVolumeMuted = "YES"
			elseif (isVolumeMuted == "YES") then
				myo.debug("UNMUTE VOLUME")
				isVolumeMuted = "NO"
			end
		end
	-- volume control
	else
		-- get starting read
		if (keyEdge == "down") then
			startRead = myo.getRoll()
		-- get ending read
		elseif (keyEdge == "up") then
			if ((myo.getRoll() - startRead) < 0) then
				myo.debug ('DECREASE VOLUME')
				myo.keyboard("x","down","control")
			else
				myo.debug ('INCREASE VOLUME')
				myo.keyboard("w","down","control")
			end
		end
	end
end

--function onFist(keyEdge)

--	if (myo.getPitch() >= 0.8) then
--		if (keyEdge == "down") then
--			myo.keyboard("a",keyEdge)
--			if (isVolumeMuted == "NO") then
--				myo.debug("MUTE VOLUME")
--				isVolumeMuted = "YES"
--			elseif (isVolumeMuted == "YES") then
--				myo.debug("UNMUTE VOLUME")
--				isVolumeMuted = "NO"
--			end
--			myo.unlock("timed")
--		end
--	elseif (myo.getPitch() < 0.3) then
--		if (keyEdge == "down") then
--			startValue = myo.getRoll()
--			myo.unlock("hold")
--		elseif (keyEdge == "up") then
			--myo.unlock("timed")
--			myo.keyboard("w", keyEdge)
--		end
--	end
--end

function onFingersSpread(keyEdge)
	myo.keyboard("q", keyEdge)
	if (keyEdge == "down") then
		if (isPlayingMusic == "NO" and myo.getPitch() < 0.0) then
			myo.debug("PLAY AC/DC SOUNDTRACK")
			isPlayingMusic = "YES"
		elseif (isPlayingMusic == "YES") then
			myo.debug("STOP AC/DC SOUNDTRACK")
			isPlayingMusic = "NO"
		end
		
	end

    --myo.vibrate("long")
    --myo.keyboard("escape", keyEdge)
end