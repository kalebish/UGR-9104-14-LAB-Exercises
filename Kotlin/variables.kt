fun main() {
    println("Enter the first number:")
    val number1: Double? = readLine()?.toDoubleOrNull()

    println("Enter the second number:")
    val number2: Double? = readLine()?.toDoubleOrNull()

    if (number1 == null || number2 == null) {
        println("Invalid input. Please enter valid numbers.")
        return
    }

    println("Enter the operation (+ for addition, - for subtraction, * for multiplication, / for division):")
    val operation: String? = readLine()

    val result = when (operation) {
        "+" -> number1 + number2
        "-" -> number1 - number2
        "*" -> number1 * number2
        "/" -> {
            if (number2 == 0.0) {
                println("Error: Division by zero!")
                return
            }
            number1 / number2
        }
        else -> {
            println("Invalid operation selected.")
            return
        }
    }

    println("Result: $result")
}
