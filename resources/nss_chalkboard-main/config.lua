local DE = {
    close_text = 'Backspace = Schließen',
    nobody_nearby = 'Niemand in der Nähe, der das lesen könnte...',
    chalkboard_updated = 'Die Kreidetafel wurde aktualisiert.',
    your_are_dead = 'Du bist tot und kannst nichts schreiben.',
    no_chalkboard_item = 'Du hast keine Kreidetafel.',
    hint = 'Öffne den Chat und schreibe /{COMMAND} Hallo Welt', -- {COMMAND} will be replaced with the command name
}

local EN = {
    close_text = 'Backspace = Close',
    nobody_nearby = 'Nobody nearby that could read it...',
    chalkboard_updated = 'The chalkboard has been updated.',
    your_are_dead = 'You are dead and can not write anything.',
    no_chalkboard_item = 'You do not have a chalkboard.',
    hint = 'Open the chat and write /{COMMAND} Hello World', -- {COMMAND} will be replaced with the command name
}

local FR = {
    close_text = 'Backspace = Fermer',
    nobody_nearby = 'Personne à proximité qui pourrait le lire...',
    chalkboard_updated = 'Le tableau noir a été mis à jour.',
    your_are_dead = 'Vous êtes mort et ne pouvez rien écrire.',
    no_chalkboard_item = 'Vous n\'avez pas de tableau noir.',
    hint = 'Ouvrez le chat et écrivez /{COMMAND} Hello World', -- {COMMAND} will be replaced with the command name
}

local ES = {
    close_text = 'Backspace = Cerrar',
    nobody_nearby = 'Nadie cerca que pudiera leerlo...',
    chalkboard_updated = 'El pizarrón ha sido actualizado.',
    your_are_dead = 'Estás muerto y no puedes escribir nada.',
    no_chalkboard_item = 'No tienes un pizarrón.',
    hint = 'Abre el chat y escribe /{COMMAND} Hello World', -- {COMMAND} will be replaced with the command name
}

local NL = {
    close_text = 'Backspace = Sluiten',
    nobody_nearby = 'Niemand in de buurt die het zou kunnen lezen...',
    chalkboard_updated = 'Het krijtbord is bijgewerkt.',
    your_are_dead = 'Je bent dood en kunt niets schrijven.',
    no_chalkboard_item = 'Je hebt geen krijtbord.',
    hint = 'Open de chat en schrijf /{COMMAND} Hello World', -- {COMMAND} will be replaced with the command name
}

Config = {
    sender_see_message = true,
    message_range = 5,
    close_key = 0x308588E6, -- See https://github.com/mja00/redm-shit/blob/master/nuiweaponspawner/config.lua for key hashes,
    command = 'b',
    item_id = 'chalkboard', -- The command is always available if item_id is not set
    Language = FR
}