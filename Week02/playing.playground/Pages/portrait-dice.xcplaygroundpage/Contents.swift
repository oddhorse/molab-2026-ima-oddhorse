/**
 portrait-dice
 by oddhorse / john trinh
 cubes up a picture and arranges the pieces to make four of em
 */

import UIKit

let ui1 = #imageLiteral(resourceName: "oddhorse 2026 pfp face mog extended crunch big.JPG")

// how many pieces should we cut picture into?
// MUST BE DIVISIBLE BY 2
let div: CGFloat = 16

// size of all outputs
let imgSize = CGSize(width: 1000, height: 1000)

let renderer = UIGraphicsImageRenderer(size: imgSize)

// CUT INTO PIECES
let sz = CGSize(width: imgSize.width / div, height: imgSize.height / div)
var pieces: [[UIImage]] = []
for i in 0..<Int(div) {
    var pieceRow: [UIImage] = []
    for j in 0..<Int(div) {
        var fli = CGFloat(i)
        var flj = CGFloat(j)
        let pieceRend = UIGraphicsImageRenderer(size: sz)
        let img = pieceRend.image { (context) in
            ui1.draw(in: CGRect(x: sz.width * flj * -1, y: sz.height * fli * -1, width: imgSize.width, height: imgSize.height))
        }
        pieceRow.append(img)
    }
    pieces.append(pieceRow)
}

// SKINNY PIECES
var skinnyPieces = pieces

for i in 0..<Int(div) {
    
    for j in 1...Int(div)/2 {
        let it = skinnyPieces[i].remove(at: j)
        skinnyPieces[i].append(it)
    }
}

let skinny = renderer.image { (context) in
    // stitch into final image here
    for i in 0..<Int(div) {
        for j in 0..<Int(div) {
            var fli = CGFloat(i)
            var flj = CGFloat(j)
            skinnyPieces[i][j].draw(in: CGRect(x: sz.width * flj, y: sz.height * fli, width: sz.width, height: sz.height))
        }
    }
}


// QUAD PIECES
var quadPieces = skinnyPieces
for i in 1...Int(div)/2 {
    let it = quadPieces.remove(at: i)
    quadPieces.append(it)
}

let quad = renderer.image { (context) in
    // stitch into final image here
    for i in 0..<Int(div) {
        for j in 0..<Int(div) {
            var fli = CGFloat(i)
            var flj = CGFloat(j)
            quadPieces[i][j].draw(in: CGRect(x: sz.width * flj, y: sz.height * fli, width: sz.width, height: sz.height))
        }
    }
}

ui1
skinny
quad
