/*Yiming Xu
 10438422 */
import Cocoa

var balance: Double = 1000.0
var interest: Double = 0.0
var totalInterest: Double = 0.0
var finalPayment: Double = 0.0
var months: Int = 0

//let format = Double(format: "%.2f", interest)

repeat{
if balance > 500 {
    interest = balance * 0.02
} else{
    interest = balance * 0.01
}
balance = balance - 100 + interest
months += 1
print("Month\(months)")
    print("The interest of this month is:  \(interest)")
print("Your balance is \(balance) now\n")
totalInterest = totalInterest + interest
} while balance > 0 && months < 11

print("Month\(months+1)")
print("You need to pay \(balance) as the last payment\n")

finalPayment = 1000 + totalInterest

months = 0

while finalPayment > 0 {
    finalPayment = finalPayment - 100
    months += 1
}
print("The total months to pay back loan: \(months)" )
