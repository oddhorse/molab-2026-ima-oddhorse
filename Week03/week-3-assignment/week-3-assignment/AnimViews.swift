//
//  ContentView.swift
//  week-3-assignment
//
//  Created by john on 9/24/26.
//

import SwiftUI

let animInterval = 0.10
let lineWidth = 20.0
let dotBoundSize = 20.0
let gridSpace = 40.0
var gsize: CGSize = .zero;
var padsize: CGSize = .zero;

var loc = CGPoint.zero;

var gridHeight = Double(Int.random(in: 1...15));

struct Dot {
    var path: Path;
    var color: Color;
}
var dots: [Dot] = []

struct AnimViewBW: View {
    var body: some View {
        TimelineView(.animation(minimumInterval: animInterval)) { timeline in
            Canvas { context, size in
                print(dots.count)
                // print("size", size)
                gsize = CGSize(width: gridSpace * Double(Int.random(in: 1...8)), height: gridSpace * gridHeight)
                padsize = CGSize(width: (size.width - gsize.width) / 2, height: (size.height - gsize.height) / 2)
                if loc.equalTo(CGPoint.zero) {
                    loc = CGPoint(x: padsize.width, y: padsize.height)
                }
              
                // Add a path and random color to paths array
                let path = newDot(loc);
                let color = Color(hue: 0.0, saturation: 0.0, brightness: Double.random(in: 0.0...1.0))
                dots.append(Dot(path: path, color: color));
                
                // Draw all the paths in paths array
                for p in dots {
                  let style = StrokeStyle(lineWidth: lineWidth, lineCap: .round);
                  context.stroke(p.path, with: .color(p.color), style: style)
                }
                
                // Advance to next location
                loc.x += gridSpace;
                if loc.x > gsize.width + padsize.width {
                    loc.x = padsize.width;
                  loc.y += gridSpace;
                    if loc.y > gsize.height + padsize.height {
                        loc.y = padsize.height
                        dots = []
                        gridHeight = Double(Int.random(in: 1...15))
                  }
                }
                // must read to trigger update
                _ = timeline.date
              }
        }
    }
}

struct AnimViewColor: View {
    var body: some View {
        TimelineView(.animation(minimumInterval: animInterval)) { timeline in
            Canvas { context, size in
                print(dots.count)
                // print("size", size)
                gsize = CGSize(width: gridSpace * Double(Int.random(in: 1...8)), height: gridSpace * gridHeight)
                padsize = CGSize(width: (size.width - gsize.width) / 2, height: (size.height - gsize.height) / 2)
                if loc.equalTo(CGPoint.zero) {
                    loc = CGPoint(x: padsize.width, y: padsize.height)
                }
              
                // Add a path and random color to paths array
                let path = newDot(loc);
                let color = Color(hue: Double.random(in: 0.0...1.0), saturation: 1.0, brightness: 1.0)
                dots.append(Dot(path: path, color: color));
                
                // Draw all the paths in paths array
                for p in dots {
                  let style = StrokeStyle(lineWidth: lineWidth, lineCap: .round);
                  context.stroke(p.path, with: .color(p.color), style: style)
                }
                
                // Advance to next location
                loc.x += gridSpace;
                if loc.x > gsize.width + padsize.width {
                    loc.x = padsize.width;
                  loc.y += gridSpace;
                    if loc.y > gsize.height + padsize.height {
                        loc.y = padsize.height
                        dots = []
                        gridHeight = Double(Int.random(in: 1...15))
                  }
                }
                // must read to trigger update
                _ = timeline.date
              }
        }
    }
}

func newDot(_ p: CGPoint) -> Path {
  var path = Path()
  let x = p.x - dotBoundSize/2;
    let y = p.y - dotBoundSize/2;
  path.addEllipse(in: CGRect(x: x, y: y, width: dotBoundSize, height: dotBoundSize))
  return path;
}

#Preview {
    ContentView()
}
