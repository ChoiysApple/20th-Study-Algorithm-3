import Foundation

func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
    
    var reportedBy: [String: [String]] = [:]
    var mailCount: [String: Int] = [:]
    id_list.forEach {
        reportedBy[$0] = []
        mailCount[$0] = 0
    }
    
    for input in report {
        let user = input.split(separator: " ")
        let reporter = String(user[0])
        let reportee = String(user[1])
        
        let list = reportedBy[reportee]!
        if !list.contains(reporter) {
            reportedBy[reportee] = list + [reporter]
        }
    }
    
    for list in reportedBy {

        if list.value.count >= k {
            for reporter in list.value {
                mailCount[reporter] = mailCount[reporter]! + 1
            }
        }
    }
    
    var result: [Int] = []
    id_list.forEach {
        result.append(mailCount[$0]!)
    }
    
    return result
}
