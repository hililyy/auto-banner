//
//  TimerManager.swift
//  AutoBanner
//
//  Created by 강조은 on 2023/11/17.
//

import Foundation

class TimerManager: TimerProtocol {
    var timer: Timer?
    var runTime: Double = 0.0
    var info: TimerInfo?
    
    var oneSecondHandler: (Double) -> () = { _ in }
    var endHandler: (Double) -> () = { _ in }
    
    func initalize(timerInfo: TimerInfo) {
        info = timerInfo
        
        guard let info else { return }
        
        if timerInfo.type == .down {
            runTime = info.durationTime
        }
    }
    
    func start() {
        guard let info,
              let timeInterval = info.timeInterval else { return }
        
        timer = Timer.scheduledTimer(timeInterval: timeInterval,
                                     target: self,
                                     selector: #selector(runingTimer),
                                     userInfo: nil,
                                     repeats: true)
    }
    
    @objc func runingTimer() {
        guard let info,
              let timeInterval = info.timeInterval else { return }
        
        switch info.type {
        case .up:
            runTime += timeInterval
            if info.durationTime <= runTime {
                end()
            }
        case .down:
            runTime -= timeInterval
            if runTime <= 0 {
                end()
            }
        }
        
        oneSecondHandler(runTime)
    }
    
    func reset() {
        runTime = 0
        timer?.invalidate()
    }
    
    func restart() {
        if info?.type == .down {
            runTime = info?.durationTime ?? 0
        } else {
            runTime = 0
        }
    }
    
    func end() {
        guard let info else { return }
        
        if info.isRepeat {
            restart()
        }
        endHandler(runTime)
    }
}


protocol TimerProtocol {
    var runTime: Double { get set }
    var info: TimerInfo? { get set }
}

enum TimerType {
    case up
    case down
}

struct TimerInfo {
    var timeInterval: Double? = 1.0
    var type: TimerType
    var isRepeat: Bool
    var durationTime: Double
}
