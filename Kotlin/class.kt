class BankAccount(val accountNumber: String, var balance: Double) {
    
    fun deposit(amount: Double) {
        if (amount > 0) {
            balance += amount
            println("Deposit of $$amount successful.")
        } else {
            println("Invalid deposit amount. Please enter a positive amount.")
        }
    }
    
    fun withdraw(amount: Double) {
        if (amount > 0) {
            if (amount <= balance) {
                balance -= amount
                println("Withdrawal of $$amount successful.")
            } else {
                println("Insufficient balance. Cannot withdraw $$amount.")
            }
        } else {
            println("Invalid withdrawal amount. Please enter a positive amount.")
        }
    }
    
    fun printBalance() {
        println("Current balance: $$balance")
    }
}

fun main() {
    val account = BankAccount("120000239", 1000.0)
    
    account.deposit(500.0)
    account.withdraw(200.0)
    account.printBalance()
}
