fun main() {
    val inputString: String = "Hello World! My name is Kaleb."
    val (wordCount, uppercaseCount, vowelCount) = analyzeString(inputString)
    println("Number of words: $wordCount")
    println("Number of uppercase letters: $uppercaseCount")
    println("Number of vowels: $vowelCount")
}

fun analyzeString(input: String): Triple<Int, Int, Int> {
    val words = input.split("\\s+".toRegex())
    val uppercaseCount = input.count { it.isUpperCase() }
    val vowelCount = input.count { it.toLowerCase() in "aeiou" }
    return Triple(words.size, uppercaseCount, vowelCount)
}
