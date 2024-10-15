--// I apparently deobfuscated this shi but modified it a "bit" lmaooo
--// Original Shit: https://scriptblox.com/script/Universal-Script-Game-info-script-20316
--// I have no words on how is this helpful
DaFuqIs = {}
DaFuqIs.MS = game:GetService 'MarketplaceService'

function DaFuqIs:GetGame(I_NF_O)
    DaFuqIs.GAAAAYME = self.MS:GetProductInfo(game.PlaceId)

    return {
        GameName = DaFuqIs.GAAAAYME and DaFuqIs.GAAAAYME.Name or "Unknown Game",
        Creator = DaFuqIs.GAAAAYME and DaFuqIs.GAAAAYME.Creator.Name or "Unknown Creator",
        TotalPlayers = game.Players.NumPlayers,
        PlaceID = game.PlaceId,
        PlaceVersion = game.PlaceVersion,
        JobID = game.JobId,
    }
end

function DaFuqIs:GetPlayer(I_NF_O)
    DaFuqIs.Char = I_NF_O.Character
    DaFuqIs.Position = (DaFuqIs.Char and DaFuqIs.Char.PrimaryPart and DaFuqIs.Char.PrimaryPart.Position) or Vector3.new(0, 0, 0)

    return {
        PlayerName = I_NF_O.Name,
        UserID = I_NF_O.UserId,
        CharacterPosition = tostring(DaFuqIs.Position),
    }
end

function DaFuqIs:Ret(Entity)
    DaFuqIs.Info = {}
    DaFuqIs.Info.GAAAAYME = self:GetGame(Entity)
    DaFuqIs.Info.PlayerDetails = self:GetPlayer(Entity)

    return DaFuqIs.Info
end

function DaFuqIs:Print(I_NF_O)
    DaFuqIs.GameInfo = I_NF_O.GAAAAYME
    DaFuqIs.PlayerInfo = I_NF_O.PlayerDetails

    print(string.format(
        "---- GAME INFORMATION ----\n" ..
        "Game Name: %s\n" ..
        "Creator: %s\n" ..
        "Total Players: %d\n" ..
        "Place ID: %d\n" ..
        "Place Version: %d\n" ..
        "Job ID: %s\n\n" ..
        "---- PLAYER INFORMATION ----\n" ..
        "Player Name: %s\n" ..
        "User ID: %d\n" ..
        "Character Position: %s",
        DaFuqIs.GameInfo.GameName,
        DaFuqIs.GameInfo.Creator,
        DaFuqIs.GameInfo.TotalPlayers,
        DaFuqIs.GameInfo.PlaceID,
        DaFuqIs.GameInfo.PlaceVersion,
        DaFuqIs.GameInfo.JobID,
        DaFuqIs.PlayerInfo.PlayerName,
        DaFuqIs.PlayerInfo.UserID,
        DaFuqIs.PlayerInfo.CharacterPosition
    ))
end

coroutine.wrap(function()
    DaFuqIs.Player = game.Players.LocalPlayer
    DaFuqIs.Info = DaFuqIs:Ret(DaFuqIs.Player)
    DaFuqIs:Print(DaFuqIs.Info)
end)()
