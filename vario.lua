local timenow
local timenowSeconds
local hours
local minutes
local seconds
local secondsNext
local secondsGap

local currentAltitudeRange

local altitude

local function init_func()
  secondsNext = 0
  secondsGap = 2
  currentAltitudeRange = 0
end

local function run_func()

    local stepSize = 1
    local newAltitudeRange = 0

    altitude = getValue('Tmp1')
    
    if altitude < 11 then
        stepSize = 1
    elseif altitude < 20 then
        stepSize = 5
    elseif altitude <= 100 then
        stepSize = 10
    else
        stepSize = 20
    end
        

  
    newAltitudeRange = math.floor(altitude / stepSize ) * stepSize
    
    if newAltitudeRange >= currentAltitudeRange + stepSize  then
    
        currentAltitudeRange = newAltitudeRange
        playNumber(currentAltitudeRange, UNIT_METERS )
        
    elseif newAltitudeRange <= currentAltitudeRange - stepSize then
    
        playNumber(currentAltitudeRange, UNIT_METERS )
        currentAltitudeRange = newAltitudeRange
    end
    
    
end

return { init=init_func, run=run_func }