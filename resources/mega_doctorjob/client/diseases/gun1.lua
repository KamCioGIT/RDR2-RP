if DiseasesConfig['gun1'] then
    local gun1 = Disease:new(DiseasesConfig['gun1'])

    function gun1:init()
        Citizen.CreateThread(function()
            EventManager:on(GetHashKey('EVENT_NETWORK_DAMAGE_ENTITY'), function(data)
                local entityDamaged = data:GetInt32(0)
                local weaponUsed = data:GetInt32(8 * 5)
                local ammoUsed = data:GetInt32(8 * 6)
                local isMelee = data:GetInt32(8 * 12)
                if entityDamaged == PlayerPedId() and not self._data.active then
                    if isMelee == 0 then
                        for k, prob in pairs(self.config.firearmsBleedProbability) do
                            if GetHashKey(k) == weaponUsed then
                                local random = math.random()
                                if random <= prob then
                                    self:setPaused(false)
                                    self:setActive(true)
                                    self._data.damageType = 'projectile'
                                    self:startEffect()
                                end
                            end
                        end
                    end
                end
            end)
            local sleep = false
            while true do
                if sleep then
                    Citizen.Wait(1000)
                else
                    Citizen.Wait(self.config.tickRate)
                end
                if self._data.active then
                    sleep = false
                    Citizen.InvokeNative(0xDE1B1907A83A1550, PlayerPedId(), 0.0)
                    if IsPedDeadOrDying(PlayerPedId()) and not self._data.paused then
                        self:setPaused(true)
                    end
                    if Config.removeDiseaseOnRevive then
                        if IsPedDeadOrDying(PlayerPedId()) then
                            self:stopEffect()
                            self:setActive(false)
                            self:setPaused(false)
                        end
                    end
                    if self.config.enableRagdoll then
                        if (IsPedSprinting(PlayerPedId()) or IsPedRunning(PlayerPedId())) and IsPedOnFoot(PlayerPedId()) then
                            Wait(1000)
                            Citizen.InvokeNative(0xD9B31B4650520529, 'MEDIUM_EXPLOSION_SHAKE', 0.5)
                            SetPedToRagdoll(PlayerPedId(), 2000, 5000, 0, true, true, true)
                        end
                    end
                else
                    sleep = true
                end
            end
        end)
    end

    function gun1:startEffect()
            self._data.paused = false
            TriggerEvent('mega_notify:notifyRight', Config.language.notificationTitle, self.config.language.started, 5000,
                'health')
            -- Start timer
            if self.config.autoHealTime ~= -1 then
                Citizen.CreateThread(function()
                    Citizen.Wait(self.config.autoHealTime)
                    if self._data.active then
                        TriggerServerEvent('mega_doctorjob:autoHealDiseaseWebhook', self.config.displayName)
                        TriggerEvent('mega_notify:notifyRight', Config.language.notificationTitle,
                            self.config.language.autoHealed, 5000, 'health')
                        self:stopEffect()
                        self:setActive(false)
                    end
                end)
            end
            -- Set Walkanim
            if not self._data.bone then
                local hit, bone = GetPedLastDamageBone(PlayerPedId())
                self._data.bone = bone
            end
            if not self._data.damageType then
                self._data.damageType = 'projectile'
            end
            TriggerServerEvent('mega_doctorjob:newDiseaseWebhook', self.config.displayName, self.data)
            -- Start blood fountain
    end

    function gun1:stopEffect()
        -- Set locomotion
        Citizen.InvokeNative(0x923583741DC87BCE, PlayerPedId(), 'arthur_healthy') -- SetPedDesiredLocoForModel
        Citizen.InvokeNative(0x89F5E7ADECCCB49C, PlayerPedId(), 'default')    -- SetPedDesiredLocoMotionType
        Citizen.InvokeNative(0x4FD80C3DD84B817B, PlayerPedId())               -- ClearPedDesiredLocoForModel
        Citizen.InvokeNative(0x58F7DB5BD8FA2288, PlayerPedId())               -- ClearPedDesiredLocoMotionType
        -- Clear wound effects
        Citizen.InvokeNative(0x66B1CB778D911F49, PlayerPedId(), 0.0)
        self._data.bone = nil
    end

    function gun1:setPaused(paused)
        self._data.paused = paused
        if paused then
            -- Set locomotion
            Citizen.InvokeNative(0x923583741DC87BCE, PlayerPedId(), 'arthur_healthy') -- SetPedDesiredLocoForModel
            Citizen.InvokeNative(0x89F5E7ADECCCB49C, PlayerPedId(), 'default')    -- SetPedDesiredLocoMotionType
            Citizen.InvokeNative(0x4FD80C3DD84B817B, PlayerPedId())               -- ClearPedDesiredLocoForModel
            Citizen.InvokeNative(0x58F7DB5BD8FA2288, PlayerPedId())               -- ClearPedDesiredLocoMotionType
            -- Clear wound effects
            Citizen.InvokeNative(0x66B1CB778D911F49, PlayerPedId(), 0.0)
        end
    end

    DiseasesManager:loadDisease(gun1)
end
