fun main() {
    val strings = listOf("apple", "banana", "orange")
    val numbers = listOf(10, 20, 30, 40, 50)
    
    println("Original list of strings: $strings")
    println("Strings after applying uppercase transformation: ${transformToUppercase(strings)}")
    
    val threshold = 25
    println("\nOriginal list of numbers: $numbers")
    println("Numbers greater than $threshold: ${filterNumbersGreaterThan(numbers, threshold)}")
    
    println("\nSum of numbers: ${calculateSum(numbers)}")
}

fun transformToUppercase(strings: List<String>): List<String> {
    return strings.map { it.toUpperCase() }
}

fun filterNumbersGreaterThan(numbers: List<Int>, threshold: Int): List<Int> {
    return numbers.filter { it > threshold }
}

fun calculateSum(numbers: List<Int>): Int {
    return numbers.reduce { acc, num -> acc + num }
}
