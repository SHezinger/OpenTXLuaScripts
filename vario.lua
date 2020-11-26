local currentAltitudeRange


local function init_func()

    currentAltitudeRange = 0
end



local function run_func()

    -- float 
    local stepSize = 1

    
    local altitude = getValue('Alt')
    
    if altitude > -0.1 then 
    
        if altitude < 11 then
            stepSize = 1
        elseif altitude < 20 then
            stepSize = 5
        elseif altitude <= 100 then
            stepSize = 10
        else
            stepSize = 20
        end           
            
        local newAltitudeRange = 0
        newAltitudeRange = math.floor(altitude / stepSize ) * stepSize
        
        if newAltitudeRange >= currentAltitudeRange + stepSize  then
        
            currentAltitudeRange = newAltitudeRange
            playNumber(currentAltitudeRange, UNIT_METERS )
            
        elseif newAltitudeRange <= currentAltitudeRange - stepSize then
        
            playNumber(currentAltitudeRange, UNIT_METERS )
            currentAltitudeRange = newAltitudeRange
        end
    
    end
    
    
end

return { init=init_func, run=run_func }