const AudioFiles = {
    TUMBLER_TURN: { name: "TUMBLER_TURN.wav", volume: 0.2 },
    TUMBLER_PIN_FALL: { name: "TUMBLER_PIN_FALL.wav", volume: 0.00 },
    TUMBLER_PIN_FALL_FINAL: { name: "TUMBLER_PIN_FALL_FINAL.wav", volume: 0.1 },
    TUMBLER_RESET: { name: "TUMBLER_RESET.wav", volume: 0.3 },
    OPEN_SAFE: { name: "OPEN_SAFE.wav", volume: 0.3 },
};

let Sounds = {};
for (let audio in AudioFiles) {
    let sound = new Audio(AudioFiles[audio].name);
    sound.volume = AudioFiles[audio].volume;
    Sounds[audio] = sound;
}

const KEYS = {
    A: 65,
    D: 68,
    ENTER: 13,
    ESC: 27,
};

let SafeState = {
    CurrentPin: 1,
    onPin: false,
    SafeCombinations: {},
    CurrentSafeCombinations: {},
    SafeDialRotation: 0,
    timer: 0,
    currentDirection: "left",
};

const DIAL_ROTATION_MULTIPLIER = 36;

$(document).ready(function() {
    $(document).keydown(handleKeyPress);
    document.onkeyup = handleKeyUp;
    window.addEventListener("message", handleWindowMessage);
});

function handleKeyPress(e) {
    if (SafeState.timer < Date.now()) {
        let keyHandlers = {
            [KEYS.A]: () => rotateDial(1),
            [KEYS.D]: () => rotateDial(-1),
            [KEYS.ENTER]: handleEnter,
        };
        if (keyHandlers[e.which]) keyHandlers[e.which]();
    }
}

function handleKeyUp(data) {
    if (data.which == KEYS.ESC) {
        $(".dial").fadeOut();
        $.post("http://gtp_safecracking/closeui");
    }
}

function rotateDial(multiplier) {
    let rotationChange = multiplier * DIAL_ROTATION_MULTIPLIER;

    SafeState.SafeDialRotation += rotationChange;
    if (!resetDialIfNeeded()) {
        rotateDialAnimation();
    }

    Sounds.TUMBLER_TURN.play();

    let currentValue = getCurrentSafeDialNumber(SafeState.SafeDialRotation);

    if (
        (SafeState.currentDirection === "left" && multiplier === 1) ||
        (SafeState.currentDirection === "right" && multiplier === -1)
    ) {
        resetMinigame();
    }
    if (SafeState.SafeCombinations[SafeState.CurrentPin].value === currentValue) {
        SafeState.onPin = true;
        Sounds.TUMBLER_PIN_FALL.play();
    }
}

function handleEnter() {
    if (SafeState.onPin) {
        SafeState.SafeCombinations[SafeState.CurrentPin].status = false;
        SafeState.CurrentPin += 1;
        Sounds.TUMBLER_PIN_FALL_FINAL.play();
        SafeState.onPin = false;
        SafeState.currentDirection =
            SafeState.currentDirection === "left" ? "right" : "left";

        if (!SafeState.SafeCombinations[SafeState.CurrentPin]) {
            Sounds.OPEN_SAFE.play();
            $(".dial").fadeOut();
            $.post(
                "http://gtp_safecracking/onresult",
                JSON.stringify({ result: true })
            );
        }
    } else {
        resetMinigame();
    }
}

function resetDialIfNeeded() {
    if (SafeState.SafeDialRotation > 3600 || SafeState.SafeDialRotation < -3600) {
        SafeState.SafeDialRotation = 0;
        $("#dialcore").css({
            transition: "none",
            transform: "rotate(" + SafeState.SafeDialRotation / 10 + "deg)",
        });
        return true;
    }
}

function rotateDialAnimation() {
    $("#dialcore").css({
        transition: "transform .1s ease-in-out",
        transform: "rotate(" + SafeState.SafeDialRotation / 10 + "deg)",
    });
}

function resetMinigame() {
    SafeState.timer = Date.now() + 1500;
    SafeState.CurrentPin = 1;
    SafeState.onPin = false;
    SafeState.currentDirection = "left";
    SafeState.SafeCombinations = Object.create(SafeState.CurrentSafeCombinations);
    SafeState.SafeDialRotation = 0;
    Sounds.TUMBLER_RESET.play();
    $("#dialcore").css({
        transition: "transform .8s ease-in-out",
        transform: "rotate(" + SafeState.SafeDialRotation / 10 + "deg)",
    });
}

function handleWindowMessage(event) {
    if (event.data.action === "open") {
        $(".dial").fadeIn();
        initializeSafeCombinations(event.data.number, event.data.type);
        resetMinigame();
    }
}

function initializeSafeCombinations(number, type) {
    let used = {};
    if (type == "table") {
        for (let index = 1; index <= number.length; index++) {
            SafeState.SafeCombinations[index] = { value: number[index - 1], status: true };
        }
    } else {
        for (let index = 1; index <= number; index++) {
            let random = getRandomInt(1, 99);
            while (used[random]) {
                random = getRandomInt(1, 99);
            }
            used[random] = true;
            blockAdjacentNumbers(used, random);
            SafeState.SafeCombinations[index] = { value: random, status: true };
        }
    }
    SafeState.CurrentSafeCombinations = Object.create(SafeState.SafeCombinations);
}

function blockAdjacentNumbers(used, random) {
    for (let i = random - 5; i <= random + 5; i++) {
        if (i >= 0 && i <= 99) {
            used[i] = true;
        }
    }
}

function getRandomInt(min, max) {
    min = Math.ceil(min);
    max = Math.floor(max);
    return Math.floor(Math.random() * (max - min)) + min;
}

function getCurrentSafeDialNumber(currentDialAngle) {
    let number = currentDialAngle / DIAL_ROTATION_MULTIPLIER;
    if (number > 0) {
        number = 100 - number;
    }
    return Math.abs(number);
}