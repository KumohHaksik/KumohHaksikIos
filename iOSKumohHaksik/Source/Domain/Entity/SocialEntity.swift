//
//  SocialEntity.swift
//  iOSKumohHaksik
//
//  Created by 신효성 on 6/4/24.
//
import Foundation

struct User {
    let name: String
    let iocn: String
    let title: String //칭호
    
    let isblock: Bool
}

struct UserDetail {
    let followed: Bool
    let follwing: Int
    let follower: Int
    
    let totalPostNReply: Int // <- 이건 다시 생각해 봐야할 듯
    
    let routines: [Routine]
}

struct SocialPost {
    let user: User
    let content: String
    let images: [String]
    let timestamp: Date
    
    let like: Int?
    let reply: Int?
    let share: Int?
}

//이건 좀 고민 해봐야할 듯 굳이 필요하지 않은 엔티티일 수도?
struct SocialPostDetail {
    let post: SocialPost
    let replys: [Reply]
}

struct Reply {
    let user: User
    let content: String
    let timestamp: Date
    
    let like: Int?
    let reply: Int?
}

struct Routine {
    var title: String
    var time: Date?
    var subTitle: String? //메모와 서브 타이틀의 차이점은?
    //var memo: String?
    //var color: ToduckColor
    //var category: String?
    //var isPublic: Bool
    
    //var isRepeating: Bool
    //var repeatDays: [Weekday]?
    //var alarm: Bool
    //var alarmTimes: [AlarmTime]?
    //var recommendedRoutines: [RecommendedRoutine]?
}

struct RoutineDetail {

}

struct RoutineSetting {

}
