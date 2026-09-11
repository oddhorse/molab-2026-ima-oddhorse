let errors: [Character: [Character]] = [
    "1": ["`", "2"],
    "2": ["1", "3"],
    "3": ["2", "4"],
    "4": ["3", "5"],
    "5": ["4", "6"],
    "6": ["5", "7"],
    "7": ["6", "8"],
    "8": ["7", "9"],
    "9": ["8", "0"],
    "0": ["9", "-"],
    "-": ["0", "="],
    "=": ["-"],
    "q": ["w"],
    "w": ["q", "e"],
    "e": ["w", "r"],
    "r": ["e", "t"],
    "t": ["r", "y"],
    "y": ["t", "u"],
    "u": ["y", "i"],
    "i": ["u", "o"],
    "o": ["i", "p"],
    "p": ["o", "["],
    "[": ["p", "]"],
    "]": ["[", "\\"],
    "\\": ["]"],
    "a": ["s"],
    "s": ["a", "d"],
    "d": ["s", "f"],
    "f": ["d", "g"],
    "g": ["f", "h"],
    "h": ["g", "j"],
    "j": ["h", "k"],
    "k": ["j", "l"],
    "l": ["k", ";"],
    ";": ["l", "'"],
    "\"": [";"],
    "z": ["x"],
    "x": ["z", "c"],
    "c": ["x", "v"],
    "v": ["c", "b"],
    "b": ["v", "n"],
    "n": ["b", "m"],
    "m": ["n", ","],
    ",": ["m", "."],
    ".": [",", "/"],
    "/": ["."],
    "~": ["1"],
    "!": ["~", "@"],
    "@": ["!", "#"],
    "#": ["@", "$"],
    "$": ["#", "%"],
    "%": ["$", "^"],
    "^": ["%", "&"],
    "&": ["^", "*"],
    "*": ["&", "("],
    "(": ["*", ")"],
    ")": ["(", "_"],
    "_": [")", "+"],
    "+": ["_"],
]

let text = """
Vice President JD Vance took the unusual step over the spring and summer of calling U.S. military commanders in the Middle East, Europe and Asia directly, seeking their unvarnished assessments of the Iran war, according to current and former officials.

Mr. Vance, who opposed the war from the outset and was charged by President Trump with helping to end the conflict, wanted the commanders’ individual judgments, in their own words, before they were consolidated into a Pentagon view.

The conversations delved into an array of issues related to the war, including its objectives, tactics, casualty estimates, what the Iranians would do in the Strait of Hormuz, how adaptable they had become and how much punishment their government could absorb. Mr. Vance also asked for a detailed accounting of what remained in the commanders’ stockpiles, and how the transfer of weapons to the Middle East would affect their ability to deter China, Russia and North Korea.

On that last point, the commanders were blunt. They were most worried about their depleted stocks of Patriot interceptors, the backbone of their air defenses. By late spring, one theater was down to fewer than 100 of them. The war had also exhausted the theater’s supplies of the Army Tactical Missile Systems, which can reach 190 miles, along with stores of the Precision Strike Missiles, which were meant to replace them. Stocks of critical munitions such as these, they told the vice president, were the lowest they had ever seen.
"""

var newText = ""

func makeError(charIn: Character) -> Character {
    let opts = errors[charIn]
    if let opts {
        return opts[Int.random(in: 0...(opts.count - 1))]
    }
    return charIn
}

for char in text {
    if errors.keys.contains(char) {
        let roll = Int.random(in: 1...7)
        if roll == 1 {
            newText += String(makeError(charIn: char))
            continue
        }
    }
    
    newText += String(char)
}

print(newText)
